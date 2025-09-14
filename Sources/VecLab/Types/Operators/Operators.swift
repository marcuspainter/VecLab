//
//  Operators.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

/// Power
infix operator ** : PowerPrecedence

/// Left conjugate multiply
infix operator ~* : MultiplicationPrecedence

/// Right conjugate multiply
infix operator *~ : MultiplicationPrecedence
