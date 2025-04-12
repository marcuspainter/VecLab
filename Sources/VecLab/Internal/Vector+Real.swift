//
//  Vector+Real.swift
//
//
//  Created by Marcus Painter on 11/09/2023.
//

import Accelerate
import Foundation

func vectorPowReal(_ a: [Double], _ b: [Double]) -> [Double] {
    var c = a
    c.withUnsafeMutableBufferPointer { cPtr in
        a.withUnsafeBufferPointer { aPtr in
            vForce.pow(bases: aPtr, exponents: b, result: &cPtr)
        }
    }
    return c
}

func vectorPowReal(_ a: [Float], _ b: [Float]) -> [Float] {
    var c = a
    c.withUnsafeMutableBufferPointer { cPtr in
        a.withUnsafeBufferPointer { aPtr in
            vForce.pow(bases: aPtr, exponents: b, result: &cPtr)
        }
    }
    return c
}

func vectorPowReal(_ a: [Double], _ b: Double) -> [Double] {
    var c = a
    let bb = [Double](repeating: b, count: a.count)
    c.withUnsafeMutableBufferPointer { cPtr in
        a.withUnsafeBufferPointer { aPtr in
            vForce.pow(bases: aPtr, exponents: bb, result: &cPtr)
        }
    }
    return c
}

func vectorPowReal(_ a: [Float], _ b: Float) -> [Float] {
    var c = a
    let bb = [Float](repeating: b, count: a.count)
    c.withUnsafeMutableBufferPointer { cPtr in
        a.withUnsafeBufferPointer { aPtr in
            vForce.pow(bases: aPtr, exponents: bb, result: &cPtr)
        }
    }
    return c
}

func vectorPowReal(_ a: Double, _ b: [Double]) -> [Double] {
    var c = b
    let aa = [Double](repeating: a, count: b.count)
    c.withUnsafeMutableBufferPointer { cPtr in
        aa.withUnsafeBufferPointer { aPtr in
            vForce.pow(bases: aPtr, exponents: b, result: &cPtr)
        }
    }

    return c
}

func vectorPowReal(_ a: Float, _ b: [Float]) -> [Float] {
    var c = b
    let aa = [Float](repeating: a, count: b.count)
    c.withUnsafeMutableBufferPointer { cPtr in
        aa.withUnsafeBufferPointer { aPtr in
            vForce.pow(bases: aPtr, exponents: b, result: &cPtr)
        }
    }

    return c
}
