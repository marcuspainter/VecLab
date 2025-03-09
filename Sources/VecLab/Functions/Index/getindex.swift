//
//  getindex.swift
//  VecLab
//
//  Created by Marcus Painter on 09/03/2025.
//

/// Get  a real array element at index.
/// - Parameters:
///   - x: Input array.
///   - index: Integer index.
/// - Returns: Array element.
public func getindex(_ x: RealArray, index: Int) -> Real {
    return x[index]
}

/// Get  a complex array element at index.
/// - Parameters:
///   - x: Complex array.
///   - index: Integer index.
/// - Returns: Array element.
public func getindex(_ x: ComplexArray, index: Int) -> Complex {
    return (x.0[index], x.1[index])
}

// MARK:

/// Get  a real array element at index.
/// - Parameters:
///   - x: Real array.
///   - index: Real index.
/// - Returns: Array element.
public func getindex(_ x: RealArray, index: Real) -> Real {
    return x[Int(index)]
}

/// Get  a complex array element at index.
/// - Parameters:
///   - x: Complex array.
///   - index: Real index.
/// - Returns: Array element.
public func getindex(_ x: ComplexArray, index: Real) -> Complex {
    return (x.0[Int(index)], x.1[Int(index)])
}

// MARK:

/// Get a real array from indices.
/// - Parameters:
///   - x: Real array.
///   - indices: Array of integer indices.
/// - Returns: Array.
public func getindex(_ x: RealArray, indices: [Int]) -> RealArray {
    return indices.map { x[$0] }
}

/// Get a real array from indices.
/// - Parameters:
///   - x: Real array.
///   - indices: Array of real indices.
/// - Returns: Array.
public func getindex(_ x: RealArray, indices: RealArray) -> RealArray{
    return indices.map { x[Int($0)] }
}

/// Get a complex array from indices.
/// - Parameters:
///   - x: Complex array.
///   - indices: Array of integer indices.
/// - Returns: Array.
public func getindex(_ x: ComplexArray, indices: [Int]) -> ComplexArray {
    let real = indices.map { x.0[$0] }
    let imag = indices.map { x.1[$0] }
    return (real, imag)
}

/// Get a complex array from indices.
/// - Parameters:
///   - x: Complex array.
///   - indices: Array of real indices.
/// - Returns: Array.
public func getindex(_ x: ComplexArray, indices: RealArray) -> ComplexArray {
    let real = indices.map { x.0[Int($0)] }
    let imag = indices.map { x.1[Int($0)] }
    return (real, imag)
}
