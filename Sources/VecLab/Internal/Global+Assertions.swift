//
//  Global+Assertions.swift
//
//  Created by Marcus Painter on 06/09/2023.
//

import Foundation

func assertSameSize(_ a: RealArray, _ b: RealArray,
                    file: StaticString = #file, line: UInt = #line) {
    assert(a.count == b.count,
           "Incompatible sizes \(a.count) \(b.count)", file: file, line: line)
}

func assertSameSize(_ a: RealArray, _ b: ComplexArray,
                    file: StaticString = #file, line: UInt = #line) {
    assert(a.count == b.0.count && a.count == b.1.count,
           "Incompatible sizes \(a.count) (\(b.0.count),\(b.1.count))", file: file, line: line)
}

func assertSameSize(_ a: ComplexArray, _ b: RealArray,
                    file: StaticString = #file, line: UInt = #line) {
    assert(a.0.count == b.count && a.1.count == b.count,
           "Incompatible sizes (\(a.0.count),\(a.1.count)) \(b.count)", file: file, line: line)
}

func assertSameSize(_ a: ComplexArray, _ b: ComplexArray,
                    file: StaticString = #file, line: UInt = #line) {
    assert(a.0.count == b.0.count && a.1.count == b.1.count,
           "Incompatible sizes (\(a.0.count) \(a.1.count))  (\(b.0.count) \(b.1.count)) ", file: file, line: line)
}
