//
//  CoreComplexVectorSIMD.swift
//  VecLab
//
//  Created by Marcus Painter on 18/09/2025.
//

import Foundation
import simd

enum CoreComplexVectorSIMD {

    static func multiply(_ a: [Complex], _ b: [Complex]) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            a.withUnsafeBufferPointer { aPtr in
                b.withUnsafeBufferPointer { bPtr in
                    c.withUnsafeMutableBufferPointer { cPtr in
                        let count = a.count
                        // Bitwise shifts for *2 and /4
                        let doubleCount = count << 1  // Each complex = 2 doubles
                        let simdCount = doubleCount & ~3  // Round down to multiple of 4
                        let simdCount4 = simdCount >> 2   // Divide by 4

                        // Cast memory layout to SIMD4 - zero copy
                        let aDoublePtr = UnsafeRawPointer(aPtr.baseAddress!).bindMemory(to: Double.self, capacity: doubleCount)
                        let bDoublePtr = UnsafeRawPointer(bPtr.baseAddress!).bindMemory(to: Double.self, capacity: doubleCount)
                        let cDoublePtr = UnsafeMutableRawPointer(cPtr.baseAddress!).bindMemory(to: Double.self, capacity: doubleCount)

                        aDoublePtr.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { aSimd in
                            bDoublePtr.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { bSimd in
                                cDoublePtr.withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { cSimd in

                                    // Constant outside loop
                                    let signs = SIMD4<Double>(-1, 1, -1, 1)

                                    // Direct SIMD operations on reinterpreted memory
                                    for i in 0..<simdCount4 {
                                        let a_vec = aSimd[i]  // [a0_r, a0_i, a1_r, a1_i]
                                        let b_vec = bSimd[i]  // [b0_r, b0_i, b1_r, b1_i]

                                        // Complex multiplication: (a + bi)(c + di) = (ac - bd) + (ad + bc)i
                                        let a_real = SIMD4<Double>(a_vec[0], a_vec[0], a_vec[2], a_vec[2])
                                        let a_imag = SIMD4<Double>(a_vec[1], a_vec[1], a_vec[3], a_vec[3])
                                        let b_normal = SIMD4<Double>(b_vec[0], b_vec[1], b_vec[2], b_vec[3])
                                        let b_swapped = SIMD4<Double>(b_vec[1], b_vec[0], b_vec[3], b_vec[2])

                                        // Use FMA for better performance and accuracy
                                        cSimd[i] = fma(a_imag, b_swapped * signs, a_real * b_normal)

                                        // Handle remainder elements
                                        let processedDoubles = simdCount

                                        // for i in stride(from: processedDoubles, to: doubleCount, by: 2) {
                                        var i = processedDoubles
                                        while i < doubleCount {
                                            let complexIdx = i / 2
                                            let a_real = aPtr[complexIdx].real
                                            let a_imag = aPtr[complexIdx].imag
                                            let b_real = bPtr[complexIdx].real
                                            let b_imag = bPtr[complexIdx].imag

                                            cPtr[complexIdx] = Complex(
                                                fma(a_imag, -b_imag, a_real * b_real),  // Real: ac - bd
                                                fma(a_real, b_imag, a_imag * b_real)    // Imag: ad + bc
                                            )
                                            i &+= 2
                                        }
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

    static func multiplyQ(_ a: [Complex], _ b: [Complex]) -> [Complex] {
        precondition(a.count == b.count, "Arrays must have the same count")

        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            a.withUnsafeBufferPointer { aPtr in
                b.withUnsafeBufferPointer { bPtr in
                    c.withUnsafeMutableBufferPointer { cPtr in
                        let count = a.count
                        let doubleCount = count * 2

                        let aDoublePtr = UnsafeRawPointer(aPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )
                        let bDoublePtr = UnsafeRawPointer(bPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )
                        let cDoublePtr = UnsafeMutableRawPointer(cPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )

                        // SIMD alignment peeling
                        let alignment = MemoryLayout<SIMD4<Double>>.alignment
                        let aAddr = Int(bitPattern: aDoublePtr)
                        let misalign = (alignment - (aAddr & (alignment - 1))) & (alignment - 1)
                        let peelDoubles = min(misalign / MemoryLayout<Double>.stride, doubleCount)

                        // Scalar prefix (peel)
                        for i in stride(from: 0, to: peelDoubles, by: 2) {
                            let idx = i / 2
                            let ar = aPtr[idx].real, ai = aPtr[idx].imag
                            let br = bPtr[idx].real, bi = bPtr[idx].imag
                            cPtr[idx] = Complex(ar * br - ai * bi, ar * bi + ai * br)
                        }

                        // SIMD body
                        let simdStart = peelDoubles
                        let simdCount = (doubleCount - simdStart) & ~3
                        let simdCount4 = simdCount / 4

                        aDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { aSimd in
                            bDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { bSimd in
                                cDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { cSimd in
                                    for i in 0..<simdCount4 {
                                        let aVec = aSimd[i] // [ar0, ai0, ar1, ai1]
                                        let bVec = bSimd[i] // [br0, bi0, br1, bi1]

                                        // First complex
                                        let r0 = aVec[0] * bVec[0] - aVec[1] * bVec[1]
                                        let i0 = aVec[0] * bVec[1] + aVec[1] * bVec[0]

                                        // Second complex
                                        let r1 = aVec[2] * bVec[2] - aVec[3] * bVec[3]
                                        let i1 = aVec[2] * bVec[3] + aVec[3] * bVec[2]

                                        cSimd[i] = SIMD4(r0, i0, r1, i1)
                                    }
                                }
                            }
                        }

                        // Remainder
                        let processed = simdStart + simdCount
                        for i in stride(from: processed, to: doubleCount, by: 2) {
                            let idx = i / 2
                            let ar = aPtr[idx].real, ai = aPtr[idx].imag
                            let br = bPtr[idx].real, bi = bPtr[idx].imag
                            cPtr[idx] = Complex(ar * br - ai * bi, ar * bi + ai * br)
                        }
                    }
                }
            }
            initializedCount = a.count
        }
    }

    static func multiplyR(_ a: [Complex], _ b: [Complex]) -> [Complex] {
        precondition(a.count == b.count, "Arrays must have the same count")

        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            a.withUnsafeBufferPointer { aPtr in
                b.withUnsafeBufferPointer { bPtr in
                    c.withUnsafeMutableBufferPointer { cPtr in
                        let count = a.count
                        let doubleCount = count * 2

                        let aDoublePtr = UnsafeRawPointer(aPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )
                        let bDoublePtr = UnsafeRawPointer(bPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )
                        let cDoublePtr = UnsafeMutableRawPointer(cPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )

                        // SIMD alignment peeling
                        let alignment = MemoryLayout<SIMD4<Double>>.alignment
                        let aAddr = Int(bitPattern: aDoublePtr)
                        let misalign = (alignment - (aAddr & (alignment - 1))) & (alignment - 1)
                        let peelDoubles = min(misalign / MemoryLayout<Double>.stride, doubleCount)

                        // Scalar prefix (peel)
                        for i in stride(from: 0, to: peelDoubles, by: 2) {
                            let idx = i / 2
                            let ar = aPtr[idx].real, ai = aPtr[idx].imag
                            let br = bPtr[idx].real, bi = bPtr[idx].imag
                            cPtr[idx] = Complex(ar * br - ai * bi, ar * bi + ai * br)
                        }

                        // SIMD body (unrolled: 2×SIMD4 = 4 complex per iteration)
                        let simdStart = peelDoubles
                        let simdCount = (doubleCount - simdStart) & ~7  // multiple of 8 doubles
                        let simdCount8 = simdCount / 8

                        aDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount8 * 2) { aSimd in
                            bDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount8 * 2) { bSimd in
                                cDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount8 * 2) { cSimd in
                                    for i in 0..<simdCount8 {
                                        let j = i << 1 // two SIMD4s per iteration

                                        // First two complexes
                                        let a0 = aSimd[j]
                                        let b0 = bSimd[j]
                                        let r0 = a0[0] * b0[0] - a0[1] * b0[1]
                                        let i0 = a0[0] * b0[1] + a0[1] * b0[0]
                                        let r1 = a0[2] * b0[2] - a0[3] * b0[3]
                                        let i1 = a0[2] * b0[3] + a0[3] * b0[2]
                                        cSimd[j] = SIMD4(r0, i0, r1, i1)

                                        // Next two complexes
                                        let a1 = aSimd[j + 1]
                                        let b1 = bSimd[j + 1]
                                        let r2 = a1[0] * b1[0] - a1[1] * b1[1]
                                        let i2 = a1[0] * b1[1] + a1[1] * b1[0]
                                        let r3 = a1[2] * b1[2] - a1[3] * b1[3]
                                        let i3 = a1[2] * b1[3] + a1[3] * b1[2]
                                        cSimd[j + 1] = SIMD4(r2, i2, r3, i3)
                                    }
                                }
                            }
                        }

                        // Remainder
                        let processed = simdStart + simdCount
                        for i in stride(from: processed, to: doubleCount, by: 2) {
                            let idx = i / 2
                            let ar = aPtr[idx].real, ai = aPtr[idx].imag
                            let br = bPtr[idx].real, bi = bPtr[idx].imag
                            cPtr[idx] = Complex(ar * br - ai * bi, ar * bi + ai * br)
                        }
                    }
                }
            }
            initializedCount = a.count
        }
    }

    static func test() {

        // Example usage
        let complexArray1: [Complex] = [
            Complex(3.0, 4.0),   // 3 + 4i
            Complex(1.0, 2.0),   // 1 + 2i
            Complex(5.0, -1.0),  // 5 - 1i
            Complex(0.0, 3.0),   // 0 + 3i
            Complex(2.0, 1.0)    // 2 + 1i
        ]

        let complexArray2: [Complex] = [
            Complex(2.0, 1.0),   // 2 + 1i
            Complex(3.0, -1.0),  // 3 - 1i
            Complex(1.0, 1.0),   // 1 + 1i
            Complex(2.0, 0.0),   // 2 + 0i
            Complex(1.0, -1.0)   // 1 - 1i
        ]

        let result = CoreComplexVectorSIMD.multiply(complexArray1, complexArray2)

        for i in 0..<result.count {
            let a = complexArray1[i]
            let b = complexArray2[i]
            let r = result[i]
            print("(\(a.real) + \(a.imag)i) * (\(b.real) + \(b.imag)i) == (\(r.real) + \(r.imag)i)")
        }
    }

    static func multiplyX(_ a: [Complex], _ b: [Complex]) -> [Complex] {
        precondition(a.count == b.count, "Arrays must have the same count")

        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            a.withUnsafeBufferPointer { aPtr in
                b.withUnsafeBufferPointer { bPtr in
                    c.withUnsafeMutableBufferPointer { cPtr in
                        let count = a.count
                        let doubleCount = count * 2

                        let aDoublePtr = UnsafeRawPointer(aPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )
                        let bDoublePtr = UnsafeRawPointer(bPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )
                        let cDoublePtr = UnsafeMutableRawPointer(cPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )

                        // SIMD alignment
                        let alignment = MemoryLayout<SIMD4<Double>>.alignment
                        let aAddr = Int(bitPattern: aDoublePtr)
                        let misalign = (alignment - (aAddr & (alignment - 1))) & (alignment - 1)
                        let peelDoubles = min(misalign / MemoryLayout<Double>.stride, doubleCount)

                        if peelDoubles > 0 {
                            print("Misaligned prefix peel: \(peelDoubles) doubles")
                        }

                        // Peel misaligned prefix scalarly
                        for i in stride(from: 0, to: peelDoubles, by: 2) {
                            let idx = i / 2
                            let ar = aPtr[idx].real, ai = aPtr[idx].imag
                            let br = bPtr[idx].real, bi = bPtr[idx].imag
                            cPtr[idx] = Complex(
                                fma(ai, -bi, ar * br), // real
                                fma(ar, bi, ai * br)  // imag
                            )
                        }

                        // SIMD body
                        let signs = SIMD4<Double>(-1, 1, -1, 1)
                        let simdStart = peelDoubles
                        let simdCount = (doubleCount - simdStart) & ~3
                        let simdCount4 = simdCount / 4

                        aDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { aSimd in
                            bDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { bSimd in
                                cDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { cSimd in
                                    for i in 0..<simdCount4 {
                                        let aVec = aSimd[i]
                                        let bVec = bSimd[i]

                                        let aReal = SIMD4(aVec[0], aVec[0], aVec[2], aVec[2])
                                        let aImag = SIMD4(aVec[1], aVec[1], aVec[3], aVec[3])
                                        let bNormal = bVec
                                        let bSwapped = SIMD4(bVec[1], bVec[0], bVec[3], bVec[2])

                                        cSimd[i] = fma(aImag, bSwapped * signs, aReal * bNormal)
                                    }
                                }
                            }
                        }

                        // Remainder
                        let processed = simdStart + simdCount
                        for i in stride(from: processed, to: doubleCount, by: 2) {
                            let idx = i / 2
                            let ar = aPtr[idx].real, ai = aPtr[idx].imag
                            let br = bPtr[idx].real, bi = bPtr[idx].imag
                            cPtr[idx] = Complex(
                                fma(ai, -bi, ar * br),
                                fma(ar, bi, ai * br)
                            )
                        }
                    }
                }
            }
            initializedCount = a.count
        }
    }

    static func multiplyY(_ a: [Complex], _ b: [Complex]) -> [Complex] {
        precondition(a.count == b.count, "Arrays must have the same count")

        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            a.withUnsafeBufferPointer { aPtr in
                b.withUnsafeBufferPointer { bPtr in
                    c.withUnsafeMutableBufferPointer { cPtr in
                        let count = a.count
                        let doubleCount = count * 2

                        let aDoublePtr = UnsafeRawPointer(aPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )
                        let bDoublePtr = UnsafeRawPointer(bPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )
                        let cDoublePtr = UnsafeMutableRawPointer(cPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )

                        // SIMD alignment
                        let alignment = MemoryLayout<SIMD4<Double>>.alignment
                        let aAddr = Int(bitPattern: aDoublePtr)
                        let misalign = (alignment - (aAddr & (alignment - 1))) & (alignment - 1)
                        let peelDoubles = min(misalign / MemoryLayout<Double>.stride, doubleCount)

                        if peelDoubles > 0 {
                            print("Misaligned prefix peel: \(peelDoubles) doubles")
                        }

                        // Peel misaligned prefix scalarly
                        for i in stride(from: 0, to: peelDoubles, by: 2) {
                            let idx = i / 2
                            let ar = aPtr[idx].real, ai = aPtr[idx].imag
                            let br = bPtr[idx].real, bi = bPtr[idx].imag
                            cPtr[idx] = Complex(
                                fma(ai, -bi, ar * br), // real
                                fma(ar, bi, ai * br)  // imag
                            )
                        }

                        // SIMD body
                        let signs = SIMD4<Double>(-1, 1, -1, 1)
                        let simdStart = peelDoubles
                        let simdCount = (doubleCount - simdStart) & ~3
                        let simdCount4 = simdCount / 4

                        aDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { aSimd in
                            bDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { bSimd in
                                cDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { cSimd in

                                    let signs = SIMD4<Double>(-1, 1, -1, 1)

                                    // for i in stride(from: 0, to: simdCount4, by: 2) {

                                    var i = 0
                                    while i < simdCount4 {
                                        // First 2 complexes
                                        let a0 = aSimd[i]
                                        let b0 = bSimd[i]
                                        // Next 2 complexes (i+1)
                                        let a1 = aSimd[i+1]
                                        let b1 = bSimd[i+1]

                                        let a0_real = SIMD4<Double>(a0[0], a0[0], a0[2], a0[2])
                                        let a0_imag = SIMD4<Double>(a0[1], a0[1], a0[3], a0[3])
                                        let b0_norm = SIMD4<Double>(b0[0], b0[1], b0[2], b0[3])
                                        let b0_swap = SIMD4<Double>(b0[1], b0[0], b0[3], b0[2])

                                        cSimd[i] = fma(a0_imag, b0_swap * signs, a0_real * b0_norm)

                                        let a1_real = SIMD4<Double>(a1[0], a1[0], a1[2], a1[2])
                                        let a1_imag = SIMD4<Double>(a1[1], a1[1], a1[3], a1[3])
                                        let b1_norm = SIMD4<Double>(b1[0], b1[1], b1[2], b1[3])
                                        let b1_swap = SIMD4<Double>(b1[1], b1[0], b1[3], b1[2])

                                        cSimd[i+1] = fma(a1_imag, b1_swap * signs, a1_real * b1_norm)

                                        i &+= 2
                                    }
                                }
                            }
                        }

                        // Remainder
                        let processed = simdStart + simdCount
                        for i in stride(from: processed, to: doubleCount, by: 2) {
                            let idx = i / 2
                            let ar = aPtr[idx].real, ai = aPtr[idx].imag
                            let br = bPtr[idx].real, bi = bPtr[idx].imag
                            cPtr[idx] = Complex(
                                fma(ai, -bi, ar * br),
                                fma(ar, bi, ai * br)
                            )
                        }
                    }
                }
            }
            initializedCount = a.count
        }
    }

    static func multiplyZ(_ a: [Complex], _ b: [Complex]) -> [Complex] {
        precondition(a.count == b.count, "Arrays must have the same count")

        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            a.withUnsafeBufferPointer { aPtr in
                b.withUnsafeBufferPointer { bPtr in
                    c.withUnsafeMutableBufferPointer { cPtr in
                        let count = a.count
                        let doubleCount = count * 2

                        let aDoublePtr = UnsafeRawPointer(aPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )
                        let bDoublePtr = UnsafeRawPointer(bPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )
                        let cDoublePtr = UnsafeMutableRawPointer(cPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )

                        // SIMD alignment
                        let alignment = MemoryLayout<SIMD4<Double>>.alignment
                        let aAddr = Int(bitPattern: aDoublePtr)
                        let misalign = (alignment - (aAddr & (alignment - 1))) & (alignment - 1)
                        let peelDoubles = min(misalign / MemoryLayout<Double>.stride, doubleCount)

                        if peelDoubles > 0 {
                            print("Misaligned prefix peel: \(peelDoubles) doubles")
                        }

                        // Peel misaligned prefix scalarly
                        for i in stride(from: 0, to: peelDoubles, by: 2) {
                            let idx = i / 2
                            let ar = aPtr[idx].real, ai = aPtr[idx].imag
                            let br = bPtr[idx].real, bi = bPtr[idx].imag
                            cPtr[idx] = Complex(
                                fma(ai, -bi, ar * br), // real
                                fma(ar, bi, ai * br)  // imag
                            )
                        }

                        // SIMD body
                        let signs = SIMD4<Double>(-1, 1, -1, 1)
                        let simdStart = peelDoubles
                        let simdCount = (doubleCount - simdStart) & ~3
                        let simdCount4 = simdCount / 4

                        aDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { aSimd in
                            bDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { bSimd in
                                cDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { cSimd in

                                    let signs = SIMD4<Double>(-1, 1, -1, 1)

                                    // for i in stride(from: 0, to: simdCount4, by: 2) {
                                    var i = 0
                                    while i + 3 < simdCount4 {
                                        // --- First SIMD4 (2 complexes) ---
                                        let a0 = aSimd[i]
                                        let b0 = bSimd[i]
                                        let a0_real = SIMD4(a0[0], a0[0], a0[2], a0[2])
                                        let a0_imag = SIMD4(a0[1], a0[1], a0[3], a0[3])
                                        let b0_norm = SIMD4(b0[0], b0[1], b0[2], b0[3])
                                        let b0_swap = SIMD4(b0[1], b0[0], b0[3], b0[2])
                                        cSimd[i] = fma(a0_imag, b0_swap * signs, a0_real * b0_norm)

                                        // --- Second SIMD4 ---
                                        let a1 = aSimd[i+1]
                                        let b1 = bSimd[i+1]
                                        let a1_real = SIMD4(a1[0], a1[0], a1[2], a1[2])
                                        let a1_imag = SIMD4(a1[1], a1[1], a1[3], a1[3])
                                        let b1_norm = SIMD4(b1[0], b1[1], b1[2], b1[3])
                                        let b1_swap = SIMD4(b1[1], b1[0], b1[3], b1[2])
                                        cSimd[i+1] = fma(a1_imag, b1_swap * signs, a1_real * b1_norm)

                                        // --- Third SIMD4 ---
                                        let a2 = aSimd[i+2]
                                        let b2 = bSimd[i+2]
                                        let a2_real = SIMD4(a2[0], a2[0], a2[2], a2[2])
                                        let a2_imag = SIMD4(a2[1], a2[1], a2[3], a2[3])
                                        let b2_norm = SIMD4(b2[0], b2[1], b2[2], b2[3])
                                        let b2_swap = SIMD4(b2[1], b2[0], b2[3], b2[2])
                                        cSimd[i+2] = fma(a2_imag, b2_swap * signs, a2_real * b2_norm)

                                        // --- Fourth SIMD4 ---
                                        let a3 = aSimd[i+3]
                                        let b3 = bSimd[i+3]
                                        let a3_real = SIMD4(a3[0], a3[0], a3[2], a3[2])
                                        let a3_imag = SIMD4(a3[1], a3[1], a3[3], a3[3])
                                        let b3_norm = SIMD4(b3[0], b3[1], b3[2], b3[3])
                                        let b3_swap = SIMD4(b3[1], b3[0], b3[3], b3[2])
                                        cSimd[i+3] = fma(a3_imag, b3_swap * signs, a3_real * b3_norm)

                                        i &+= 4
                                    }

                                    // Handle remaining SIMD4s (if any)
                                    while i < simdCount4 {
                                        let aVec = aSimd[i]
                                        let bVec = bSimd[i]
                                        let aReal = SIMD4(aVec[0], aVec[0], aVec[2], aVec[2])
                                        let aImag = SIMD4(aVec[1], aVec[1], aVec[3], aVec[3])
                                        let bNorm = SIMD4(bVec[0], bVec[1], bVec[2], bVec[3])
                                        let bSwap = SIMD4(bVec[1], bVec[0], bVec[3], bVec[2])
                                        cSimd[i] = fma(aImag, bSwap * signs, aReal * bNorm)
                                        i &+= 1
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

    static func multiplyA(_ a: [Complex], _ b: [Complex]) -> [Complex] {
        precondition(a.count == b.count, "Arrays must have the same count")

        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            a.withUnsafeBufferPointer { aPtr in
                b.withUnsafeBufferPointer { bPtr in
                    c.withUnsafeMutableBufferPointer { cPtr in
                        let count = a.count
                        let doubleCount = count * 2

                        let aDoublePtr = UnsafeRawPointer(aPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )
                        let bDoublePtr = UnsafeRawPointer(bPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )
                        let cDoublePtr = UnsafeMutableRawPointer(cPtr.baseAddress!).bindMemory(
                            to: Double.self, capacity: doubleCount
                        )

                        // SIMD alignment
                        let alignment = MemoryLayout<SIMD4<Double>>.alignment
                        let aAddr = Int(bitPattern: aDoublePtr)
                        let misalign = (alignment - (aAddr & (alignment - 1))) & (alignment - 1)
                        let peelDoubles = min(misalign / MemoryLayout<Double>.stride, doubleCount)

                        if peelDoubles > 0 {
                            print("Misaligned prefix peel: \(peelDoubles) doubles")
                        }

                        // Peel misaligned prefix scalarly
                        for i in stride(from: 0, to: peelDoubles, by: 2) {
                            let idx = i / 2
                            let ar = aPtr[idx].real, ai = aPtr[idx].imag
                            let br = bPtr[idx].real, bi = bPtr[idx].imag
                            cPtr[idx] = Complex(
                                fma(ai, -bi, ar * br), // real
                                fma(ar, bi, ai * br)  // imag
                            )
                        }

                        // SIMD body
                        let signs = SIMD4<Double>(-1, 1, -1, 1)
                        let simdStart = peelDoubles
                        let simdCount = (doubleCount - simdStart) & ~3
                        let simdCount4 = simdCount / 4

                        aDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { aSimd in
                            bDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { bSimd in
                                cDoublePtr.advanced(by: simdStart).withMemoryRebound(to: SIMD4<Double>.self, capacity: simdCount4) { cSimd in
                                    for i in 0..<simdCount4 {
                                        let aVec = aSimd[i]
                                        let bVec = bSimd[i]

                                        let aReal    = SIMD4(aVec.x, aVec.x, aVec.z, aVec.z)
                                        let aImag    = SIMD4(aVec.y, aVec.y, aVec.w, aVec.w)
                                        let bNormal  = bVec
                                        let bSwapped = SIMD4(bVec.y, bVec.x, bVec.w, bVec.z)

                                        cSimd[i] = fma(aImag, bSwapped * signs, aReal * bNormal)
                                    }
                                }
                            }
                        }

                        // Remainder
                        let processed = simdStart + simdCount
                        for i in stride(from: processed, to: doubleCount, by: 2) {
                            let idx = i / 2
                            let ar = aPtr[idx].real, ai = aPtr[idx].imag
                            let br = bPtr[idx].real, bi = bPtr[idx].imag
                            cPtr[idx] = Complex(
                                fma(ai, -bi, ar * br),
                                fma(ar, bi, ai * br)
                            )
                        }
                    }
                }
            }
            initializedCount = a.count
        }
    }
}
