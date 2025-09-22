//
//  ComplexArray+Math+Complex.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension Array where Element == Complex {
    
    public static func + (_ a: [Complex], _ b: Complex) -> [Complex] {
        //return a.map { $0 + b }
        return addComplexComplexScalar(a, b)
    }

    public static func + (_ a: Complex, _ b: [Complex]) -> [Complex] {
        //return b.map { a + $0 }
        return addComplexComplexScalar(b, a)
    }
    
    public static func - (_ a: [Complex], _ b: Complex) -> [Complex] {
        return a.map { $0 - b }
    }

    public static func - (_ a: Complex, _ b: [Complex]) -> [Complex] {
        return b.map { a - $0 }
    }
    
    public static func * (_ a: [Complex], _ b: Complex) -> [Complex] {
        //return a.map { $0 * b }
        return multiplyComplexComplexScalar(a, b)
    }

    public static func * (_ a: Complex, _ b: [Complex]) -> [Complex] {
        //return b.map { a * $0 }
        return multiplyComplexComplexScalar(b, a)
    }
    
    public static func / (_ a: [Complex], _ b: Complex) -> [Complex] {
        return a.map { $0 / b }
    }

    public static func / (_ a: Complex, _ b: [Complex]) -> [Complex] {
        return b.map { a / $0 }
    }
    
}

func addComplexComplexScalar(_ a: [Complex], _ b: Complex) -> [Complex] {
    let count = a.count

    return Array(unsafeUninitializedCapacity: count) { buffer, initializedCount in
        a.withUnsafeBufferPointer { ptr1 in
            for i in 0..<count {
                let a = ptr1[i]
                buffer[i].real = a.real + b.real
                buffer[i].imag = a.imag + b.imag
            }
            initializedCount = count

        }
    }
}

func multiplyComplexComplexScalar(_ a: [Complex], _ b: Complex) -> [Complex] {
    let count = a.count

    return Array(unsafeUninitializedCapacity: count) { buffer, initializedCount in
        a.withUnsafeBufferPointer { ptr1 in
            for i in 0..<count {
                let a = ptr1[i]
                buffer[i].real = a.real * b.real - a.imag * b.imag
                buffer[i].imag = a.real * b.imag + a.imag * b.real
            }
            initializedCount = count

        }
    }
}

func divideComplexComplexScalar(_ a: [Complex], _ b: Complex) -> [Complex] {
    let count = a.count

    return Array(unsafeUninitializedCapacity: count) { buffer, initializedCount in
        a.withUnsafeBufferPointer { ptr1 in
            for i in 0..<count {
                let a = ptr1[i]
                buffer[i] = complexDivide(a, b)
            }
            initializedCount = count

        }
    }
}
