//
//  CoreVector.swift
//  VecLab
//
//  Created by Marcus Painter on 17/09/2025.
//

import Foundation

enum CoreVector {
    
    
    static func add(_ a: [Double], _ b: [Double]) -> [Double] {
        precondition(a.count == b.count, "Mismatched lengths in add: [Double] + [Double]")
        return [Double](unsafeUninitializedCapacity: a.count) { buffer, initializedCount in
            initializedCount = add(a, b, intoBuffer: buffer)
        }
    }

    @inlinable
    static func add(_ a: [Double], _ b: [Double], intoBuffer c: UnsafeMutableBufferPointer<Double>) -> Int {
        precondition(a.count == b.count, "Mismatched lengths in add: [Complex] + [Complex]")
        for i in 0..<a.count {
            c[i] = a[i] + b[i]
        }
        return a.count
    }

    @inlinable
    static func add(_ a: [Double], _ b: Double) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i] = a[i] + b
            }
            initializedCount = a.count
        }

    }

    @inlinable
    static func add(_ a: Double, _ b: [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: b.count) { c, initializedCount in
            for i in 0..<b.count {
                c[i] = a + b[i]
            }
            initializedCount = b.count
        }
    }
    
    // MARK: Subtract

    @inlinable
    static func subtract(_ a: [Double], _ b: [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { buffer, initializedCount in
            initializedCount = subtract(a, b, intoBuffer: buffer)
        }
    }
    
    @inlinable
    static func subtract(_ a: [Double], _ b: [Double], intoBuffer c: UnsafeMutableBufferPointer<Double>) -> Int {
        precondition(a.count == b.count, "Mismatched lengths in add: [Complex] + [Complex]")
        for i in 0..<a.count {
            c[i] = a[i] - b[i]
        }
        return a.count
    }

    @inlinable
    static func subtract(_ a: [Double], _ b: Double) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i] = a[i] - b
            }
            initializedCount = a.count
        }

    }

    @inlinable
    static func subtract(_ a: Double, _ b: [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: b.count) { c, initializedCount in
            for i in 0..<b.count {
                c[i] = a - b[i]
            }
            initializedCount = b.count
        }
    }
    
    // MARK: multiply
    
    @inlinable
    static func multiply(_ a: [Double], _ b: [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i] = a[i] * b[i]
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func multiply(_ a: [Double], _ b: Double) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i] = a[i] * b
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func multiply(_ a: Double, _ b: [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: b.count) { c, initializedCount in
            for i in 0..<b.count {
                c[i] = a * b[i]
            }
            initializedCount = b.count
        }
    }



    // MARK: divide
    
    @inlinable
    static func divide(_ a: [Double], _ b: Double) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i] = a[i] / b
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func divide(_ a: Double, _ b: [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: b.count) { c, initializedCount in
            for i in 0..<b.count {
                c[i] = a / b[i]
            }
            initializedCount = b.count
        }
    }

    @inlinable
    static func divide(_ a: [Double], _ b: [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i] = a[i] / b[i]
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func unaryMinus(_ a: [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i] = -a[i]
            }
            initializedCount = a.count
        }
    }
}
