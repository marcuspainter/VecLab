//
//  Array+Complex+Subract.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

extension Array where Element == ComplexDouble {

    static func - (_ a: [ComplexDouble], _ b: [ComplexDouble]) -> [ComplexDouble] {
        return zip(a, b).map { $0 - $1 }
    }

    static func - (_ a: [ComplexDouble], _ b: Double) -> [ComplexDouble] {
        return a.map { $0 - b }
    }

    static func - (_ a: Double, _ b: [ComplexDouble]) -> [ComplexDouble] {
        return b.map { a - $0 }
    }

    static func - (_ a: [ComplexDouble], _ b: [Double]) -> [ComplexDouble] {
        return zip(a, b).map { $0 - $1 }
    }

    static func - (_ a: [Double], _ b: [ComplexDouble]) -> [ComplexDouble] {
        return zip(a, b).map { $0 - $1 }
    }

    static func - (_ a: [ComplexDouble], _ b: ComplexDouble) -> [ComplexDouble] {
        return a.map { $0 - b }
    }

    static func - (_ a: ComplexDouble, _ b: [ComplexDouble]) -> [ComplexDouble] {
        return b.map { a - $0 }
    }

}
