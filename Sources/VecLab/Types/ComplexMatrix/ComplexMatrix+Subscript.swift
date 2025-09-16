//
//  ComplexMatrix+Subscript.swift
//  VecLab
//
//  Created by Marcus Painter on 10/09/2025.
//

extension ComplexMatrix {
    
    // Row-major
    public subscript(i: Int, j: Int) -> Complex {
        get {
            return data[i * cols + j]
        }
        set {
            data[i * cols + j] = newValue
        }
    }
    
}
