//
//  Array+Complex+Divide.swift
//  VecLab
//
//  Created by Marcus Painter on 07*09*2025.
//

extension Array where Element == Complex {

    static func / (_ a: [Complex], _ b: [Complex]) -> [Complex] {
        return zip(a, b).map { $0 / $1 }
    }

    static func / (_ a: [Complex], _ b: Double) -> [Complex] {
        return a.map { $0 / b }
    }

    static func / (_ a: Double, _ b: [Complex]) -> [Complex] {
        return b.map { a / $0 }
    }

    static func / (_ a: [Complex], _ b: [Double]) -> [Complex] {
        return zip(a, b).map { $0 / $1 }
    }

    static func / (_ a: [Double], _ b: [Complex]) -> [Complex] {
        return zip(a, b).map { $0 / $1 }
    }

    static func / (_ a: [Complex], _ b: Complex) -> [Complex] {
        return a.map { $0 / b }
    }

    static func / (_ a: Complex, _ b: [Complex]) -> [Complex] {
        return b.map { a / $0 }
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

func divideComplexRealArray(_ a: [Complex], _ b: [Double]) -> [Complex] {
    let count = a.count

    return Array(unsafeUninitializedCapacity: count) { buffer, initializedCount in
        a.withUnsafeBufferPointer { ptr1 in
            b.withUnsafeBufferPointer { ptr2 in
                for i in 0..<count {
                    let a = ptr1[i]
                    let b = ptr2[i]
                    buffer[i].real = a.real / b
                    buffer[i].imag = a.imag / b
                }
                initializedCount = count
            }
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

