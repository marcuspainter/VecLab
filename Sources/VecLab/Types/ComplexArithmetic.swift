//
//  ComplexArithmetic.swift
//  VecLab
//
//  Created by Marcus Painter on 18/04/2025.
//

protocol ComplexArithmetic {
    static func + (lhs: Self, rhs: Self) -> Self
    static func - (lhs: Self, rhs: Self) -> Self
    static func * (lhs: Self, rhs: Self) -> Self
    static func / (lhs: Self, rhs: Self) -> Self
}
