//
//  Global+Assertions.swift
//
//  Created by Marcus Painter on 06/09/2023.
//

import Foundation

func assertSameSize(_ a: RealDoubleArray, _ b: RealDoubleArray,
                    file: StaticString = #file, line: UInt = #line) {
    assert(a.count == b.count,
           "Incompatible sizes \(a.count) \(b.count)", file: file, line: line)
}

func assertSameSize(_ a: RealDoubleArray, _ b: ComplexDoubleArray,
                    file: StaticString = #file, line: UInt = #line) {
    assert(a.count == b.0.count && a.count == b.1.count,
           "Incompatible sizes \(a.count) (\(b.0.count),\(b.1.count))", file: file, line: line)
}

func assertSameSize(_ a: ComplexDoubleArray, _ b: RealDoubleArray,
                    file: StaticString = #file, line: UInt = #line) {
    assert(a.0.count == b.count && a.1.count == b.count,
           "Incompatible sizes (\(a.0.count),\(a.1.count)) \(b.count)", file: file, line: line)
}

func assertSameSize(_ a: ComplexDoubleArray, _ b: ComplexDoubleArray,
                    file: StaticString = #file, line: UInt = #line) {
    assert(a.0.count == b.0.count && a.1.count == b.1.count,
           "Incompatible sizes (\(a.0.count) \(a.1.count))  (\(b.0.count) \(b.1.count)) ", file: file, line: line)
}

// MARK: Float

func assertSameSize(_ a: RealFloatArray, _ b: RealFloatArray,
                    file: StaticString = #file, line: UInt = #line) {
    assert(a.count == b.count,
           "Incompatible sizes \(a.count) \(b.count)", file: file, line: line)
}

func assertSameSize(_ a: RealFloatArray, _ b: ComplexFloatArray,
                    file: StaticString = #file, line: UInt = #line) {
    assert(a.count == b.0.count && a.count == b.1.count,
           "Incompatible sizes \(a.count) (\(b.0.count),\(b.1.count))", file: file, line: line)
}

func assertSameSize(_ a: ComplexFloatArray, _ b: RealFloatArray,
                    file: StaticString = #file, line: UInt = #line) {
    assert(a.0.count == b.count && a.1.count == b.count,
           "Incompatible sizes (\(a.0.count),\(a.1.count)) \(b.count)", file: file, line: line)
}

func assertSameSize(_ a: ComplexFloatArray, _ b: ComplexFloatArray,
                    file: StaticString = #file, line: UInt = #line) {
    assert(a.0.count == b.0.count && a.1.count == b.1.count,
           "Incompatible sizes (\(a.0.count) \(a.1.count))  (\(b.0.count) \(b.1.count)) ", file: file, line: line)
}
