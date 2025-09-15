//
//  Matrix+Subscript.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension Matrix {
    
    // Row-major
    public subscript(i: Int, j: Int) -> Double {
        get {
            return grid[i * cols + j]
        }
        set {
            grid[i * cols + j] = newValue
        }
    }
}
