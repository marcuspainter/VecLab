//
//  MatrixAssertions.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

import Foundation

func validateSize( _ a: Matrix, _ b: Matrix,
    file: StaticString = #file,
    line: UInt = #line
) {
    precondition(
        a.rows == b.rows && a.cols == b.cols,
        "Incompatible sizes \(a.rows)x\(a.cols) != \(b.rows)x\(b.cols)",
        file: file,
        line: line
    )
    precondition(
        a.rows != 0 && a.cols != 0 && b.rows != 0 && b.cols != 0,
        "Cannot be zero size \(a.rows)x\(a.cols) != \(b.rows)x\(b.cols)",
        file: file,
        line: line
    )
}

func validateCompatible(_ a: Matrix, _ b: Matrix,
    file: StaticString = #file,
    line: UInt = #line
) {
    
    precondition(a.cols == b.rows, "Inner dimensions must match: a.cols == b.rows")
    precondition(
        a.cols == b.rows,
        "Incompatible sizes \(a.rows)x\(a.cols) and \(b.rows)x\(b.cols)",
        file: file,
        line: line
    )
    precondition(
        a.rows != 0 && a.cols != 0 && b.rows != 0 && b.cols != 0,
        "Cannot be zero size \(a.rows)x\(a.cols) != \(b.rows)x\(b.cols)",
        file: file,
        line: line
    )
}
