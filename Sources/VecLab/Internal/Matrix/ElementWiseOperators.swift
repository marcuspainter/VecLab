//
//  MatrixOperators.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

// Element-wise operator for matrices

infix operator .**  : PowerPrecedence
infix operator .*   : MultiplicationPrecedence
infix operator ./   : MultiplicationPrecedence

infix operator .**= : PowerPrecedence
infix operator .*=  : MultiplicationPrecedence
infix operator ./=  : MultiplicationPrecedence
