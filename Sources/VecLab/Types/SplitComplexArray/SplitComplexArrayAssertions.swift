//
//  SplitComplexArrayAssertions.swift
//
//  Created by Marcus Painter on 06/09/2023.
//

import Foundation

public func validateSize(
    _ a: RealArray,
    _ b: SplitComplexArray,
    file: StaticString = #file,
    line: UInt = #line
) {
    assert(
        a.count == b.real.count && a.count == b.imag.count && b.real.count == b.imag.count,
        "Incompatible sizes \(a.count) (\(b.real.count),\(b.imag.count))",
        file: file,
        line: line
    )
}

public func validateSize(
    _ a: SplitComplexArray,
    _ b: RealArray,
    file: StaticString = #file,
    line: UInt = #line
) {
    assert(
        a.real.count == b.count && a.imag.count == b.count && a.real.count == a.imag.count,
        "Incompatible sizes (\(a.real.count),\(a.imag.count)) \(b.count)",
        file: file,
        line: line
    )
}

public func validateSize(
    _ a: SplitComplexArray,
    _ b: SplitComplexArray,
    file: StaticString = #file,
    line: UInt = #line
) {
    assert(
        a.real.count == b.imag.count && a.imag.count == b.imag.count && a.real.count == a.imag.count
            && b.real.count == b.imag.count,
        "Incompatible sizes (\(a.real.count) \(a.imag.count))  (\(b.real.count) \(b.imag.count)) ",
        file: file,
        line: line
    )
}

public func validateSize(
    _ a: SplitComplexArray,
    file: StaticString = #file,
    line: UInt = #line
) {
    assert(
        a.real.count == a.imag.count,
        "Incompatible sizes (\(a.real.count) \(a.imag.count))",
        file: file,
        line: line
    )
}
