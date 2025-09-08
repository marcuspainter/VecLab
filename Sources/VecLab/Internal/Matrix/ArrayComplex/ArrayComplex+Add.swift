//
//  ArrayComplex+Add.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

extension Array where Element == ComplexDouble {

    static func + (_ a: [ComplexDouble], _ b: [ComplexDouble]) -> [ComplexDouble] {
        //return zip(a, b).map { $0 + $1 }
        return addComplexComplex(a, b)
    }

    static func + (_ a: [ComplexDouble], _ b: Double) -> [ComplexDouble] {
        //return a.map { $0 + b }
        return addComplexReal(a, b)
    }

    static func + (_ a: Double, _ b: [ComplexDouble]) -> [ComplexDouble] {
        //return b.map { a + $0 }
        return addComplexReal(b, a)
    }

    static func + (_ a: [ComplexDouble], _ b: [Double]) -> [ComplexDouble] {
        //return zip(a, b).map { $0 + $1 }
        return addComplexRealArray(a, b)
    }

    static func + (_ a: [Double], _ b: [ComplexDouble]) -> [ComplexDouble] {
        // return zip(a, b).map { $0 + $1 }
        return addComplexRealArray(b, a)
    }

    static func + (_ a: [ComplexDouble], _ b: ComplexDouble) -> [ComplexDouble] {
        //return a.map { $0 + b }
        return addComplexComplexScalar(a, b)
    }

    static func + (_ a: ComplexDouble, _ b: [ComplexDouble]) -> [ComplexDouble] {
        //return b.map { a + $0 }
        return addComplexComplexScalar(b, a)
    }

}

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

func addComplexReal(_ a: [Complex], _ b: Double) -> [Complex] {
    let count = a.count

    return Array(unsafeUninitializedCapacity: count) { buffer, initializedCount in
        a.withUnsafeBufferPointer { ptr1 in
            for i in 0..<count {
                let a = ptr1[i]
                buffer[i].real = a.real + b
                buffer[i].imag = a.imag + b
            }
            initializedCount = count
        }
    }
}

func addComplexRealArray(_ a: [Complex], _ b: [Double]) -> [Complex] {
    let count = a.count

    return Array(unsafeUninitializedCapacity: count) { buffer, initializedCount in
        a.withUnsafeBufferPointer { ptr1 in
            b.withUnsafeBufferPointer { ptr2 in
                for i in 0..<count {
                    let a = ptr1[i]
                    let b = ptr2[i]
                    buffer[i].real = a.real + b
                    buffer[i].imag = a.imag + b
                }
                initializedCount = count
            }
        }
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
