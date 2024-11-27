//
//  XCT+Assertions.swift
//  
//
//  Created by Marcus Painter on 29/09/2023.
//

import Foundation
import XCTest
import VecLab

private let epsilon: Real = 1e-6

/*
 func XCTAssertEqual(_ expression1: ComplexArray, _ expression2: ComplexArray, accuracy: Real = epsilon, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) {
     XCTAssertEqual(expression1.0, expression2.0, accuracy: accuracy, "Real part mismatch: \(message())", file: file, line: line)
     XCTAssertEqual(expression1.1, expression2.1, accuracy: accuracy, "Imaginary part mismatch: \(message())", file: file, line: line)
 }

 func XCTAssertEqual(_ expression1: [Real], _ expression2: [Real], accuracy: Real, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) {
     for (index, (value1, value2)) in zip(expression1, expression2).enumerated() {
         if abs(value1 - value2) > accuracy {
             XCTFail("Element \(index) mismatch: \(value1) is not equal to \(value2). \(message())", file: file, line: line)
         }
     }
 }

 func XCTAssertEqual(_ expression1: Complex, _ expression2: Complex, accuracy: Real = epsilon, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) {
     XCTAssertEqual(expression1.0, expression2.0, accuracy: accuracy, "Real part mismatch: \(message())", file: file, line: line)
     XCTAssertEqual(expression1.1, expression2.1, accuracy: accuracy, "Imaginary part mismatch: \(message())", file: file, line: line)
 }
 */

func testAddComplexEquality() {
    let a: Complex = (1.0, 2.0)
    let b: Complex = (1.0, 2.0)
    XCTAssertEqual(a, b, "Complex numbers are not equal!")
}

func XCTAssertEqual(_ expression1: ([Double], [Double]), _ expression2: ([Double], [Double]), accuracy: Double = Double(epsilon), _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) {
    
    XCTAssert(expression1.0.count == expression2.0.count && expression1.1.count == expression2.1.count, "Not same size")
    XCTAssertEqual(expression1.0, expression2.0, accuracy: accuracy, "Real part mismatch: \(message())", file: file, line: line)
    XCTAssertEqual(expression1.1, expression2.1, accuracy: accuracy, "Imaginary part mismatch: \(message())", file: file, line: line)
}

func XCTAssertEqual(_ expression1: [Double], _ expression2: [Double], accuracy: Double, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) {
    if expression1.count != expression2.count {
        XCTFail("Size mismatch: \(expression1.count) is not equal to \(expression2.count). \(message())", file: file, line: line)
    }

    for (index, (value1, value2)) in zip(expression1, expression2).enumerated() {
        if abs(value1 - value2) > accuracy {
            XCTFail("Element \(index) mismatch: \(value1) is not equal to \(value2). \(message())", file: file, line: line)
        }
    }
}

func XCTAssertEqual(_ expression1: (Double, Double), _ expression2: (Double, Double), accuracy: Double = Double(epsilon), _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) {
    XCTAssertEqual(expression1.0, expression2.0, accuracy: accuracy, "Real part mismatch: \(message())", file: file, line: line)
    XCTAssertEqual(expression1.1, expression2.1, accuracy: accuracy, "Imaginary part mismatch: \(message())", file: file, line: line)
}

func XCTAssertEqual(_ expression1: ([Float], [Float]), _ expression2: ([Float], [Float]), accuracy: Float = Float(epsilon), _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) {
    XCTAssertEqual(expression1.0, expression2.0, accuracy: accuracy, "Real part mismatch: \(message())", file: file, line: line)
    XCTAssertEqual(expression1.1, expression2.1, accuracy: accuracy, "Imaginary part mismatch: \(message())", file: file, line: line)
}

func XCTAssertEqual(_ expression1: [Float], _ expression2: [Float], accuracy: Float, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) {
    for (index, (value1, value2)) in zip(expression1, expression2).enumerated() {
        if abs(value1 - value2) > accuracy {
            XCTFail("Element \(index) mismatch: \(value1) is not equal to \(value2). \(message())", file: file, line: line)
        }
    }
}

func XCTAssertEqual(_ expression1: (Float, Float), _ expression2: (Float, Float), accuracy: Float = Float(epsilon), _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) {
    XCTAssertEqual(expression1.0, expression2.0, accuracy: accuracy, "Real part mismatch: \(message())", file: file, line: line)
    XCTAssertEqual(expression1.1, expression2.1, accuracy: accuracy, "Imaginary part mismatch: \(message())", file: file, line: line)
}
