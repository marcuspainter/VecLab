//
//  ComplexArray+Math+DoubleArray.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension Array where Element == Complex {
    public static func + (_ a: [Complex], _ b: [Double]) -> [Complex] {
        return CoreComplexArray.add(a, b)
    }

    public static func + (_ a: [Double], _ b: [Complex]) -> [Complex] {
        return CoreComplexArray.add(a, b)
    }

    public static func - (_ a: [Complex], _ b: [Double]) -> [Complex] {
        return CoreComplexArray.subtract(a, b)
    }

    public static func - (_ a: [Double], _ b: [Complex]) -> [Complex] {
        return CoreComplexArray.subtract(a, b)
    }

    public static func * (_ a: [Complex], _ b: [Double]) -> [Complex] {
        return CoreComplexArray.multiply(a, b)
    }

    public static func * (_ a: [Double], _ b: [Complex]) -> [Complex] {
        return CoreComplexArray.multiply(a, b)
    }

    public static func / (_ a: [Complex], _ b: [Double]) -> [Complex] {
        return CoreComplexArray.divide(a, b)
    }

    public static func / (_ a: [Double], _ b: [Complex]) -> [Complex] {
        return CoreComplexArray.divide(a, b)
    }

}
