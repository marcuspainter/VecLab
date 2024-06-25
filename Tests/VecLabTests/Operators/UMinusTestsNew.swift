//
//  UMinusTestsNew.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import VecLab
import Testing

struct UMinusTestsNew {

    @Test func testUMinusRealArray() {
        let a: RealArray = [1.0, 2.0, 3.0]
        let result = -a
        #expect(result == [-1.0, -2.0, -3.0], "Real array uminus failed")
    }

    @Test func testUMinusComplex() {
        let a: Complex = (1.0, -2.0)
        let result = -a
        #expect(result == (-1.0, 2.0), "Complex uminus failed")
    }

    @Test func testUMinusComplexArray() {
        let a: ComplexArray = ([1.0, 2.0, 3.0], [4.0, 5.0, 6.0])
        let result = -a
        #expect(result == ([-1.0, -2.0, -3.0], [-4.0, -5.0, -6.0]), "Complex array uminus failed")
    }
}
