//
//  CoreVector.swift
//  VecLab
//
//  Created by Marcus Painter on 17/09/2025.
//

import Foundation

enum CoreVector {

    // MARK: Add

    static func add(_ a: [Double], _ b: [Double]) -> [Double] {
        precondition(a.count == b.count, "Mismatched lengths in: [Double] + [Double]")
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i] = a[i] + b[i]
            }
            initializedCount = a.count
        }
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
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            precondition(a.count == b.count, "Mismatched lengths in: [Double] - [Double]")
            for i in 0..<a.count {
                c[i] = a[i] - b[i]
            }
            initializedCount =  a.count
        }
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

    // MARK: Multiply

    @inlinable
    static func multiply(_ a: [Double], _ b: [Double]) -> [Double] {
        precondition(a.count == b.count, "Mismatched lengths in: [Double] * [Double]")
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

    // MARK: Divide
    
    @inlinable
    static func divide(_ a: [Double], _ b: [Double]) -> [Double] {
        precondition(a.count == b.count, "Mismatched lengths in: [Double] / [Double]")
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i] = a[i] / b[i]
            }
            initializedCount = a.count
        }
    }

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
    
    // MARK: Unary

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
