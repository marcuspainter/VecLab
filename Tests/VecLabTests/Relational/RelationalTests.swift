//
//  AddTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import VecLab
import XCTest

class RelationTests: XCTestCase {
    // Test real number equals
    func testEqualsRealArrayTrue() {
        let a: RealArray = [1.0, 2.0, 3.0]
        let b: RealArray = [1.0, 2.0, 3.0]
        let result = a == b
        XCTAssertEqual(result, true, "Real array equals failed")
    }

    func testEqualsRealArrayFalse() {
        let a: RealArray = [1.0, 2.0, 3.0]
        let b: RealArray = [0.0, 2.0, 3.0]
        let result = a == b
        XCTAssertEqual(result, false, "Real array equals failed")
    }
    
    func testEqualsComplexArrayTrue() {
        let a: ComplexArray = ([1.0, 2.0, 3.0], [1.0, 2.0, 3.0])
        let b: ComplexArray = ([1.0, 2.0, 3.0], [1.0, 2.0, 3.0])
        let result = a == b
        XCTAssertEqual(result, true, "Complex array equals failed")
    }

    func testEqualsComplexArrayFalse() {
        let a: ComplexArray = ([1.0, 2.0, 3.0], [1.0, 2.0, 3.0])
        let b: ComplexArray = ([0.0, 2.0, 3.0], [1.0, 2.0, 3.0])
        let result = a == b
        XCTAssertEqual(result, false, "Complex array equals failed")
    }
    
    // MARK: Builtin Swift
    
    func testEqualsComplexTrue() {
        let a: Complex = (1.0, 2.0)
        let b: Complex = (1.0, 2.0)
        let result = a == b
        XCTAssertEqual(result, true, "Complex equals failed")
    }
    
    func testEqualsComplexFalse() {
        let a: Complex = (1.0, 2.0)
        let b: Complex = (0.0, 2.0)
        let result = a == b
        XCTAssertEqual(result, false, "Complex equals failed")
    }

}

