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
            return data[i * cols + j]
        }
        set {
            data[i * cols + j] = newValue
        }
    }
*/
    // Column-major
    public subscript(i: Int, j: Int) -> Double {
        get {
            return data[j * rows + i]
        }
        set {
            data[j * rows + i] = newValue
        }
    }
}
