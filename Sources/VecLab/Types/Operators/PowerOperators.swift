//
//  PowerOperators.swift
//  VecLab
//
//  Created by Marcus Painter on 16/09/2025.
//

// Uses Matlab convention: 2**2**3 Matlab = 64, NumPy = 256
precedencegroup PowerPrecedence {
    higherThan: MultiplicationPrecedence
    // NumPy
    // associativity: right
    // Matlab
    associativity: left
}

/// Power operator.
infix operator ** : PowerPrecedence
