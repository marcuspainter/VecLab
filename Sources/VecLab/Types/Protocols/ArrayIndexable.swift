//
//  ArrayIdexable+Extensions.swift
//  VecLab
//
//  Created by Marcus Painter on 22/04/2025.
//

public protocol ArrayIndexable {
    associatedtype Element
    
    // Required: Regular subscript that the default implementation will use
    subscript(index: Int) -> Element { get set }
    
    // Required: Need to know the count for bounds checking
    var count: Int { get }
    
    // The array-based subscript will be provided by the extension
}


extension ArrayIndexable {
    /// Access elements using an array of indices
    public subscript(indices: [Int]) -> [Element] {
        get {
            // Verify all indices are in bounds
            for idx in indices {
                precondition(idx >= 0 && idx < count, "Index \(idx) out of range")
            }

            return indices.map { self[$0] }
        }
        set {
            // Verify all indices are in bounds
            for idx in indices {
                precondition(idx >= 0 && idx < count, "Index \(idx) out of range")
            }

            precondition(indices.count == newValue.count, "Replacement array must have the same count as the indices array")

            for (offset, idx) in indices.enumerated() {
                self[idx] = newValue[offset]
            }
        }
    }
}

