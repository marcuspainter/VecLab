//
//  Matrix_flip.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

public func fliplr(_ x: Matrix) -> Matrix {
    // Flip left-right: reverse the order of columns in each row (column-major storage)
    let rows = x.rows
    let cols = x.cols
    precondition(rows >= 0 && cols >= 0, "Matrix has invalid dimensions")
    if rows == 0 || cols == 0 { return x }

    let count = rows * cols
    precondition(x.data.count == count, "Matrix data size mismatch")

    var newData = x.data // will be overwritten fully
    for c in 0..<cols {
        let dstCol = cols - 1 - c
        // copy entire column c to dstCol
        for r in 0..<rows {
            let srcIndex = r + c * rows
            let dstIndex = r + dstCol * rows
            newData[dstIndex] = x.data[srcIndex]
        }
    }
    return Matrix(rows: rows, cols: cols, data: newData)
}

public func flipud(_ x: Matrix) -> Matrix {
    // Flip up-down: reverse the order of rows (column-major storage)
    let rows = x.rows
    let cols = x.cols
    precondition(rows >= 0 && cols >= 0, "Matrix has invalid dimensions")
    if rows == 0 || cols == 0 { return x }

    let count = rows * cols
    precondition(x.data.count == count, "Matrix data size mismatch")

    var newData = x.data // will be overwritten fully
    for c in 0..<cols {
        for r in 0..<rows {
            let dstRow = rows - 1 - r
            let srcIndex = r + c * rows
            let dstIndex = dstRow + c * rows
            newData[dstIndex] = x.data[srcIndex]
        }
    }
    return Matrix(rows: rows, cols: cols, data: newData)
}

public func fliplr(_ x: ComplexMatrix) -> ComplexMatrix {
    // Flip left-right: reverse the order of columns in each row (column-major storage)
    let rows = x.rows
    let cols = x.cols
    precondition(rows >= 0 && cols >= 0, "Matrix has invalid dimensions")
    if rows == 0 || cols == 0 { return x }

    let count = rows * cols
    precondition(x.data.count == count, "Matrix data size mismatch")

    var newData = x.data // will be overwritten fully
    for c in 0..<cols {
        let dstCol = cols - 1 - c
        // copy entire column c to dstCol
        for r in 0..<rows {
            let srcIndex = r + c * rows
            let dstIndex = r + dstCol * rows
            newData[dstIndex] = x.data[srcIndex]
        }
    }
    return ComplexMatrix(rows: rows, cols: cols, data: newData)
}

public func flipud(_ x: ComplexMatrix) -> ComplexMatrix {
    // Flip up-down: reverse the order of rows (column-major storage)
    let rows = x.rows
    let cols = x.cols
    precondition(rows >= 0 && cols >= 0, "Matrix has invalid dimensions")
    if rows == 0 || cols == 0 { return x }

    let count = rows * cols
    precondition(x.data.count == count, "Matrix data size mismatch")

    var newData = x.data // will be overwritten fully
    for c in 0..<cols {
        for r in 0..<rows {
            let dstRow = rows - 1 - r
            let srcIndex = r + c * rows
            let dstIndex = dstRow + c * rows
            newData[dstIndex] = x.data[srcIndex]
        }
    }
    return ComplexMatrix(rows: rows, cols: cols, data: newData)
}
