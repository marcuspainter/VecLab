//
//  Matrix+Subscript.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

extension Matrix {
    // Row-major
    public subscript(row: Int, col: Int) -> Double {
        get {
            return self.grid[row * self.cols + col]
        }
        set {
            self.grid[row * self.cols + col] = newValue
        }
    }
}


