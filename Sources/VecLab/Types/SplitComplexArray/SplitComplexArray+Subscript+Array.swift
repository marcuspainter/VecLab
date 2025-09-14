//
//  SplitComplexArray+Subscript+Array.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

extension SplitComplexArray {
    /// Access elements using an array of indices
    public subscript(indices: [Int]) -> SplitComplexArray {
        get {
            // Verify all indices are in bounds
            for idx in indices {
                precondition(idx >= 0 && idx < count, "Index \(idx) out of range")
            }
            var slice = SplitComplexArray(count: indices.count)
            for (offset, idx) in indices.enumerated() {
                slice[offset] = self[idx]
            }

            return slice
        }
        set {
            // Verify all indices are in bounds
            for idx in indices {
                precondition(idx >= 0 && idx < count, "Index \(idx) out of range")
            }

            precondition(
                indices.count == newValue.count,
                "Replacement array must have the same count as the indices array"
            )

            for (offset, idx) in indices.enumerated() {
                self[idx] = newValue[offset]
            }
        }
    }
}
