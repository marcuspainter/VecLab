//
//  UPlusTestsNew.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import VecLab
import Testing

struct UPlusTestsNew {

    @Test func testUPlusRealArray() {
        let a: RealArray = [1.0, 2.0, 3.0]
        let result = +a
        #expect(result == [1.0, 2.0, 3.0], "Real array uplus failed")
    }

    @Test func testUPlusComplex() {
        let a: Complex = (1.0, -2.0)
        let result = +a
        #expect(result == (1.0, -2.0), "Complex uplus failed")
    }

    @Test func testUPlusComplexArray() {
        let a: ComplexArray = ([1.0, 2.0, 3.0], [4.0, 5.0, 6.0])
        let result = +a
        #expect(result == ([1.0, 2.0, 3.0], [4.0, 5.0, 6.0]), "Complex array uplus failed")
    }
}
