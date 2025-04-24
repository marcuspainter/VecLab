//
//  ComplexDoubleArray+Other.swift
//  VecLab
//
//  Created by Marcus Painter on 24/04/2025.
//

/* This was really tricky to get working */


/*
 // Doesn't work
extension ComplexDoubleArray {
    public func enumerated() -> EnumeratedSequence<ComplexDoubleArray> {
    }
}
*/

/*
// Test if a function can return a ComplexDoubleArray
extension EnumeratedSequence where Base == ComplexDoubleArray {
    public func map<T, E>(_ transform: (Iterator.Element) throws(E) -> T) throws(E) -> ComplexDoubleArray where E : Error {
        return ComplexDoubleArray(count: 10)
    }
}
*/

// Specialized functions for ComplexDoubleArray
// (Index, Element) params to map closure
extension EnumeratedSequence where Base == ComplexDoubleArray {
    public func map(
        _ transform: (Int, ComplexDouble) throws -> ComplexDouble
    ) rethrows -> ComplexDoubleArray {
        var result = ComplexDoubleArray()
        for (i, value) in self {
            let t = try transform(i, value)
            result.append(t)
        }
        return result
    }
}

