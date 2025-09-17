//
//  ComplexMatrix+Subscript.swift
//  VecLab
//
//  Created by Marcus Painter on 10/09/2025.
//

extension ComplexMatrix {
    
    // Column-major
    @inlinable
    public subscript(i: Int, j: Int) -> Complex {
        get {
            return data[j * rows + i]
        }
        set {
            data[j * rows + i] = newValue
        }
    }

    @inlinable
    public subscript(i: Int) -> Complex {
        get {
            return data[i]
        }
        set {
            data[i] = newValue
        }
    }

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
    
}


