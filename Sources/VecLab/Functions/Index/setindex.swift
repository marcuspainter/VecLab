//
//  setindex.swift
//  VecLab
//
//  Created by Marcus Painter on 09/03/2025.
//

/// Set all array elements to a real scalar.
///- Parameters:
///   - x: Real array.
///   - value: Real scalar.
/// - Returns: Modified array.
public func setindex(_ x: RealArray, value: Real) -> RealArray {
    return [Real](repeating: value, count: x.count)
}

/// Set all array elements to a complex scalar.
/// - Parameters:
///   - x: Complex array.
///   - value: Complex scalar.
/// - Returns: Modified array.
public func setindex(_ x: ComplexArray, value: Complex) -> ComplexArray {
    let real = [Real](repeating: value.0, count: x.0.count)
    let imag = [Real](repeating: value.1, count: x.1.count)
    return (real, imag)
}

// MARK:

/// Set array element to a complex scalar.
/// - Parameters:
///   - x: Real array.
///   - index: Integer index.
///   - value: Real scalar.
/// - Returns: Modified array.
public func setindex(_ x: RealArray, index: Int, value: Real) -> RealArray {
    var result = x
    result[index] = value
    return result
}

/// Set array element to a complex scalar.
/// - Parameters:
///   - x: Complex array.
///   - index: Integer index.
///   - value: Complex scalar.
/// - Returns: Modified array.
public func setindex(_ x: ComplexArray, index: Int, value: Complex) -> ComplexArray {
    var result = x
    result.0[index] = value.0
    result.1[index] = value.1
    return result
}

// MARK:

/// Set array element to a real scalar.
/// - Parameters:
///   - x: Real array.
///   - index: Real index.
///   - value: Real scalar.
/// - Returns: Modified array.
public func setindex(_ x: RealArray, index: Real, value: Real) -> RealArray {
    var result = x
    let targetIndex = Int(index)
    result[targetIndex] = value
    return result
}

/// Set array element to a real scalar.
/// - Parameters:
///   - x: Complex array.
///   - index: Real index.
///   - value: Complex scalar.
/// - Returns: Modified array.
public func setindex(_ x: ComplexArray, index: Real, value: Complex) -> ComplexArray {
    var result = x
    let targetIndex = Int(index)
    result.0[targetIndex] = value.0
    result.1[targetIndex] = value.1
    return result
}

// MARK:

/// Set array elements by indices to a scalar.
/// - Parameters:
///   - x: Real array.
///   - indices: Integer indices.
///   - value: Real scalar.
/// - Returns: Modified array.
public func setindex(_ x: RealArray, indices: [Int], value: Real) -> RealArray {
    var result = x
    for index in indices {
        // Using 0-based indexing
        result[index] = value
    }
    return result
}

/// Set array elements by indices to a scalar.
/// - Parameters:
///   - x: Complex array.
///   - indices: Integer indices.
///   - value: Complex scalar.
/// - Returns: Modified array.
public func setindex(_ x: ComplexArray, indices: [Int], value: Complex) -> ComplexArray {
    var result = x
    for index in indices {
        // Using 0-based indexing
        result.0[index] = value.0
        result.1[index] = value.1
    }
    return result
}

/// Set array elements by indices to a scalar.
/// - Parameters:
///   - x: Complex array.
///   - indices: Array of real indices.
///   - value: Complex scalar.
/// - Returns: Modified array.
public func setindex(_ x: ComplexArray, indices: RealArray, value: Complex) -> ComplexArray {
    var result = x
    for index in indices {
        // Using 0-based indexing
        let targetIndex = Int(index)
        result.0[targetIndex] = value.0
        result.1[targetIndex] = value.1
    }
    return result
}

// MARK:

/// Set array elements by indices to an array.
/// - Parameters:
///   - x: Real array.
///   - indices: Array of integer indices.
///   - values: Array of values.
/// - Returns: Modified array.
public func setindex(_ x: RealArray, indices: [Int], values: RealArray) -> RealArray {
    guard indices.count == values.count else {
        fatalError("Number of indices must match number of values")
    }

    var result = x
    for i in 0 ..< indices.count {
        result[indices[i]] = values[i]
    }
    return result
}

/// Set array elements by indices to an array.
/// - Parameters:
///   - x: Complex array.
///   - indices: Array of integer indices.
///   - values: Array of complex values.
/// - Returns: Modified array.
public func setindex(_ x: ComplexArray, indices: [Int], values: ComplexArray) -> ComplexArray {
    guard indices.count == values.0.count else {
        fatalError("Number of indices must match number of values")
    }

    var result = x
    for i in 0 ..< indices.count {
        result.0[indices[i]] = values.0[i]
        result.1[indices[i]] = values.1[i]
    }
    return result
}

// MARK:

/// Set array elements by indices to an array.
/// - Parameters:
///   - x: Real array.
///   - indices: Array of real indices.
///   - values: Array of real values.
/// - Returns: Modified array.
public func setindex(_ x: RealArray, indices: RealArray, values: RealArray) -> RealArray {
    guard indices.count == values.count else {
        fatalError("Number of indices must match number of values")
    }

    var result = x
    for i in 0 ..< indices.count {
        result[Int(indices[i])] = values[i]
    }
    return result
}

/// Set array elements by indices to an array.
/// - Parameters:
///   - x: Complex array.
///   - indices: Array of real indices.
///   - values: Array of complex values.
/// - Returns: Modified array.
public func setindex(_ x: ComplexArray, indices: RealArray, values: ComplexArray) -> ComplexArray {
    guard indices.count == values.0.count else {
        fatalError("Number of indices must match number of values")
    }

    var result = x
    for i in 0 ..< indices.count {
        let targetIndex = Int(indices[i])
        result.0[targetIndex] = values.0[i]
        result.1[targetIndex] = values.1[i]
    }
    return result
}

// MARK:

/// Set array elements by indices to a array by indices.
/// - Parameters:
///   - x: Real array.
///   - indices: Target indices.
///   - values: Source array of values.
///   - valueIndices: Source indices.
/// - Returns: Modified array.
public func setindex(_ x: RealArray, indices: [Int], values: RealArray, valueIndices: [Int]) -> RealArray {
    guard indices.count == valueIndices.count else {
        fatalError("Number of target indices must match number of source indices")
    }

    var result = x
    for i in 0 ..< indices.count {
        let sourceIndex = valueIndices[i]
        result[indices[i]] = values[sourceIndex]
    }
    return result
}

/// Set array elements by indices to a array by indices.
/// - Parameters:
///   - x: Complex array.
///   - indices: Target indices.
///   - values: Source array of values.
///   - valueIndices: Source indicies.
/// - Returns: Modified array.
public func setindex(_ x: ComplexArray, indices: [Int], values: ComplexArray, valueIndices: [Int]) -> ComplexArray {
    guard indices.count == valueIndices.count else {
        fatalError("Number of target indices must match number of source indices")
    }

    var result = x
    for i in 0 ..< indices.count {
        let sourceIndex = valueIndices[i]
        result.0[indices[i]] = values.0[sourceIndex]
        result.1[indices[i]] = values.1[sourceIndex]
    }
    return result
}

// MARK:

/// Set array elements by indices to a array by indices.
/// - Parameters:
///   - x: Real array.
///   - indices: Target indices.
///   - values: Source array of real values.
///   - valueIndices: Source indicies.
/// - Returns: Modified array.
public func setindex(_ x: RealArray, indices: RealArray, values: RealArray, valueIndices: RealArray) -> RealArray {
    guard indices.count == valueIndices.count else {
        fatalError("Number of target indices must match number of source indices")
    }

    var result = x
    for i in 0 ..< indices.count {
        let sourceIndex = Int(valueIndices[i])
        let targetIndex = Int(indices[i])
        result[targetIndex] = values[sourceIndex]
    }
    return result
}

/// Set array elements by indices to a array by indices.
/// - Parameters:
///   - x: Complex array.
///   - indices: Target indices.
///   - values: Source array of values.
///   - valueIndices: Source indicies.
/// - Returns: Modified array.
public func setindex(_ x: ComplexArray, indices: RealArray, values: ComplexArray, valueIndices: RealArray) -> ComplexArray {
    guard indices.count == valueIndices.count else {
        fatalError("Number of target indices must match number of source indices")
    }

    var result = x
    for i in 0 ..< indices.count {
        let sourceIndex = Int(valueIndices[i])
        let targetIndex = Int(indices[i])
        result.0[targetIndex] = values.0[sourceIndex]
        result.1[targetIndex] = values.1[sourceIndex]
    }
    return result
}
