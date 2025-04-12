//
//  cat.swift
//
//
//  Created by Marcus Painter on 14/09/2023.
//

import Foundation

/// Concatenate arrays.
///
/// - Parameter arrays: List of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: RealArray...) -> RealArray {
    var newArray: RealArray = []
    for array in arrays {
        newArray.append(contentsOf: array)
    }
    return newArray
}

/// Concatenate arrays.
///
/// - Parameter arrays: Array of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: [RealArray]) -> RealArray {
    var newArray: RealArray = []
    for array in arrays {
        newArray.append(contentsOf: array)
    }
    return newArray
}

/// Concatenate arrays.
///
/// - Parameter arrays: List of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: ComplexArray...) -> ComplexArray {
    var newArray = ComplexArray()
    for array in arrays {
        newArray.real.append(contentsOf: array.real)
        newArray.imag.append(contentsOf: array.imag)
    }
    return newArray
}

/// - Parameter arrays: Array of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: [ComplexArray]) -> ComplexArray {
    var newArray = ComplexArray()
    for array in arrays {
        newArray.real.append(contentsOf: array.real)
        newArray.imag.append(contentsOf: array.imag)
    }
    return newArray
}
