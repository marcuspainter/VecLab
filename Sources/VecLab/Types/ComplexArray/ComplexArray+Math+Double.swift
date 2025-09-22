//
//  ComplexArray+Math+Double.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension Array where Element == Complex {
    
    public static func + (_ a: [Complex], _ b: Double) -> [Complex] {
        //return a.map { $0 + b }
        return addComplexReal(a, b)
    }
    
    public static func + (_ a: Double, _ b: [Complex]) -> [Complex] {
        //return b.map { a + $0 }
        return addComplexReal(b, a)
    }
    
    public static func - (_ a: [Complex], _ b: Double) -> [Complex] {
        return a.map { $0 - b }
    }

    public static func - (_ a: Double, _ b: [Complex]) -> [Complex] {
        return b.map { a - $0 }
    }
    
    public static func * (_ a: [Complex], _ b: Double) -> [Complex] {
        //return a.map { $0 * b }
        return multiplyComplexReal(a, b)
    }

    public static func * (_ a: Double, _ b: [Complex]) -> [Complex] {
        //return b.map { a * $0 }
        return multiplyComplexReal(b, a)
    }
    
    public static func / (_ a: [Complex], _ b: Double) -> [Complex] {
        return a.map { $0 / b }
    }

    public static func / (_ a: Double, _ b: [Complex]) -> [Complex] {
        return b.map { a / $0 }
    }
}

func addComplexReal(_ a: [Complex], _ b: Double) -> [Complex] {
    let count = a.count

    return Array(unsafeUninitializedCapacity: count) { buffer, initializedCount in
        a.withUnsafeBufferPointer { ptr1 in
            for i in 0..<count {
                let a = ptr1[i]
                buffer[i].real = a.real + b
                buffer[i].imag = a.imag
            }
            initializedCount = count
        }
    }
}

func multiplyComplexReal(_ a: [Complex], _ b: Double) -> [Complex] {
    let count = a.count

    return Array(unsafeUninitializedCapacity: count) { buffer, initializedCount in
        a.withUnsafeBufferPointer { ptr1 in
            for i in 0..<count {
                let a = ptr1[i]
                buffer[i].real = a.real * b
                buffer[i].imag = a.imag * b
            }
            initializedCount = count
        }
    }
}

func divideComplexReal(_ a: [Complex], _ b: Double) -> [Complex] {
    let count = a.count

    return Array(unsafeUninitializedCapacity: count) { buffer, initializedCount in
        a.withUnsafeBufferPointer { ptr1 in
            for i in 0..<count {
                let a = ptr1[i]
                buffer[i].real = a.real / b
                buffer[i].imag = a.imag / b
            }
            initializedCount = count
        }
    }
}
