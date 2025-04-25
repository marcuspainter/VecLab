//
//  ComplexEnumeratedSequence.swift
//  VecLab
//
//  Created by Marcus Painter on 25/04/2025.
//

/// The result of enumerated()
public struct ComplexEnumeratedSequence: Sequence, IteratorProtocol {
    public typealias Element = (Int, ComplexDouble)

    let sequence: ComplexDoubleArray
    var currentIndex = 0

    public mutating func next() -> Element? {
        guard currentIndex < sequence.count else {
            return nil
        }
        defer {
            currentIndex += 1
        }
        return (currentIndex, sequence[currentIndex])
    }

    public init(sequence: ComplexDoubleArray) {
        self.sequence = sequence
    }

    public func map(_ transform: (Int, ComplexDouble) throws -> ComplexDouble) rethrows -> ComplexDoubleArray {
        var result = ComplexDoubleArray(count: sequence.count)
        for index in 0 ..< sequence.count {
            let newValue = try transform(index, sequence[index])
            result[index] = newValue
        }
        return result
    }

    public func map(_ transform: ((Int, ComplexDouble)) throws -> ComplexDouble) rethrows -> ComplexDoubleArray {
        var result = ComplexDoubleArray(count: sequence.count)
        for index in 0 ..< sequence.count {
            let newValue = try transform((index, sequence[index]))
            result[index] = newValue
        }
        return result
    }

    public func compactMap(_ transform: (ComplexDouble) -> ComplexDouble?) -> ComplexDoubleArray {
        var result = ComplexDoubleArray()

        for index in 0 ..< sequence.count {
            let z = sequence[index]
            if let mapped = transform(z) {
                result.append(mapped)
            }
        }
        return result
    }

    public func forEach(_ body: (Int, ComplexDouble) throws -> Void) rethrows {
        for index in 0 ..< sequence.count {
            try body(index, sequence[index])
        }
    }
}

/*
 // Test if a function can return a ComplexDoubleArray
 extension EnumeratedSequence where Base == ComplexDoubleArray {
     public func map<T, E>(_ transform: (Iterator.Element) throws(E) -> T) throws(E) -> ComplexDoubleArray where E : Error {
         return ComplexDoubleArray(count: 10)
     }
 }
 */

/*
 // Specialized map() function for ComplexDoubleArray
 // (Index, Element) params to map closure
 extension EnumeratedSequence where Base == ComplexDoubleArray {
     public func map(
         _ transform: (Int, ComplexDouble) throws -> ComplexDouble
     ) rethrows -> ComplexDoubleArray {
         // Don't know count for array
         var result = ComplexDoubleArray()
         for (index, value) in self {
             let t = try transform(index, value)
             result.append(t)
         }
         return result
     }
 }

 */
