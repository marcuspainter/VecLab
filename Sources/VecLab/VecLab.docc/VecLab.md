# ``VecLab``

A real/complex vector library in Swift.

## New Version 2.0

- New `ComplexDouble` and `ComplexDoubleArray` structs.
- Array range indexing and slicing.
- `ComplexDoubleArray` conforms to collection protocol.

## Overview

VecLab is a Swift Package for real and complex vector operations with NumPy and MATLAB-style functions.

- Overloaded arithmetic operators.
- Mixed real and complex, scalars and vectors.
- Basic MATLAB-style functions.
- Vectorized using Accelerate and vDSP. 
- FFT of 2, 3 and 5 factors.

Full documentation can be found on the [Swift Package Index](https://swiftpackageindex.com/marcuspainter/VecLab/documentation/veclab).

### Example Usage

The library includes an FFT function using Accelerate, but here is an example of creating a complex FFT using a 
recursive algorithm and its NumPy and MATLAB equivalents:

### Swift

```swift
// FFTX Fast Finite Fourier Transform.
public func fftx(_ x: ComplexArray) -> ComplexArray {
    let n = length(x)
    let omega = exp(-2.i * .pi / Double(n))
    if rem(n, 2) == 0 {
        // Recursive divide and conquer.
        let k = vector(0 ... (n / 2 - 1))
        let w = omega ** k
        let u = fftx(x[0 ..< n - 1, 2])
        let v = w * fftx(x[1 ..< n, 2])
        return cat(u + v, u - v)
    } else {
        return x
    }
}
```
Here's a breakdown of the real and complex vector operations in the function:

1. `x` is the complex input array.
2. `omega` is a complex exponential number. `Real.i` is the imaginary unit *i*.
3. Tests if the input `x` length is divisible by 2.
4. `k` is a real vector from 0, 1, 2,... n/2-1.
5. `w` is the complex vector of `omega` to the power of vector `k`.
6. `u` is the complex result of a recursive call with even `x`.
7. `v` is the complex result of a recursive call with odd `x`.
8. The result is the concatenation of the complex vector addition and subtraction of `u` and `v`.
9. The recursion ends when there is one element in the input array. The FFT of a single element is itself.

### NumPy
```python
import numpy as np

def fftx(x):
    """
    FFTX Fast Finite Fourier Transform.
    """
    n = len(x)
    omega = np.exp(-2j * np.pi / n)
    
    if n % 2 == 0:
        # Recursive divide and conquer
        k = np.arange(n//2)
        w = omega ** k
        u = fftx(x[::2])
        v = w * fftx(x[1::2])
        y = np.concatenate([u + v, u - v])
    else:
        y = x
    
    return y
```
### MATLAB

```matlab
function y = fftx(x)
% FFTX Fast Finite Fourier Transform.
n = length(x);
omega = exp(-2*pi*i/n);
if rem(n,2) == 0
    % Recursive divide and conquer.
    k = (0:n/2-1)';
    w = omega.^k;
    u = fftx(x(1:2:n-1));
    v = w.*fftx(x(2:2:n));
    y = [u+v; u-v];
else
    y = x
end
```

### Library Convention

```swift
public typealias Real = Double
public typealias RealArray = [Real]
public typealias Complex = ComplexDouble
public typealias ComplexArray = ComplexDoubleArray
```

### Real Numbers

Real numbers are `Double` types.

### Real Arrays

Real arrays are just a normal Swift `Array` of `Double`.

### Complex Numbers

Complex numbers are defined as a struct `ComplexDouble` of two real numbers, representing the real and imaginary parts
 of the number. 

```swift
public struct ComplexDouble { 
    /// Real part.
    public var real: Double
    /// Imaginary part.
    public var imag: Double
}
```
### Complex Arrays

A complex array now has its own struct type, `ComplexDouble`. It follows the Collection protocol and is not a true
Swift array of `[ComplexDouble]`. Internally, the real and imaginary arrays are maintained for compatibility 
use with vDSP vector functions which use the `DSPDoubleSplitComplex` type.
 
The collection can be indexed that returns a `ComplexDouble`. 

```swift
let realArray = [1.0, 2.0, 3.0, 4.0]
let imagArray = [1.0, 2.0, 3.0, 4.0]
let complexArray = ComplexArray(realArray, imagArray)
```

### The Imaginary Unit

The imaginary unit, `i`, is defined as an extension to `Real`, similar to other Swift constants such as pi. 
Alternatives are as a extension of Double, Float.

These are all equivalent to 2+3i:

```swift
let c1 = 2.0 + 3.0 * Real.i
let c2 = 2.0 + 3.i
let c3 = Complex(2.0, 3.0)
```
It can be used in any expression. This is a complex exponential:

```swift
let phi = 100.0
let c1 = exp(Real.i * 2 * Real.pi * phi)
let c2 = exp(1.i * 2 * Real.pi * phi)
let c3 = exp(2.i * Real.pi * phi)
```

### Ranges

Ranges can be defined using the Swift `Range` or `ClosedRange` types but with the addition of an optional `by` value.
This has been implemented as an extension to the `Array` type.

Swift style:

```swift
let t = [Double](0...<100)
let s = [Double](1...100, 2)
```
### Operators

Overloaded operators for scalar and vectors.

|Operator|Description|
|---|---|
|+| Add|
|-| Subtract|
|\*| Multiply|
|/| Divide|
|\*\*| Power|
|\*~|Right conjugate multiply: a \* conj(b)|
|~\*|Left conjugate multiply: conj(a) \* b|
| - |Unary minus|

### Functions

|Group|Functions|
|---|---|
|Arrays| arange, cat, circshift, dot, flip, length, ones, paddata, repelem, resize, slice, trimdata, zeros|
|Basic| abs, cumprod, cumsum, disp, iterate, norm, prod, sign, sum|
|Complex| abs, angle, conj, cplxpair, imag, real, unwrap, wrapTo2Pi, wrapToPi|
|Conversion| cart2pol, cart2sph, d2f, db2mag, db2pow, deg2rad, f2d, mag2db, pol2cart, pow2db, rad2deg, sph2cart|
|Discrete| factor, factorial, gcd, isprime, lcm, nextprime, nchoosek, perms, prevprime, primes|
|Exponents| exp, expi, log, log2, log10, nextpow2, sqrt|
|FFT| dft, dftr, fft, fftr, fftshift, fftsymmetric, idft, idftr, ifft, ifftr, ifftshift|
|Filter| biquad, freqz, filter|
|Integration| diff, gradient, trapz|
|Interpolation| interp1, interpft, sincresample|
|Modulo| ceil, fix, floor, mod, rem, round, trunc|
|Optimization| fminbnd, fminsearch|
|Power| pow|
|Random| awgn, rand, randn, rng|
|Smoothing| hampel, medfilt1|
|Space| freqspace, linspace, logspace|
|Special| besseli0, sinc|
|Statistics| histcounts, max, maxindex, mean, median, min, minindex, mode, rms, stddev, variance|
|Timing| tic, toc, timeit|
|Trigonometry| acos, asin, atan, atan2, cos, sin, tan|
|Window| blackman, blackmanharris, flattopwin, gausswin, hamming, hann, kaiser, tukeywin, rectwin|

## Topics

### Essentials 
- <doc:GettingStarted>
- <doc:Migration>
- <doc:ArrayConcatenation>
- <doc:ArrayIndexing>
- <doc:FourierTransform>

### Vector Creation
- <doc:RealCreation>

### Operators
- <doc:MathOperators>

### New
- <doc:_New>

### Functions
- <doc:VectorFunctions>
- <doc:BasicFunctions>
- <doc:ComplexFunctions>
- <doc:Conversion>
- <doc:Discrete>
- <doc:Exponents>
- <doc:Filter>
- <doc:FFT>
- <doc:Integration>
- <doc:Interpolation>
- <doc:Modulo>
- <doc:Optimization>
- <doc:Polynomials>
- <doc:Power>
- <doc:Random>
- <doc:Smoothing>
- <doc:Space>
- <doc:Special>
- <doc:Statistics>
- <doc:Timing>
- <doc:Trigonometry>
- <doc:Windows>
