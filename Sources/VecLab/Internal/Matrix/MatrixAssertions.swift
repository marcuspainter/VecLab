//
//  MatrixAssertions.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

import Foundation

public func validateSize(
    _ a: Matrix,
    _ b: Matrix,
    file: StaticString = #file,
    line: UInt = #line
) {
    assert(
        a.rows == b.rows && a.cols == b.cols,
        "Incompatible sizes \(a.rows)x\(a.cols) != \(b.rows)x\(b.cols)",
        file: file,
        line: line
    )
}

public func validateSize(
    _ a: MatrixComplex,
    _ b: MatrixComplex,
    file: StaticString = #file,
    line: UInt = #line
) {
    assert(
        a.rows == b.rows && a.cols == b.cols,
        "Incompatible sizes \(a.rows)x\(a.cols) != \(b.rows)x\(b.cols)",
        file: file,
        line: line
    )
}

public func validateSize(
    _ a: MatrixComplex,
    _ b: Matrix,
    file: StaticString = #file,
    line: UInt = #line
) {
    assert(
        a.rows == b.rows && a.cols == b.cols,
        "Incompatible sizes \(a.rows)x\(a.cols) != \(b.rows)x\(b.cols)",
        file: file,
        line: line
    )
}

public func validateSize(
    _ a: Matrix,
    _ b: MatrixComplex,
    file: StaticString = #file,
    line: UInt = #line
) {
    assert(
        a.rows == b.rows && a.cols == b.cols,
        "Incompatible sizes \(a.rows)x\(a.cols) != \(b.rows)x\(b.cols)",
        file: file,
        line: line
    )
}

func validateCompatible(
    _ a: Matrix,
    _ b: Matrix,
    file: StaticString = #file,
    line: UInt = #line
) {
    assert(
        a.cols == b.rows,
        "Incompatible sizes \(a.rows)x\(a.cols) != \(b.rows)x\(b.cols)",
        file: file,
        line: line
    )
}

func validateCompatible(
    _ a: MatrixComplex,
    _ b: MatrixComplex,
    file: StaticString = #file,
    line: UInt = #line
) {
    assert(
        a.cols == b.rows,
        "Incompatible sizes \(a.rows)x\(a.cols) != \(b.rows)x\(b.cols)",
        file: file,
        line: line
    )
}
