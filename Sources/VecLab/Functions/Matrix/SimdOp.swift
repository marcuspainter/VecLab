//
//  SimdOp.swift
//  VecLab
//
//  Created by Marcus Painter on 19/09/2025.
//

import Foundation
import simd

public enum SimdOp {

    // MARK: - Binary SIMD Op
    public static func binaryOp(
        _ a: borrowing [Double],
        _ b: borrowing [Double],
        body: (
            UnsafeBufferPointer<Double>,
            UnsafeBufferPointer<Double>,
            UnsafeMutableBufferPointer<Double>,
            UnsafeBufferPointer<SIMD4<Double>>,
            UnsafeBufferPointer<SIMD4<Double>>,
            UnsafeMutableBufferPointer<SIMD4<Double>>,
            Int,  // simdCount (rounded down to multiple of 4)
            Int  // total count
        ) -> Void
    ) -> [Double] {
        precondition(a.count == b.count, "Input arrays must match length")

        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            a.withUnsafeBufferPointer { aPtr in
                b.withUnsafeBufferPointer { bPtr in
                    c.withUnsafeMutableBufferPointer { cPtr in
                        let count = a.count
                        let simdCount = count & ~3  // multiple of 4
                        let simdCount4 = simdCount >> 2

                        aPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { aSimd in
                            bPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { bSimd in
                                cPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) {
                                    cSimd in
                                    body(
                                        aPtr,
                                        bPtr,
                                        cPtr,
                                        UnsafeBufferPointer(start: aSimd, count: simdCount4),
                                        UnsafeBufferPointer(start: bSimd, count: simdCount4),
                                        UnsafeMutableBufferPointer(start: cSimd, count: simdCount4),
                                        simdCount,
                                        count
                                    )
                                }
                            }
                        }
                    }
                }
            }
            initializedCount = a.count
        }
    }

    // Example: Add
    public static func add(_ a: borrowing [Double], _ b: borrowing [Double]) -> [Double] {
        return binaryOp(a, b) { aPtr, bPtr, cPtr, aSimd, bSimd, cSimd, simdCount, count in
            for i in 0..<aSimd.count {
                cSimd[i] = aSimd[i] + bSimd[i]
            }
            for i in simdCount..<count {
                cPtr[i] = aPtr[i] + bPtr[i]
            }
        }
    }

    // MARK: - Binary SIMD Op
    public static func unaryOp(
        _ a: borrowing [Double],
        body: (
            UnsafeBufferPointer<Double>,
            UnsafeMutableBufferPointer<Double>,
            UnsafeBufferPointer<SIMD4<Double>>,
            UnsafeMutableBufferPointer<SIMD4<Double>>,
            Int,  // simdCount (rounded down to multiple of 4)
            Int  // total count
        ) -> Void
    ) -> [Double] {

        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            a.withUnsafeBufferPointer { aPtr in
                c.withUnsafeMutableBufferPointer { cPtr in
                    let count = a.count
                    let simdCount = count & ~3  // multiple of 4
                    let simdCount4 = simdCount >> 2

                    aPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { aSimd in
                        cPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) {
                            cSimd in
                            body(
                                aPtr,
                                cPtr,
                                UnsafeBufferPointer(start: aSimd, count: simdCount4),
                                UnsafeMutableBufferPointer(start: cSimd, count: simdCount4),
                                simdCount,
                                count
                            )
                        }

                    }
                }
            }
            initializedCount = a.count
        }
    }

    // Example: Add
    public static func sin(_ a: borrowing [Double], _ b: borrowing [Double]) -> [Double] {
        return unaryOp(a) { aPtr, cPtr, aSimd, cSimd, simdCount, count in
            for i in 0..<aSimd.count {
                cSimd[i] = simd.sin(aSimd[i])
            }
            for i in simdCount..<count {
                cPtr[i] = Darwin.sin(aPtr[i])
            }
        }
    }

    // MARK: - Binary SIMD Op
    public static func binaryOp2(
        _ a: [Double]
    ) -> [Double] {

        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            a.withUnsafeBufferPointer { aPtr in
                c.withUnsafeMutableBufferPointer { cPtr in

                    let count = a.count
                    let simdCount = count & ~3  // multiple of 4
                    let simdCount4 = simdCount >> 2
                    aPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { aSimd in
                        cPtr.baseAddress!.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) {
                            cSimd in
                            var i: Int = 0
                            //for i in 0..<simdCount4 {
                            while i < simdCount4 {

                                cSimd[i] = simd.sin(aSimd[i])
                                cSimd[i + 1] = simd.sin(aSimd[i + 1])
                                cSimd[i + 2] = simd.sin(aSimd[i + 2])
                                cSimd[i + 3] = simd.sin(aSimd[i + 3])
                                i += 4
                            }
                            for i in simdCount..<count {
                                cPtr[i] = Darwin.sin(aPtr[i])
                            }
                            initializedCount = count
                        }
                    }
                }
            }

        }
    }

    // choose SIMD type here:

    public static func binaryOp3(_ a: [Double], _ b: [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            let count = a.count
            let width = SIMDX.scalarCount
            let simdChunks = count / width
            let simdCount = simdChunks * width

            a.withUnsafeBufferPointer { aPtr in
                b.withUnsafeBufferPointer { bPtr in
                    c.withUnsafeMutableBufferPointer { cPtr in
                        // Work in SIMD4<Double> units
                        let aSIMD = UnsafeBufferPointer<SIMDX>(
                            start: UnsafeRawPointer(aPtr.baseAddress!).assumingMemoryBound(to: SIMDX.self),
                            count: simdChunks
                        )

                        let bSIMD = UnsafeBufferPointer<SIMDX>(
                            start: UnsafeRawPointer(bPtr.baseAddress!).assumingMemoryBound(to: SIMDX.self),
                            count: simdChunks
                        )

                        let cSIMD = UnsafeMutableBufferPointer<SIMDX>(
                            start: UnsafeMutableRawPointer(cPtr.baseAddress!).assumingMemoryBound(to: SIMDX.self),
                            count: simdChunks
                        )

                        let unroll: Int = 4
                        var i: Int = 0
                        while i < simdChunks {
                            cSIMD[i] = aSIMD[i] * bSIMD[i]
                            cSIMD[i + 1] = aSIMD[i + 1] * bSIMD[i + 1]
                            cSIMD[i + 2] = aSIMD[i + 2] * bSIMD[i + 2]
                            cSIMD[i + 3] = aSIMD[i + 3] * bSIMD[i + 3]
                            /*
                                                     cSIMD[i+4] = aSIMD[i+4] * bSIMD[i+4]
                                                     cSIMD[i+5] = aSIMD[i+5] * bSIMD[i+5]
                                                     cSIMD[i+6] = aSIMD[i+6] * bSIMD[i+6]
                                                     cSIMD[i+7] = aSIMD[i+7] * bSIMD[i+7]
                                    */
                            /*
                            cSIMD[i+8] = aSIMD[i+8] * bSIMD[i+8]
                            cSIMD[i+9] = aSIMD[i+9] * bSIMD[i+9]
                            cSIMD[i+10] = aSIMD[i+10] * bSIMD[i+10]
                            cSIMD[i+11] = aSIMD[i+11] * bSIMD[i+11]
                            cSIMD[i+12] = aSIMD[i+12] * bSIMD[i+12]
                            cSIMD[i+13] = aSIMD[i+13] * bSIMD[i+13]
                            cSIMD[i+14] = aSIMD[i+14] * bSIMD[i+14]
                            cSIMD[i+15] = aSIMD[i+15] * bSIMD[i+15]
                            */

                            i += unroll

                        }

                        // Handle remainder
                        for i in simdCount..<count {
                            cPtr[i] = aPtr[i] * bPtr[i]
                        }
                    }
                }
            }

            initializedCount = count
        }
    }

    //typealias SIMDX = SIMD4<Double>   // or SIMD8<Double>, etc.

    public static func binaryOpX(_ a: [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            let count = a.count
            let width = SIMDX.scalarCount
            let simdChunks = count / width
            let simdCount = simdChunks * width

            a.withUnsafeBufferPointer { aPtr in
                c.withUnsafeMutableBufferPointer { cPtr in
                    let aSIMD = UnsafeBufferPointer<SIMDX>(
                        start: UnsafeRawPointer(aPtr.baseAddress!).assumingMemoryBound(to: SIMDX.self),
                        count: simdChunks
                    )
                    let cSIMD = UnsafeMutableBufferPointer<SIMDX>(
                        start: UnsafeMutableRawPointer(cPtr.baseAddress!).assumingMemoryBound(to: SIMDX.self),
                        count: simdChunks
                    )

                    var i = 0
                    while i <= simdChunks - 4 {  // fixed unroll=4
                        cSIMD[i] = simd.sin(aSIMD[i])
                        cSIMD[i + 1] = simd.sin(aSIMD[i + 1])
                        cSIMD[i + 2] = simd.sin(aSIMD[i + 2])
                        cSIMD[i + 3] = simd.sin(aSIMD[i + 3])
                        i += 4
                    }
                    while i < simdChunks {
                        cSIMD[i] = simd.sin(aSIMD[i])
                        i += 1
                    }

                    for j in simdCount..<count {
                        cPtr[j] = Darwin.sin(aPtr[j])
                    }
                }
            }
            initializedCount = count
        }
    }

    public typealias SIMDX = SIMD2<Double>  // swap to SIMD4<Double>, SIMD2<Double>, etc.

    //@inline(__always)
    public static func binaryOp4(
        _ a: [Double],
        _ b: [Double],
        body: (
            UnsafeBufferPointer<Double>,  // aPtr
            UnsafeBufferPointer<Double>,  // bPtr
            UnsafeMutableBufferPointer<Double>,  // cPtr
            UnsafeBufferPointer<SIMDX>,  // aSIMD
            UnsafeBufferPointer<SIMDX>,  // bSIMD
            UnsafeMutableBufferPointer<SIMDX>,  // cSIMD
            Int,  // simdChunks
            Int,  // simdCount (rounded down to multiple of 4)
            Int  // total count
        ) -> Void
    ) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            let count = a.count
            let width = SIMDX.scalarCount
            let simdChunks = count / width
            let simdCount = simdChunks * width

            a.withUnsafeBufferPointer { aPtr in
                b.withUnsafeBufferPointer { bPtr in
                    c.withUnsafeMutableBufferPointer { cPtr in
                        // Work in SIMDX units
                        let aSIMD = UnsafeBufferPointer<SIMDX>(
                            start: UnsafeRawPointer(aPtr.baseAddress!).assumingMemoryBound(to: SIMDX.self),
                            count: simdChunks
                        )

                        let bSIMD = UnsafeBufferPointer<SIMDX>(
                            start: UnsafeRawPointer(bPtr.baseAddress!).assumingMemoryBound(to: SIMDX.self),
                            count: simdChunks
                        )

                        let cSIMD = UnsafeMutableBufferPointer<SIMDX>(
                            start: UnsafeMutableRawPointer(cPtr.baseAddress!).assumingMemoryBound(to: SIMDX.self),
                            count: simdChunks
                        )

                        // Execute math function
                        body(aPtr, bPtr, cPtr, aSIMD, bSIMD, cSIMD, simdChunks, simdCount, count)
                    }
                }
            }

            initializedCount = count
        }
    }

    @inline(__always)
    public static func mul(_ a: [Double], _ b: [Double]) -> [Double] {
        return binaryOp4(a, b) { aPtr, bPtr, cPtr, aSIMD, bSIMD, cSIMD, simdChunks, simdCount, count in

            let unroll: Int = 4
            var i: Int = 0
            while i < simdChunks {
                cSIMD[i] = aSIMD[i] * bSIMD[i]
                cSIMD[i + 1] = aSIMD[i + 1] * bSIMD[i + 1]
                cSIMD[i + 2] = aSIMD[i + 2] * bSIMD[i + 2]
                cSIMD[i + 3] = aSIMD[i + 3] * bSIMD[i + 3]
                i += unroll
            }

            // Handle remainder
            i = simdCount
            while i < count {
                cPtr[i] = aPtr[i] * bPtr[i]
                i += 1
            }
        }
    }

   
}
