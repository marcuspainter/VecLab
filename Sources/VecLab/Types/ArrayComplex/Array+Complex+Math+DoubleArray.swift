//
//  Array+Complex+Math+DoubleArray.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension Array where Element == Complex {
    public static func + (_ a: [Complex], _ b: [Double]) -> [Complex] {
        //return zip(a, b).map { $0 + $1 }
        return addComplexRealArray(a, b)
    }
    
    public static func + (_ a: [Double], _ b: [Complex]) -> [Complex] {
        // return zip(a, b).map { $0 + $1 }
        return addComplexRealArray(b, a)
    }
    
    public static func - (_ a: [Complex], _ b: [Double]) -> [Complex] {
        return zip(a, b).map { $0 - $1 }
    }

    public static func - (_ a: [Double], _ b: [Complex]) -> [Complex] {
        return zip(a, b).map { $0 - $1 }
    }
    
    public static func * (_ a: [Complex], _ b: [Double]) -> [Complex] {
        //return zip(a, b).map { $0 * $1 }
        return multiplyComplexRealArray(a, b)
    }

    public static func * (_ a: [Double], _ b: [Complex]) -> [Complex] {
        //return zip(a, b).map { $0 * $1 }
        return multiplyComplexRealArray(b, a)
    }
    
    public static func / (_ a: [Complex], _ b: [Double]) -> [Complex] {
        return zip(a, b).map { $0 / $1 }
    }

    public static func / (_ a: [Double], _ b: [Complex]) -> [Complex] {
        return zip(a, b).map { $0 / $1 }
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
                    buffer[i].imag = a.imag
                }
                initializedCount = count
            }
        }
    }
}

func multiplyComplexRealArray(_ a: [Complex], _ b: [Double]) -> [Complex] {
    let count = a.count

    return Array(unsafeUninitializedCapacity: count) { buffer, initializedCount in
        a.withUnsafeBufferPointer { ptr1 in
            b.withUnsafeBufferPointer { ptr2 in
                for i in 0..<count {
                    let a = ptr1[i]
                    let b = ptr2[i]
                    buffer[i].real = a.real * b
                    buffer[i].imag = a.imag * b
                }
                initializedCount = count
            }
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
