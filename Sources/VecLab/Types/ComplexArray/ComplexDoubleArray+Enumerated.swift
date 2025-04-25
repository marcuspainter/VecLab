//
//  ComplexDoubleArray+Other.swift
//  VecLab
//
//  Created by Marcus Painter on 24/04/2025.
//

/* This was really tricky to get working
 enumerate() returns array
 */

extension ComplexDoubleArray {
    
    public func enumerated() -> ComplexEnumeratedSequence {
        return ComplexEnumeratedSequence(sequence: self)
    }
}

/*

 See ComplexEnumeratedSequence for map, compactMap and ForEach.

 */
 
