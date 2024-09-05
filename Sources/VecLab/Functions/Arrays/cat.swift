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
public func cat(_ arrays: RealDoubleArray...) -> RealDoubleArray {
    var newArray: RealDoubleArray = []
    for array in arrays {
        newArray.append(contentsOf: array)
    }
    return newArray
}

/// Concatenate arrays.
///
/// - Parameter arrays: Array of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: [RealDoubleArray]) -> RealDoubleArray {
    var newArray: RealDoubleArray = []
    for array in arrays {
        newArray.append(contentsOf: array)
    }
    return newArray
}

/// Concatenate arrays.
///
/// - Parameter arrays: List of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: ComplexDoubleArray...) -> ComplexDoubleArray {
    var newArray = ComplexDoubleArray(([], []))
    for array in arrays {
        newArray.0.append(contentsOf: array.0)
        newArray.1.append(contentsOf: array.1)
    }
    return newArray
}

/// - Parameter arrays: Array of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: [ComplexDoubleArray]) -> ComplexDoubleArray {
    var newArray = ComplexDoubleArray(([], []))
    for array in arrays {
        newArray.0.append(contentsOf: array.0)
        newArray.1.append(contentsOf: array.1)
    }
    return newArray
}

// MARK: Float

// Concatenate arrays.
///
/// - Parameter arrays: List of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: RealFloatArray...) -> RealFloatArray {
    var newArray: RealFloatArray = []
    for array in arrays {
        newArray.append(contentsOf: array)
    }
    return newArray
}

/// Concatenate arrays.
///
/// - Parameter arrays: Array of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: [RealFloatArray]) -> RealFloatArray {
    var newArray: RealFloatArray = []
    for array in arrays {
        newArray.append(contentsOf: array)
    }
    return newArray
}

/// Concatenate arrays.
///
/// - Parameter arrays: List of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: ComplexFloatArray...) -> ComplexFloatArray {
    var newArray = ComplexFloatArray(([], []))
    for array in arrays {
        newArray.0.append(contentsOf: array.0)
        newArray.1.append(contentsOf: array.1)
    }
    return newArray
}

/// - Parameter arrays: Array of arrays.
/// - Returns: A single combined array.
public func cat(_ arrays: [ComplexFloatArray]) -> ComplexFloatArray {
    var newArray = ComplexFloatArray(([], []))
    for array in arrays {
        newArray.0.append(contentsOf: array.0)
        newArray.1.append(contentsOf: array.1)
    }
    return newArray
}

