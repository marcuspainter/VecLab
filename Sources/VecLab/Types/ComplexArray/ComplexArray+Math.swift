//
//  ComplexArray+Math.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension Array where Element == Complex {

    public static func + (_ a: [Complex], _ b: [Complex]) -> [Complex] {
        return CoreComplexVector.add(a, b)
    }

    public static func - (_ a: [Complex], _ b: [Complex]) -> [Complex] {
        return CoreComplexVector.subtract(a, b)
    }

    public static func * (_ a: [Complex], _ b: [Complex]) -> [Complex] {
        return CoreComplexVector.multiply(a, b)
    }

    public static func / (_ a: [Complex], _ b: [Complex]) -> [Complex] {
        return CoreComplexVector.divide(a, b)
    }

}

/*
func addComplexComplex(_ a: [Complex], _ b: [Complex]) -> [Complex] {
    let count = a.count

    return Array(unsafeUninitializedCapacity: count) { buffer, initializedCount in
        a.withUnsafeBufferPointer { ptr1 in
            b.withUnsafeBufferPointer { ptr2 in
                for i in 0..<count {
                    let a = ptr1[i]
                    let b = ptr2[i]
                    buffer[i].real = a.real + b.real
                    buffer[i].imag = a.imag + b.imag
                }
                initializedCount = count
            }
        }
    }
}

func multiplyComplexComplex(_ a: [Complex], _ b: [Complex]) -> [Complex] {
    let count = a.count

    return Array(unsafeUninitializedCapacity: count) { buffer, initializedCount in
        a.withUnsafeBufferPointer { ptr1 in
            b.withUnsafeBufferPointer { ptr2 in
                for i in 0..<count {
                    let a = ptr1[i]
                    let b = ptr2[i]
                    buffer[i].real = a.real * b.real - a.imag * b.imag
                    buffer[i].imag = a.real * b.imag + a.imag * b.real
                }
                initializedCount = count
            }
        }
    }
}

func divideComplexComplex(_ a: [Complex], _ b: [Complex]) -> [Complex] {
    let count = a.count

    return Array(unsafeUninitializedCapacity: count) { buffer, initializedCount in
        a.withUnsafeBufferPointer { ptr1 in
            b.withUnsafeBufferPointer { ptr2 in
                for i in 0..<count {
                    let a = ptr1[i]
                    let b = ptr2[i]
                    buffer[i] = complexDivide(a, b)
                }
                initializedCount = count
            }
        }
    }
}

// SIMD-optimized function to multiply two complex arrays element-wise
func multiplySplitComplexArraysSIMD(_ a: [Complex], _ b: [Complex]) -> [Complex]? {
    let count = a.count
    guard count == b.count else {
        return nil
    }

    return Array(unsafeUninitializedCapacity: count) { buffer, initializedCount in
        a.withUnsafeBufferPointer { ptr1 in
            b.withUnsafeBufferPointer { ptr2 in
                let simdCount = count & ~3  // Round down to nearest multiple of 4
                var i = 0

                // Process 4 complex numbers at once using SIMD
                while i < simdCount {
                    // Load 4 complex numbers as SIMD vectors
                    let a_real = SIMD4<Double>(ptr1[i].real, ptr1[i + 1].real, ptr1[i + 2].real, ptr1[i + 3].real)
                    let a_imag = SIMD4<Double>(ptr1[i].imag, ptr1[i + 1].imag, ptr1[i + 2].imag, ptr1[i + 3].imag)
                    let b_real = SIMD4<Double>(ptr2[i].real, ptr2[i + 1].real, ptr2[i + 2].real, ptr2[i + 3].real)
                    let b_imag = SIMD4<Double>(ptr2[i].imag, ptr2[i + 1].imag, ptr2[i + 2].imag, ptr2[i + 3].imag)

                    // Vectorized complex multiplication
                    // (a + bi) * (c + di) = (ac - bd) + (ad + bc)i
                    let result_real = a_real * b_real - a_imag * b_imag
                    let result_imag = a_real * b_imag + a_imag * b_real

                    // Store results back
                    buffer[i].real = result_real[0]
                    buffer[i].imag = result_imag[0]
                    buffer[i + 1].real = result_real[1]
                    buffer[i + 1].imag = result_imag[1]
                    buffer[i + 2].real = result_real[2]
                    buffer[i + 2].imag = result_imag[2]
                    buffer[i + 3].real = result_real[3]
                    buffer[i + 3].imag = result_imag[3]

                    i += 4
                }

                // Handle remaining elements (if count not divisible by 4)
                while i < count {
                    let a = ptr1[i]
                    let b = ptr2[i]
                    buffer[i].real = a.real * b.real - a.imag * b.imag
                    buffer[i].imag = a.real * b.imag + a.imag * b.real
                    i += 1
                }

                initializedCount = count
            }
        }
    }
}

 */
