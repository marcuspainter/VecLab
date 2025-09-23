//
//  ComplexArray+Power.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

extension Array where Element == Complex {

    public static func ** (_ a: [Complex], _ b: [Complex]) -> [Complex] {
        return CoreComplexArray.pow(a, b)
    }

    public static func ** (_ a: [Complex], _ b: Double) -> [Complex] {
        return CoreComplexArray.pow(a, b)
    }

    public static func ** (_ a: Double, _ b: [Complex]) -> [Complex] {
        return CoreComplexArray.pow(a, b)
    }

    public static func ** (_ a: [Complex], _ b: [Double]) -> [Complex] {
        return CoreComplexArray.pow(a, b)
    }

    public static func ** (_ a: [Double], _ b: [Complex]) -> [Complex] {
        return CoreComplexArray.pow(a, b)
    }

    public static func ** (_ a: [Complex], _ b: Complex) -> [Complex] {
        return CoreComplexArray.pow(a, b)
    }

    public static func ** (_ a: Complex, _ b: [Complex]) -> [Complex] {
        return CoreComplexArray.pow(a, b)
    }

}
