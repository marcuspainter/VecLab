//
//  Global+Assertions.swift
//
//  Created by Marcus Painter on 06/09/2023.
//

import Foundation

func validateSize(_ a: RealArray, _ b: RealArray,
                    file: StaticString = #file, line: UInt = #line) {
    assert(a.count == b.count,
           "Incompatible sizes \(a.count) \(b.count)", file: file, line: line)
}

func validateSize(_ a: RealArray, _ b: ComplexArray,
                    file: StaticString = #file, line: UInt = #line) {
    assert(a.count == b.real.count && a.count == b.imag.count && b.real.count == b.imag.count,
           "Incompatible sizes \(a.count) (\(b.real.count),\(b.imag.count))", file: file, line: line)
}

func validateSize(_ a: ComplexArray, _ b: RealArray,
                    file: StaticString = #file, line: UInt = #line) {
    assert(a.real.count == b.count && a.imag.count == b.count && a.real.count == a.imag.count,
           "Incompatible sizes (\(a.real.count),\(a.imag.count)) \(b.count)", file: file, line: line)
}

func validateSize(_ a: ComplexArray, _ b: ComplexArray,
                    file: StaticString = #file, line: UInt = #line) {
    assert(a.real.count == b.imag.count && a.imag.count == b.imag.count && a.real.count == a.imag.count && b.real.count == b.imag.count,
           "Incompatible sizes (\(a.real.count) \(a.imag.count))  (\(b.real.count) \(b.imag.count)) ", file: file, line: line)
}

func validateSize(_ a: ComplexArray,
                    file: StaticString = #file, line: UInt = #line) {
    assert(a.real.count == a.imag.count,
           "Incompatible sizes (\(a.real.count) \(a.imag.count))", file: file, line: line)
}
