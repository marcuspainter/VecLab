//
//  AddTestsNew.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import VecLab
import Testing

struct AddTestsNew {
    @Test func testAddReal() {
        let a: RealArray = [1.0, 2.0, 3.0]
        let b: RealArray = [3.0, 2.0, 1.0]
        let result = a + b
        #expect(result == [4.0, 4.0, 4.0], "Real addition failed")
    }

    @Test func testAddRealRealArray() {
        let a: Real = 2.0
        let b: RealArray = [1.0, 2.0, 3.0]
        let result = a + b
        #expect(result == [3.0, 4.0, 5.0], "Real and real array addition failed")
    }

    @Test func testAddComplex() {
        let a: Complex = (1.0, 2.0)
        let b: Complex = (2.0, 3.0)
        let result = a + b
        #expect(result == (3.0, 5.0), "Complex addition failed")
    }

    @Test func testAddComplexReal() {
        let a: Complex = (1.0, 2.0)
        let b: Real = 3.0
        let result = a + b
        #expect(result == (4.0, 2.0), "Complex and real addition failed")
    }

    @Test func testAddRealComplex() {
        let a: Real = 3.0
        let b: Complex = (1.0, 2.0)
        let result = a + b
        #expect(result == (4.0, 2.0), "Complex and real addition failed")
    }

    @Test func testAddComplexArray() {
        let a: ComplexArray = ([1.0, 2.0], [2.0, 3.0])
        let b: ComplexArray = ([2.0, 3.0], [3.0, 4.0])
        let result = a + b
        #expect(result == ([3.0, 5.0], [5.0, 7.0]), "Complex array addition failed")
    }

    @Test func testAddComplexComplexArray() {
        let a: Complex = (1.0, 2.0)
        let b: ComplexArray = ([2.0, 3.0], [3.0, 4.0])
        let result = a + b
        #expect(result == ([3.0, 4.0], [5.0, 6.0]), "Complex and complex array addition failed")
    }

    @Test func testAddComplexArrayComplex() {
        let a: ComplexArray = ([2.0, 3.0], [3.0, 4.0])
        let b: Complex = (1.0, 2.0)
        let result = a + b
        #expect(result == ([3.0, 4.0], [5.0, 6.0]), "Complex and complex array addition failed")
    }

    @Test func testAddRealArrayComplexArray() {
        let a: RealArray = [1.0, 2.0]
        let b: ComplexArray = ([2.0, 3.0], [3.0, 4.0])
        let result = a + b
        #expect(result == ([3.0, 5.0], [3.0, 4.0]), "Real array and complex array addition failed")
    }

    @Test func testAddRealArrayComplex() {
        let a: RealArray = [1.0, 2.0]
        let b: Complex = (2.0, 3.0)
        let result = a + b
        #expect(result == ([3.0, 4.0], [3.0, 3.0]), "Real array and complex number addition failed")
    }

    @Test func testAddComplexArrayReal() {
        let a: ComplexArray = ([1.0, 2.0], [2.0, 3.0])
        let b: Real = 2.0
        let result = a + b
        #expect(result == ([3.0, 4.0], [2.0, 3.0]), "Complex array and real number addition failed")
    }

    @Test func testAddRealComplexArray() {
        let a: Real = 2.0
        let b: ComplexArray = ([1.0, 2.0], [2.0, 3.0])
        let result = a + b
        #expect(result == ([3.0, 4.0], [2.0, 3.0]), "Complex array and real number addition failed")
    }

    @Test func testAddComplexArrayRealArray() {
        let a: ComplexArray = ([1.0, 2.0], [2.0, 3.0])
        let b: RealArray = [2.0, 3.0]
        let result = a + b
        #expect(result == ([3.0, 5.0], [2.0, 3.0]), "Complex array and real array addition failed")
    }

    @Test func testAddComplexRealArray() {
        let a: Complex = (1.0, 2.0)
        let b: RealArray = [1.0, 2.0]
        let result = a + b
        #expect(result == ([2.0, 3.0], [2.0, 2.0]), "Complex number and real array addition failed")
    }
}
