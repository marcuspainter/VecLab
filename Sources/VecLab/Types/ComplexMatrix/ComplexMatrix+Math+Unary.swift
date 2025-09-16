//
//  ComplexMatrix+Math+Unary.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

public extension ComplexMatrix {
    
    static prefix func - (_ a: ComplexMatrix) -> ComplexMatrix {
        return ComplexMatrix(a, data: -a.data)
    }
}
