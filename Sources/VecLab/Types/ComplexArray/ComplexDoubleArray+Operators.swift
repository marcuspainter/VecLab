//
//  ComplexArray+Operators.swift
//  VecLab
//
//  Created by Marcus Painter on 16/04/2025.
//

extension ComplexDoubleArray {
    // static func += <S: Sequence>(lhs: inout MyCollection<Element>, rhs: S) where S.Element == Element {
    // }

    public static func += (lhs: inout ComplexDoubleArray, rhs: ComplexDoubleArray) {
        lhs = lhs + rhs
    }
/*
    public static func += (lhs: inout ComplexDoubleArray, rhs: [Double]) {
        lhs = lhs + rhs
    }

    public static func += (lhs: inout ComplexDoubleArray, rhs: ComplexDouble) {
        lhs = lhs + rhs
    }
 */
    
}
