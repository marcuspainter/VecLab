//
//  Matrix+Properties.swift
//  VecLab
//
//  Created by Marcus Painter on 17/09/2025.
//

extension Matrix {
    
    var isColumn: Bool {
        return cols == 1
    }
        
    var isRow: Bool {
        return rows == 1
    }
    
    var isSquare: Bool {
        return rows == cols
    }
        
    var isScalar: Bool {
        return rows == 1 && cols == 1
    }

    var isVector: Bool {
        return rows == 1 && cols == 1
    }

    var isEmpty: Bool {
        return rows == 0 && cols == 0
    }

}
