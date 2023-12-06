//
//  TestHelp[er.swift
//  
//
//  Created by Marcus Painter on 08/09/2023.
//

import Foundation
import XCTest
import VecLab

public func assertComplexEqual(_ result: Complex, _ expected: Complex, _ message: String) {
    XCTAssertEqual(result.0, expected.0, "\(message) - Real part not equal.")
    XCTAssertEqual(result.1, expected.1, "\(message) - Imaginary part not equal.")
}

// Example Usage:
// assertComplexEqual(diffMN, (-4.0, -5.0), "Failed real-complex subtraction test")

// Helper Function to Compare Complex Numbers
public func assertComplexAlmostEqual(_ result: Complex, _ expected: Complex, _ message: String, accuracy: Real = 1e-6) {
    XCTAssert(abs(result.0 - expected.0) < accuracy, "\(message) - Real part not close enough.")
    XCTAssert(abs(result.1 - expected.1) < accuracy, "\(message) - Imaginary part not close enough.")
}

// Helper Function to Compare RealArrays
public func assertRealArrayAlmostEqual(_ result: RealArray, _ expected: RealArray, _ message: String, accuracy: Real = 1e-6) {
    XCTAssertEqual(result.count, expected.count, "Array lengths not equal")
    for (r, e) in zip(result, expected) {
        XCTAssert(abs(r - e) < accuracy, "\(message) - Value \(r) not close enough to \(e).")
    }
}
