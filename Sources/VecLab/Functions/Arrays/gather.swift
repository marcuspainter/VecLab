//
//  gather.swift
//  VecLab
//
//  Created by Marcus Painter on 22/02/2025.
//

///  Create an array from array of indices.
/// - Parameters:
///   - x: Input real array.
///   - indices: Array of indices.
/// - Returns: Array of selected elements.
public func gather(_ x: RealArray, _ indices: RealArray) -> RealArray {
    return indices.map { x[Int($0)] }
}

///  Create a complex array from array of indices.
/// - Parameters:A
///   - x: Input complex array.
///   - indices: Array of indices.
/// - Returns: Array of selected elements.
public func gather(_ x: ComplexArray, _ indices: RealArray) -> ComplexArray {
    assertSameSize(x)
    let real = gather(x.real, indices)
    let imag = gather(x.imag, indices)
    return ComplexArray(real, imag)
}

///  Create a real array from array of integer indices.
/// - Parameters:A
///   - x: Input complex array.
///   - indices: Array of indices.
/// - Returns: Array of selected elements.
public func gather(_ x: RealArray, _ indices: [Int]) -> RealArray {
    return indices.map { x[$0] }
}

///  Create a real complex from array of integer indices.
/// - Parameters:A
///   - x: Input complex array.
///   - indices: Array of indices.
/// - Returns: Array of selected elements.
public func gather(_ x: ComplexArray, _ indices: [Int]) -> ComplexArray {
    assertSameSize(x)
    let real = gather(x.real, indices)
    let imag = gather(x.imag, indices)
    return ComplexArray(real, imag)
}
