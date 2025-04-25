//
//  CoomplexDouble+Zip.swift
//  VecLab
//
//  Created by Marcus Painter on 25/04/2025.
//

/// The result of zip()
public func zip(_ sequence1: ComplexDoubleArray, _ sequence2: ComplexDoubleArray)
    -> ComplexZip2Sequence {
    return ComplexZip2Sequence(sequence1: sequence1, sequence2: sequence2)
}

/*

 See ComplexZip2Sequence for map, compactMap and ForEach.

 */
