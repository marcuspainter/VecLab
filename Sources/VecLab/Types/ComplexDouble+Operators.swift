//
//  ComplexDouble+Operators.swift
//  VecLab
//
//  Created by Marcus Painter on 16/04/2025.
//

extension ComplexDouble {
    // static func += <S: Sequence>(lhs: inout MyCollection<Element>, rhs: S) where S.Element == Element {
    // }

    static func += (lhs: inout ComplexDouble, rhs: ComplexDouble) {
        lhs = lhs + rhs
    }
    
    static func += (lhs: inout ComplexDouble, rhs: Double) {
        lhs = lhs + rhs
    }
    
}
