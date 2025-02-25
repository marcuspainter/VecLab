//
//  equalsTests.swift
//  VecLab
//
//  Created by Marcus Painter on 23/02/2025.
//

import Testing
@testable import VecLab

extension LogicalTests {
    
    @Test func testEqualsRealArrayTrue() {
        let a = arange(0.0, 5.0)
        let b = [0.0, 1.0, 2.0, 3.0, 4.0]
        let result = a == b
        let expected = true
        #expect(result == expected)
    }
    
    @Test func testEqualsComplexArrayTrue() {
        let a = arange(0.0, 5.0)
        let b = [0.0, 1.0, 2.0, 3.0, 4.0]
        let result = (a, a) == (b, b)
        let expected = true
        #expect(result == expected)
    }
    
    @Test func testEqualsRealArrayFalse() {
        let a = arange(0.0, 5.0)
        let b = [0.0, 1.0, 2.0, 3.0, 5.0]
        let result = a == b
        let expected = false
        #expect(result == expected)
    }
    
    @Test func testEqualsComplexArrayFalse() {
        let a = arange(0.0, 5.0)
        let b = [0.0, 1.0, 2.0, 3.0, 5.0]
        let result = (a, a) == (b, b)
        let expected = false
        #expect(result == expected)
    }
}
