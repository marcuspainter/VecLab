//
//  ComplexArray+Math+Complex.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension Array where Element == Complex {
    
    public static func + (_ a: [Complex], _ b: Complex) -> [Complex] {
        //return a.map { $0 + b }
        return CoreComplexVector.multiply(a, b)
    }

    public static func + (_ a: Complex, _ b: [Complex]) -> [Complex] {
        //return b.map { a + $0 }
        return CoreComplexVector.multiply(a, b)
    }
    
    public static func - (_ a: [Complex], _ b: Complex) -> [Complex] {
        return CoreComplexVector.subtract(a, b)
    }

    public static func - (_ a: Complex, _ b: [Complex]) -> [Complex] {
        return b.map { a - $0 }
    }
    
    public static func * (_ a: [Complex], _ b: Complex) -> [Complex] {
        //return a.map { $0 * b }
        return CoreComplexVector.multiply(a, b)
    }

    public static func * (_ a: Complex, _ b: [Complex]) -> [Complex] {
        //return b.map { a * $0 }
        return CoreComplexVector.multiply(a, b)
    }
    
    public static func / (_ a: [Complex], _ b: Complex) -> [Complex] {
        return a.map { $0 / b }
    }

    public static func / (_ a: Complex, _ b: [Complex]) -> [Complex] {
        return b.map { a / $0 }
    }
    
}
