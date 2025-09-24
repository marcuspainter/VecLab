# Development Notes

## Migration: Prefer interleaved [Complex] for new APIs (keep SplitComplex for compatibility)

We are standardizing complex-number buffers for new code to use an interleaved `[Complex]` layout (AoS). `SplitComplexArray` remains supported for compatibility and interop, but should not be expanded. New public APIs must accept (and preferably return) `[Complex]`.

### Rationale
- Simpler API surface: pass `[Complex]` rather than parallel real/imag arrays.
- Fewer bounds/index bugs and better readability.
- Works cleanly with Swift value semantics and `UnsafeBufferPointer<Complex>` when needed.

### Guidelines
- New code and new public APIs must accept/return `Array<Complex>` (or `ContiguousArray<Complex>`).
- Keep `SplitComplexArray` for existing code paths and interop, but avoid adding new usages unless strictly required.
- Where existing APIs currently take `SplitComplexArray`, prefer adding an overload that takes `[Complex]` and internally adapts as needed.
- If performance-critical code needs raw pointers, prefer temporary views over permanent split storage:
  - Use `withUnsafe[Mutable]BufferPointer` on `[Complex]` and derive real/imag pointers as needed, or convert into split scratch buffers locally.
- Document any remaining or new need for split layout in the call site with a brief rationale.
- Do not use \_\_CLPK_integer with LAPACK.
- Package defines ACCELERATE_NEW_LAPACK and ACCELERATE_LAPACK_ILP64. With ILP64 enabled, LAPACK’s “integer” type is 64‑bit, and the Swift overlay imports those parameters as Swift’s Int. So yes, use Int (not Int32) for all LAPACK integer parameters and arrays (e.g. m, n, lda, ldu, ldvt, lwork, info, and iwork).


### Interop with Accelerate/vDSP
Some vDSP functions still prefer split-complex (`DSPSplitComplex`/`DSPDoubleSplitComplex`). When interop is necessary:

- Convert on the fly from interleaved to split-complex without permanently storing split buffers.
- Reuse stack or scratch buffers where possible.

Example pattern (double-precision):

```swift
struct Complex {
    var real: Double
    var imag: Double
}

