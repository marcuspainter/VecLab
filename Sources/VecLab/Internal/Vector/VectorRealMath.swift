//
//  VectorRealMath.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

import Accelerate
import Foundation

func vectorPowReal(_ a: [Double], _ b: [Double]) -> [Double] {
    return vForce.pow(bases: a, exponents: b)
}

func vectorPowReal(_ a: [Double], _ b: Double) -> [Double] {
    let bb = [Double](repeating: b, count: a.count)
    return vForce.pow(bases: a, exponents: bb)
}

func vectorPowReal(_ a: Double, _ b: [Double]) -> [Double] {
    let aa = [Double](repeating: a, count: b.count)
    return vForce.pow(bases: aa, exponents: b)
}
