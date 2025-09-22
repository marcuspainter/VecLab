//
//  CoreVector.swift
//  VecLab
//
//  Created by Marcus Painter on 17/09/2025.
//

import Accelerate

enum CoreVectorVDSP {

    @inlinable
    static func add(_ a: borrowing [Double], _ b: borrowing [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            vDSP.add(a, b, result: &c)
            initializedCount = a.count
        }
    }

    @inlinable
    static func subtract(_ a: [Double], _ b: [Double]) -> [Double] {
        vDSP.subtract(a, b)
    }

    @inlinable
    static func subtractScalar(_ a: [Double], _ b: Double) -> [Double] {
        let bb = [Double](repeating: b, count: a.count)
        return vDSP.subtract(a, bb)
    }

    @inlinable
    static func subtractScalar(_ a: Double, _ b: [Double]) -> [Double] {
        let aa = [Double](repeating: a, count: b.count)
        return vDSP.subtract(aa, b)
    }

    @inlinable
    static func multiplyScalar(_ a: [Double], _ b: Double) -> [Double] {
        return vDSP.multiply(b, a)
    }

    @inlinable
    static func multiply(_ a: [Double], _ b: [Double]) -> [Double] {
        return vDSP.multiply(a, b)
    }

    @inlinable
    static func divideScalar(_ a: [Double], _ b: Double) -> [Double] {
        return vDSP.divide(a, b)
    }

    @inlinable
    static func divideScalar(_ a: Double, _ b: [Double]) -> [Double] {
        let aa = [Double](repeating: a, count: b.count)
        return vDSP.divide(aa, b)
    }

    @inlinable
    static func divide(_ a: [Double], _ b: [Double]) -> [Double] {
        vDSP.divide(a, b)
    }

    @inlinable
    static func unaryMinus(_ a: [Double]) -> [Double] {
        return vDSP.negative(a)
    }
    
    @inlinable
    static func sin(_ a: [Double]) -> [Double] {
        return vForce.sin(a)
    }

}
