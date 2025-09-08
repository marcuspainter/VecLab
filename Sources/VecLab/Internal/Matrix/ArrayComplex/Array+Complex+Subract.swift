//
//  Array+Complex+Subract.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

extension Array where Element == Complex {

    static func - (_ a: [Complex], _ b: [Complex]) -> [Complex] {
        return zip(a, b).map { $0 - $1 }
    }

    static func - (_ a: [Complex], _ b: Double) -> [Complex] {
        return a.map { $0 - b }
    }

    static func - (_ a: Double, _ b: [Complex]) -> [Complex] {
        return b.map { a - $0 }
    }

    static func - (_ a: [Complex], _ b: [Double]) -> [Complex] {
        return zip(a, b).map { $0 - $1 }
    }

    static func - (_ a: [Double], _ b: [Complex]) -> [Complex] {
        return zip(a, b).map { $0 - $1 }
    }

    static func - (_ a: [Complex], _ b: Complex) -> [Complex] {
        return a.map { $0 - b }
    }

    static func - (_ a: Complex, _ b: [Complex]) -> [Complex] {
        return b.map { a - $0 }
    }

}
