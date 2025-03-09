//
//  getindex.swift
//  VecLab
//
//  Created by Marcus Painter on 09/03/2025.
//

/// Get new array element at index.
/// - Parameters:
///   - x: Input array.
///   - index: Array of indices.
/// - Returns: Array.
public func getindex(_ x: RealArray, index: Int) -> Real {
    return x[index]
}

/// Get new array from indices.
/// - Parameters:
///   - x: Input array.
///   - index: Array of indices.
/// - Returns: Array.
public func getindex(_ x: ComplexArray, index: Int) -> Complex {
    return (x.0[index], x.1[index])
}

// MARK:

/// Get new array from indices.
/// - Parameters:
///   - x: Input array.
///   - index: Array of indices.
/// - Returns: Array.
public func getindex(_ x: RealArray, index: Real) -> Real {
    return x[Int(index)]
}

/// Get new array from indices.
/// - Parameters:
///   - x: Input array.
///   - index: Array of indices.
/// - Returns: Array.
public func getindex(_ x: ComplexArray, index: Real) -> Complex {
    return (x.0[Int(index)], x.1[Int(index)])
}

// MARK:

/// Get new array from indices.
/// - Parameters:
///   - x: Input array.
///   - indices: Array of indices.
/// - Returns: Array.
public func getindex(_ x: RealArray, indices: [Int]) -> RealArray {
    return indices.map { x[$0] }
}

/// Get new array from indices.
/// - Parameters:
///   - x: Input array.
///   - indices: Array of indices.
/// - Returns: Array.
public func getindex(_ x: RealArray, indices: RealArray) -> RealArray{
    return indices.map { x[Int($0)] }
}

/// Get new array from indices.
/// - Parameters:
///   - x: Input array.
///   - indices: Array of indices.
/// - Returns: Array.
public func getindex(_ x: ComplexArray, indices: [Int]) -> ComplexArray {
    let real = indices.map { x.0[$0] }
    let imag = indices.map { x.1[$0] }
    return (real, imag)
}

/// Get new array from indices.
/// - Parameters:
///   - x: Input array.
///   - indices: Array of indices.
/// - Returns: Array.
public func getindex(_ x: ComplexArray, indices: RealArray) -> ComplexArray {
    let real = indices.map { x.0[Int($0)] }
    let imag = indices.map { x.1[Int($0)] }
    return (real, imag)
}
