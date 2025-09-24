//
//  CoreComplexArray.swift
//  VecLab
//
//  Created by Marcus Painter on 18/09/2025.
//
import Foundation

typealias ComplexBufferPointer = UnsafeMutableBufferPointer<Complex>

enum CoreComplexArray {

    // . MARK: add

    static func add(_ a: [Complex], _ b: [Complex]) -> [Complex] {
        precondition(a.count == b.count, "Mismatched lengths in add: [Complex] + [Complex]")
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i].real + b[i].real
                c[i].imag = a[i].imag + b[i].imag
            }
            initializedCount = a.count
        }
    }

    static func add(_ a: [Complex], _ b: Double) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i].real + b
                c[i].imag = a[i].imag
            }
            initializedCount = a.count
        }
    }

    static func add(_ a: Double, _ b: [Complex]) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: b.count) { c, initializedCount in
            for i in 0..<b.count {
                c[i].real = a + b[i].real
                c[i].imag = b[i].imag
            }
            initializedCount = b.count
        }
    }

    static func add(_ a: [Complex], _ b: [Double]) -> [Complex] {
        precondition(a.count == b.count, "Mismatched lengths in add: [Complex] + [Double]")
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i].real + b[i]
                c[i].imag = a[i].imag
            }
            initializedCount = a.count
        }
    }

    static func add(_ a: [Double], _ b: [Complex]) -> [Complex] {
        precondition(a.count == b.count, "Mismatched lengths in add: [Double] + [Complex]")
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i] + b[i].real
                c[i].imag = b[i].imag
            }
            initializedCount = a.count
        }
    }

    static func add(_ a: [Complex], _ b: Complex) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i].real + b.real
                c[i].imag = a[i].imag + b.imag
            }
            initializedCount = a.count
        }
    }

    static func add(_ a: Complex, _ b: [Complex]) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: b.count) { c, initializedCount in
            for i in 0..<b.count {
                c[i].real = a.real + b[i].real
                c[i].imag = a.imag + b[i].imag
            }
            initializedCount = b.count
        }
    }

    // MARK: subtract

    static func subtract(_ a: [Complex], _ b: [Complex]) -> [Complex] {
        precondition(a.count == b.count, "Mismatched lengths in subtract: [Complex] - [Complex]")
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i].real - b[i].real
                c[i].imag = a[i].imag - b[i].imag
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func subtract(_ a: [Complex], _ b: Double) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i].real - b
                c[i].imag = a[i].imag
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func subtract(_ a: Double, _ b: [Complex]) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: b.count) { c, initializedCount in
            for i in 0..<b.count {
                c[i].real = a - b[i].real
                c[i].imag = -b[i].imag
            }
            initializedCount = b.count
        }
    }

    @inlinable
    static func subtract(_ a: [Complex], _ b: [Double]) -> [Complex] {
        precondition(a.count == b.count, "Mismatched lengths in subtract: [Complex] - [Double]")
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i].real - b[i]
                c[i].imag = a[i].imag
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func subtract(_ a: [Double], _ b: [Complex]) -> [Complex] {
        precondition(a.count == b.count, "Mismatched lengths in subtract: [Double] - [Complex]")
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i] - b[i].real
                c[i].imag = -b[i].imag
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func subtract(_ a: [Complex], _ b: Complex) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i].real - b.real
                c[i].imag = a[i].imag - b.imag
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func subtract(_ a: Complex, _ b: [Complex]) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: b.count) { c, initializedCount in
            for i in 0..<b.count {
                c[i].real = a.real - b[i].real
                c[i].imag = a.imag - b[i].imag
            }
            initializedCount = b.count
        }
    }

    // MARK: multiply

    static func multiply(_ a: [Complex], _ b: [Complex]) -> [Complex] {
        precondition(a.count == b.count, "Mismatched lengths in subtract: [Complex] - [Complex]")
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i].real * b[i].real - a[i].imag * b[i].imag
                c[i].imag = a[i].real * b[i].imag + a[i].imag * b[i].real
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func multiply(_ a: [Complex], _ b: Double) -> [Complex] {
        precondition(a.count == a.count, "Mismatched lengths in multiply: [Complex] * Double")  // This is always true; no length check needed.
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i].real * b
                c[i].imag = a[i].imag * b
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func multiply(_ a: Double, _ b: [Complex]) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: b.count) { c, initializedCount in
            for i in 0..<b.count {
                c[i].real = a * b[i].real
                c[i].imag = a * b[i].imag
            }
            initializedCount = b.count
        }
    }

    @inlinable
    static func multiply(_ a: [Complex], _ b: [Double]) -> [Complex] {
        precondition(a.count == b.count, "Mismatched lengths in multiply: [Complex] * [Double]")
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i].real * b[i]
                c[i].imag = a[i].imag * b[i]
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func multiply(_ a: [Double], _ b: [Complex]) -> [Complex] {
        precondition(a.count == b.count, "Mismatched lengths in multiply: [Double] * [Complex]")
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i] * b[i].real
                c[i].imag = a[i] * b[i].imag
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func multiply(_ a: [Complex], _ b: Complex) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i].real * b.real - a[i].imag * b.imag
                c[i].imag = a[i].real * b.imag + a[i].imag * b.real
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func multiply(_ a: Complex, _ b: [Complex]) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: b.count) { c, initializedCount in
            for i in 0..<b.count {
                c[i].real = a.real * b[i].real - a.imag * b[i].imag
                c[i].imag = a.real * b[i].imag + a.imag * b[i].real
            }
            initializedCount = b.count
        }
    }

    // MARK: divide

    static func divide(_ a: [Complex], _ b: [Complex]) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                let x = b[i].real
                let y = b[i].imag
                // precondition(!(x == 0 && y == 0), "Division by zero complex at index \(i)")
                if Darwin.fabs(x) >= Darwin.fabs(y) {
                    // r = y/x, denom = x + y*r
                    let r = y / x
                    let denom = x + y * r
                    // (a+bi)/(x+yi) = ((a + b*r) + i(b - a*r)) / denom
                    c[i].real = (a[i].real + a[i].imag * r) / denom
                    c[i].imag = (a[i].imag - a[i].real * r) / denom
                } else {
                    // r = x/y, denom = y + x*r
                    let r = x / y
                    let denom = y + x * r
                    // (a+bi)/(x+yi) = ((a.real*r + a.imag) + i(a.imag*r - a.real)) / denom
                    c[i].real = (a[i].real * r + a[i].imag) / denom
                    c[i].imag = (a[i].imag * r - a[i].real) / denom
                }
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func divide(_ a: [Complex], _ b: Double) -> [Complex] {
        precondition(b != 0, "Division by zero scalar in divide: [Complex] / Double")
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i].real / b
                c[i].imag = a[i].imag / b
            }
            initializedCount = a.count
        }
    }

    static func divide(_ a: [Complex], _ b: Complex) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                let x = b.real
                let y = b.imag
                // precondition(!(x == 0 && y == 0), "Division by zero complex at index \(i)")
                if Darwin.fabs(x) >= Darwin.fabs(y) {
                    // r = y/x, denom = x + y*r
                    let r = y / x
                    let denom = x + y * r
                    // (a+bi)/(x+yi) = ((a + b*r) + i(b - a*r)) / denom
                    c[i].real = (a[i].real + a[i].imag * r) / denom
                    c[i].imag = (a[i].imag - a[i].real * r) / denom
                } else {
                    // r = x/y, denom = y + x*r
                    let r = x / y
                    let denom = y + x * r
                    // (a+bi)/(x+yi) = ((a.real*r + a.imag) + i(a.imag*r - a.real)) / denom
                    c[i].real = (a[i].real * r + a[i].imag) / denom
                    c[i].imag = (a[i].imag * r - a[i].real) / denom
                }
            }
            initializedCount = a.count
        }
    }

    static func divide(_ a: Complex, _ b: [Complex]) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: b.count) { c, initializedCount in
            for i in 0..<b.count {
                let x = b[i].real
                let y = b[i].imag
                // precondition(!(x == 0 && y == 0), "Division by zero complex at index \(i)")
                if Darwin.fabs(x) >= Darwin.fabs(y) {
                    // r = y/x, denom = x + y*r
                    let r = y / x
                    let denom = x + y * r
                    // (a+bi)/(x+yi) = ((a + b*r) + i(b - a*r)) / denom
                    c[i].real = (a.real + a.imag * r) / denom
                    c[i].imag = (a.imag - a.real * r) / denom
                } else {
                    // r = x/y, denom = y + x*r
                    let r = x / y
                    let denom = y + x * r
                    // (a+bi)/(x+yi) = ((a.real*r + a.imag) + i(a.imag*r - a.real)) / denom
                    c[i].real = (a.real * r + a.imag) / denom
                    c[i].imag = (a.imag * r - a.real) / denom
                }
            }
            initializedCount = b.count
        }
    }

    static func divide(_ a: [Complex], _ b: [Double]) -> [Complex] {
        precondition(a.count == b.count, "Mismatched lengths in divide: [Complex] / [Double]")
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                // precondition(b[i] != 0, "Division by zero scalar at index \(i)")
                c[i].real = a[i].real / b[i]
                c[i].imag = a[i].imag / b[i]
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func divide(_ a: Double, _ b: [Complex]) -> [Complex] {
        precondition(!b.isEmpty, "Empty denominator vector in divide: Double / [Complex]")
        return [Complex](unsafeUninitializedCapacity: b.count) { c, initializedCount in
            for i in 0..<b.count {
                let x = b[i].real
                let y = b[i].imag
                // precondition(!(x == 0 && y == 0), "Division by zero complex at index \(i)")
                if Darwin.fabs(x) >= Darwin.fabs(y) {
                    let r = y / x
                    let denom = x + y * r
                    c[i].real = (a / denom)
                    c[i].imag = (-a * r) / denom
                } else {
                    let r = x / y
                    let denom = y + x * r
                    c[i].real = (a * r) / denom
                    c[i].imag = -a / denom
                }
            }
            initializedCount = b.count
        }
    }

    static func divide(_ a: [Double], _ b: [Complex]) -> [Complex] {
        precondition(a.count == b.count, "Mismatched lengths in divide: [Double] / [Complex]")
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                let x = b[i].real
                let y = b[i].imag
                // precondition(!(x == 0 && y == 0), "Division by zero complex at index \(i)")
                if Darwin.fabs(x) >= Darwin.fabs(y) {
                    let r = y / x
                    let denom = x + y * r
                    c[i].real = (a[i] / denom)
                    c[i].imag = (-a[i] * r) / denom
                } else {
                    let r = x / y
                    let denom = y + x * r
                    c[i].real = (a[i] * r) / denom
                    c[i].imag = -a[i] / denom
                }
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func unaryMinus(_ a: [Complex]) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = -a[i].real
                c[i].imag = -a[i].imag
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func conjugate(_ a: [Complex]) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i].real
                c[i].imag = -a[i].imag
            }
            initializedCount = a.count
        }
    }

    @inlinable
    // c = conj(a) * b
    static func leftConjugateMultiply(_ a: [Complex], _ b: [Complex]) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i].real * b[i].real + a[i].imag * b[i].imag
                c[i].imag = a[i].real * b[i].imag - a[i].imag * b[i].real
            }
            initializedCount = a.count
        }
    }

    @inlinable
    // c = a * conj(b)
    static func rightConjugateMultiply(_ a: [Complex], _ b: [Complex]) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i].real = a[i].real * b[i].real + a[i].imag * b[i].imag
                c[i].imag = a[i].imag * b[i].real - a[i].real * b[i].imag
            }
            initializedCount = a.count
        }
    }

}

extension CoreComplexArray {

    public static func pow (_ a: [Complex], _ b: [Complex]) -> [Complex] {
        return zip(a, b).map { $0 ** $1 }
    }

    public static func pow (_ a: [Complex], _ b: Double) -> [Complex] {
        return a.map { $0 ** b }
    }

    public static func pow (_ a: Double, _ b: [Complex]) -> [Complex] {
        return b.map { a ** $0 }
    }

    public static func pow (_ a: [Complex], _ b: [Double]) -> [Complex] {
        return zip(a, b).map { $0 ** $1 }
    }

    public static func pow (_ a: [Double], _ b: [Complex]) -> [Complex] {
        return zip(a, b).map { $0 ** $1 }
    }

    public static func pow (_ a: [Complex], _ b: Complex) -> [Complex] {
        return a.map { $0 ** b }
    }

    public static func pow (_ a: Complex, _ b: [Complex]) -> [Complex] {
        return b.map { a ** $0 }
    }
}
