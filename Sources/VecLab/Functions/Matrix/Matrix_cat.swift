//
//  Matrix_cat.swift
//  VecLab
//
//  Created by Marcus Painter on 21/09/2025.
//

// Horizontal concatenation: [A | B | C ...]
public func hcat(_ matrices: Matrix...) -> Matrix {
    precondition(!matrices.isEmpty, "hcat requires at least one matrix")
    if matrices.count == 1 { return matrices[0] }

    // All matrices must have same number of rows
    let r = matrices[0].rows
    precondition(matrices.allSatisfy { $0.rows == r }, "All matrices must have the same number of rows for hcat")

    let totalCols = matrices.reduce(0) { $0 + $1.cols }
    var result = Matrix(r, totalCols)

    // Column-major layout: copy whole column blocks
    var colOffset = 0
    for m in matrices {
        let srcCols = m.cols
        let srcRows = m.rows
        m.data.withUnsafeBufferPointer { srcPtr in
            result.data.withUnsafeMutableBufferPointer { dstPtr in
                for c in 0..<srcCols {
                    let srcStart = c * srcRows
                    let dstStart = (colOffset + c) * r
                    dstPtr.baseAddress!.advanced(by: dstStart)
                        .update(from: srcPtr.baseAddress!.advanced(by: srcStart), count: r)
                }
            }
        }
        colOffset += srcCols
    }

    return result
}

// Vertical concatenation:
// [A
//  B
//  C
//  ...]
public func vcat(_ matrices: Matrix...) -> Matrix {
    precondition(!matrices.isEmpty, "vcat requires at least one matrix")
    if matrices.count == 1 { return matrices[0] }

    // All matrices must have same number of columns
    let c = matrices[0].cols
    precondition(matrices.allSatisfy { $0.cols == c }, "All matrices must have the same number of columns for vcat")

    let totalRows = matrices.reduce(0) { $0 + $1.rows }
    var result = Matrix(totalRows, c)

    // Column-major storage: each column is contiguous. Append row blocks per column.
    var rowOffset = 0
    for m in matrices {
        let srcRows = m.rows
        m.data.withUnsafeBufferPointer { srcPtr in
            result.data.withUnsafeMutableBufferPointer { dstPtr in
                for col in 0..<c {
                    let srcStart = col * srcRows
                    let dstStart = col * totalRows + rowOffset
                    dstPtr.baseAddress!.advanced(by: dstStart)
                        .update(from: srcPtr.baseAddress!.advanced(by: srcStart), count: srcRows)
                }
            }
        }
        rowOffset += srcRows
    }

    return result
}
