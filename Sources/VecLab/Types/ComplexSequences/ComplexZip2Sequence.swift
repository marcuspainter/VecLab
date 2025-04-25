//
//  ComplexZip2Sequence.swift
//  VecLab
//
//  Created by Marcus Painter on 25/04/2025.
//

public struct ComplexZip2Sequence: Sequence, IteratorProtocol {
    public typealias Element = (ComplexDouble, ComplexDouble)

    let sequence1: ComplexDoubleArray
    let sequence2: ComplexDoubleArray
    var currentIndex: Int = 0
    let count: Int

    public init(sequence1: ComplexDoubleArray, sequence2: ComplexDoubleArray) {
        self.sequence1 = sequence1
        self.sequence2 = sequence2
        count = Swift.min(sequence1.count, sequence2.count)
    }

    public mutating func next() -> (ComplexDouble, ComplexDouble)? {
        guard currentIndex < count else {
            return nil
        }
        defer {
            currentIndex += 1
        }

        return (sequence1[currentIndex], sequence2[currentIndex])
    }

    public func map(_ transform: (ComplexDouble, ComplexDouble) throws -> ComplexDouble) rethrows -> ComplexDoubleArray {
        var result = ComplexDoubleArray(count: sequence1.count)
        for index in 0 ..< count {
            let newValue = try transform(sequence1[index], sequence2[index])
            result[index] = newValue
        }
        return result
    }

    public func compactMap(_ transform: (ComplexDouble, ComplexDouble) -> ComplexDouble?) -> ComplexDoubleArray {
        var result = ComplexDoubleArray()

        for index in 0 ..< count {
            let z1 = sequence1[index]
            let z2 = sequence2[index]
            if let mapped = transform(z1, z2) {
                result.append(mapped)
            }
        }
        return result
    }

    public func forEach(_ body: (ComplexDouble, ComplexDouble) throws -> Void) rethrows {
        for index in 0 ..< count {
            try body(sequence1[index], sequence2[index])
        }
    }
}
