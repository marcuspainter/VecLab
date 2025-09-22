//
//  ComplexMatrix+Transpose.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

extension ComplexMatrix {

    public var T: ComplexMatrix {
        return CoreComplexMatrix.transpose(self)
    }

    public var H: ComplexMatrix {
        return CoreComplexMatrix.conjugateTranspose(self)
    }
}
