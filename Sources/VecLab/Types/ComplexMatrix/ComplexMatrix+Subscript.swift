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
            return grid[i * cols + j]
        }
        set {
            grid[i * cols + j] = newValue
        }
    }
    
}
