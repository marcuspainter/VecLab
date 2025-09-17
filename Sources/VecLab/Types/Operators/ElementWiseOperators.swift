//
//  MatrixOperators.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

// Element-wise operator for matrices

infix operator .*   : MultiplicationPrecedence
infix operator .*=  : AssignmentPrecedence

infix operator ./   : MultiplicationPrecedence
infix operator ./=  : AssignmentPrecedence

infix operator .**  : PowerPrecedence
infix operator .**= : AssignmentPrecedence
