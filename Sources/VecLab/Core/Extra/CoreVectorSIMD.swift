//
//  CoreVector.swift
//  VecLab
//
//  Created by Marcus Painter on 17/09/2025.
//

import Foundation
import simd

enum CoreVectorSIMD {

    static func add(_ a: borrowing [Double], _ b: borrowing [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            a.withUnsafeBufferPointer { aPtr in
                b.withUnsafeBufferPointer { bPtr in
                    c.withUnsafeMutableBufferPointer { cPtr in
                        let count = a.count
                        let simdCount = count & ~3  // Round down to multiple of 4
                        let simdCount4 = simdCount >> 3  // Divide by 4

                        // Cast memory layout to SIMD4 - zero copy
                        aPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { aSimd in
                            bPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { bSimd in
                                cPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) {
                                    cSimd in

                                    // Callback: aPtr, bPtr, cPtr, aSimd, bSimd, cSimd,

                                    // Direct SIMD operations on reinterpreted memory
                                    for i in 0..<simdCount4 {
                                        cSimd[i] = aSimd[i] + bSimd[i]
                                    }

                                    // Handle remainder elements
                                    for i in simdCount..<count {
                                        cPtr[i] = aPtr[i] + bPtr[i]
                                    }
                                }
                            }
                        }
                    }
                }
            }
            initializedCount = a.count
        }
    }

    static func addScalar(_ a: [Double], _ b: Double) -> [Double] {
        // var c = [Double](repeating: 0.0, count: a.count)
        // for i in 0..<a.count {
        //    c[i] = a[i] + b
        // }
        // return c

        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            a.withUnsafeBufferPointer { aPtr in

                c.withUnsafeMutableBufferPointer { cPtr in
                    let count = a.count
                    let simdCount = count & ~3  // Round down to multiple of 4
                    let simdCount4 = simdCount >> 3  // Divide by 4

                    // Cast memory layout to SIMD4 - zero copy
                    aPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { aSimd in
                        cPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) {
                            cSimd in
                            // Direct SIMD operations on reinterpreted memory

                            let bSimd = SIMD4<Double>(b, b, b, b)
                            for i in 0..<simdCount4 {
                                cSimd[i] = aSimd[i] + bSimd
                            }

                            // Handle remainder elements
                            for i in simdCount..<count {
                                cPtr[i] = aPtr[i] + b
                            }
                        }
                    }
                }
            }
            initializedCount = a.count
        }
    }

    static func subtract(_ a: [Double], _ b: [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            a.withUnsafeBufferPointer { aPtr in
                b.withUnsafeBufferPointer { bPtr in
                    c.withUnsafeMutableBufferPointer { cPtr in
                        let count = a.count
                        let simdCount = count & ~3  // Round down to multiple of 4
                        let simdCount4 = simdCount >> 3  // Divide by 4

                        // Cast memory layout to SIMD4 - zero copy
                        aPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { aSimd in
                            bPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { bSimd in
                                cPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) {
                                    cSimd in
                                    // Direct SIMD operations on reinterpreted memory
                                    for i in 0..<simdCount4 {
                                        cSimd[i] = aSimd[i] - bSimd[i]
                                    }

                                    // Handle remainder elements
                                    for i in simdCount..<count {
                                        cPtr[i] = aPtr[i] - bPtr[i]
                                    }
                                }
                            }
                        }
                    }
                }
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func subtractScalar(_ a: [Double], _ b: Double) -> [Double] {
        var c = [Double](repeating: 0.0, count: a.count)
        for i in 0..<a.count {
            c[i] = a[i] - b
        }
        return c
    }

    @inlinable
    static func subtractScalar(_ a: Double, _ b: [Double]) -> [Double] {
        var c = [Double](repeating: 0.0, count: b.count)
        for i in 0..<b.count {
            c[i] = a - b[i]
        }
        return c
    }

    @inlinable
    static func multiplyScalar(_ a: [Double], _ b: Double) -> [Double] {
        var c = [Double](repeating: 0.0, count: a.count)
        for i in 0..<a.count {
            c[i] = a[i] * b
        }
        return c
    }

    static func multiply(_ a: [Double], _ b: [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            a.withUnsafeBufferPointer { aPtr in
                b.withUnsafeBufferPointer { bPtr in
                    c.withUnsafeMutableBufferPointer { cPtr in
                        let count = a.count
                        let simdCount = count & ~3  // Round down to multiple of 4
                        let simdCount4 = simdCount >> 3  // Divide by 4

                        // Cast memory layout to SIMD4 - zero copy
                        aPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { aSimd in
                            bPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { bSimd in
                                cPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) {
                                    cSimd in

                                    // Direct SIMD operations on reinterpreted memory
                                    for i in 0..<simdCount4 {
                                        cSimd[i] = aSimd[i] * bSimd[i]
                                    }
                                }
                            }
                        }

                        // Handle remainder elements
                        for i in simdCount..<count {
                            cPtr[i] = aPtr[i] * bPtr[i]
                        }
                    }
                }
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func divideScalar(_ a: [Double], _ b: Double) -> [Double] {
        var c = [Double](repeating: 0.0, count: a.count)
        for i in 0..<a.count {
            c[i] = a[i] / b
        }
        return c
    }

    @inlinable
    static func divideScalar(_ a: Double, _ b: [Double]) -> [Double] {
        var c = [Double](repeating: 0.0, count: b.count)
        for i in 0..<b.count {
            c[i] = a / b[i]
        }
        return c
    }

    static func divide(_ a: [Double], _ b: [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            a.withUnsafeBufferPointer { aPtr in
                b.withUnsafeBufferPointer { bPtr in
                    c.withUnsafeMutableBufferPointer { cPtr in
                        let count = a.count
                        let simdCount = count & ~3  // Round down to multiple of 4
                        let simdCount4 = simdCount >> 3  // Divide by 4

                        // Cast memory layout to SIMD4 - zero copy
                        aPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { aSimd in
                            bPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { bSimd in
                                cPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) {
                                    cSimd in
                                    // Direct SIMD operations on reinterpreted memory
                                    for i in 0..<simdCount4 {
                                        cSimd[i] = aSimd[i] / bSimd[i]
                                    }
                                }
                            }
                        }

                        // Handle remainder elements
                        for i in simdCount..<count {
                            cPtr[i] = aPtr[i] / bPtr[i]
                        }
                    }
                }
            }
            initializedCount = a.count
        }
    }

    static func unaryMinus(_ a: [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { cPtr, initializedCount in
            a.withUnsafeBufferPointer { aPtr in
                let count = a.count
                let simdCount = count & ~3  // Round down to multiple of 4
                let simdCount4 = simdCount >> 3  // Divide by 4

                // Cast memory layout to SIMD4 - zero copy
                aPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { aSimd in
                    cPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { cSimd in
                        // Direct SIMD operations on reinterpreted memory
                        for i in 0..<simdCount4 {
                            cSimd[i] = -aSimd[i]
                        }
                    }
                }

                // Handle remainder elements
                for i in simdCount..<count {
                    cPtr[i] = -aPtr[i]
                }
            }
            initializedCount = a.count
        }
    }

    static func sin(_ a: [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { cPtr, initializedCount in
            a.withUnsafeBufferPointer { aPtr in
                let count = a.count
                let simdCount = count & ~3  // Round down to multiple of 4
                let simdCount4 = simdCount >> 3  // Divide by 4

                // Cast memory layout to SIMD4 - zero copy
                aPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { aSimd in
                    cPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { cSimd in
                        // Direct SIMD operations on reinterpreted memory
                        for i in 0..<simdCount4 {
                            cSimd[i] = simd.sin(aSimd[i])
                        }
                    }
                }

                // Handle remainder elements
                for i in simdCount..<count {
                    cPtr[i] = Darwin.sin(aPtr[i])
                }
            }
            initializedCount = a.count
        }
    }

    static func addSIMD(_ a: borrowing [Double], _ b: borrowing [Double]) -> [Double] {
        return SimdOp.binaryOp(a, b) { aPtr, bPtr, cPtr, aSimd, bSimd, cSimd, simdCount, count in
            // SIMD loop
            for i in 0..<aSimd.count {
                cSimd[i] = aSimd[i] + bSimd[i]  // use wrapping add for perf
            }
            // Remainder
            for i in simdCount..<count {
                cPtr[i] = aPtr[i] + bPtr[i]
            }
        }
    }

}
