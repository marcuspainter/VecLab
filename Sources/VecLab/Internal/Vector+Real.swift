//
//  Vector+Real.swift
//  
//
//  Created by Marcus Painter on 11/09/2023.
//

import Foundation
import Accelerate

func vectorRealPow(_ a: [Double], _ b: [Double]) -> [Double] {
    var c = vForce.log(a)
    // Vector-vector multiply
    c = vDSP.multiply(c, b)
    return vForce.exp(c)
}

func vectorRealPow(_ a: [Float], _ b: [Float]) -> [Float] {
    var c = vForce.log(a)
    // Vector-vector multiply
    c = vDSP.multiply(c, b)
    return vForce.exp(c)
}

func vectorRealPow(_ a: [Double], _ b: Double) -> [Double] {
    var c = vForce.log(a)
    // Scalar-vector multiply
    c = vDSP.multiply(b, c)
    return vForce.exp(c)
}

func vectorRealPow(_ a: [Float], _ b: Float) -> [Float] {
    var c = vForce.log(a)
    // Scalar-vector multiply
    c = vDSP.multiply(b, c)
    return vForce.exp(c)
}

func vectorRealPow(_ a: Double, _ b: [Double]) -> [Double] {
    let c = Darwin.log(a)
    // Scalar-vector multiply
    let d = vDSP.multiply(c, b)
    return vForce.exp(d)
}

func vectorRealPow(_ a: Float, _ b: [Float]) -> [Float] {
    let c = Darwin.log(a)
    // Scalar-vector multiply
    let d = vDSP.multiply(c, b)
    return vForce.exp(d)
}
