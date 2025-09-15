//
//  Matrix+Subscript.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension Matrix {
/*
    // Row-major
    public subscript(i: Int, j: Int) -> Double {
        get {
            return grid[i * cols + j]
        }
        set {
            grid[i * cols + j] = newValue
        }
    }
*/
    // Column-major
    public subscript(i: Int, j: Int) -> Double {
        get {
            return grid[j * rows + i]
        }
        set {
            grid[j * rows + i] = newValue
        }
    }
}
