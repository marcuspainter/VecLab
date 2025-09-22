//
//  MatrixAssertions.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

import Foundation

public func validateSize( _ a: Matrix, _ b: Matrix,
    file: StaticString = #file,
    line: UInt = #line
) {
    assert(
        a.rows == b.rows && a.cols == b.cols,
        "Incompatible sizes \(a.rows)x\(a.cols) != \(b.rows)x\(b.cols)",
        file: file,
        line: line
    )
    assert(
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
    assert(
        a.cols == b.rows,
        "Incompatible sizes \(a.rows)x\(a.cols) != \(b.rows)x\(b.cols)",
        file: file,
        line: line
    )
    assert(
        a.rows != 0 && a.cols != 0 && b.rows != 0 && b.cols != 0,
        "Cannot be zero size \(a.rows)x\(a.cols) != \(b.rows)x\(b.cols)",
        file: file,
        line: line
    )
}
