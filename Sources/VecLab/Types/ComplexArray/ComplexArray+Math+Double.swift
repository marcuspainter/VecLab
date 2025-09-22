//
//  ComplexArray+Math+Double.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension Array where Element == Complex {

    public static func + (_ a: [Complex], _ b: Double) -> [Complex] {
        return CoreComplexVector.add(a, b)
    }

    public static func + (_ a: Double, _ b: [Complex]) -> [Complex] {
        return CoreComplexVector.add(a, b)
    }

    public static func - (_ a: [Complex], _ b: Double) -> [Complex] {
        return CoreComplexVector.subtract(a, b)
    }

    public static func - (_ a: Double, _ b: [Complex]) -> [Complex] {
        return CoreComplexVector.subtract(a, b)
    }

    public static func * (_ a: [Complex], _ b: Double) -> [Complex] {
        return CoreComplexVector.multiply(a, b)
    }

    public static func * (_ a: Double, _ b: [Complex]) -> [Complex] {
        return CoreComplexVector.multiply(a, b)
    }

    public static func / (_ a: [Complex], _ b: Double) -> [Complex] {
        return CoreComplexVector.divide(a, b)
    }

    public static func / (_ a: Double, _ b: [Complex]) -> [Complex] {
        return CoreComplexVector.divide(a, b)
    }
}
