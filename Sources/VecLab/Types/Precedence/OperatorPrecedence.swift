//
//  OperatorPrecedence.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

// Uses Matlab convention: 2**2**3 Matlab = 64, NumPy = 256
precedencegroup PowerPrecedence {
    higherThan: MultiplicationPrecedence
    associativity: left     // Matlab
    //associativity: right    // NumPy
}

/// Power
infix operator **: PowerPrecedence

/// Left conjugate multiply
infix operator ~*: MultiplicationPrecedence

/// Right conjugate multiply
infix operator *~: MultiplicationPrecedence
