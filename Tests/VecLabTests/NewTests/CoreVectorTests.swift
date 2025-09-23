//
//  CoreVectorTests.swift
//  VecLab
//
//  Created by Marcus Painter on 23/09/2025.
//

#if canImport(Testing)

import Testing
@testable import VecLab

struct CoreVectorTests {

    // MARK: - Add

    @Test
    func addArrayArray() {
        #expect(CoreArray.add([1, 2, 3], [4, 5, 6]) == [5, 7, 9])
    }

    @Test
    func addArrayScalar() {
        #expect(CoreArray.add([1, 2, 3], 2) == [3, 4, 5])
    }

    @Test
    func addScalarArray() {
        #expect(CoreArray.add(2, [1, 2, 3]) == [3, 4, 5])
    }

    // MARK: - Subtract

    @Test
    func subtractArrayArray() {
        #expect(CoreArray.subtract([5, 7, 9], [1, 2, 3]) == [4, 5, 6])
    }

    @Test
    func subtractArrayScalar() {
        #expect(CoreArray.subtract([5, 7, 9], 1) == [4, 6, 8])
    }

    @Test
    func subtractScalarArray() {
        #expect(CoreArray.subtract(10, [1, 2, 3]) == [9, 8, 7])
    }

    // MARK: - Multiply

    @Test
    func multiplyArrayArray() {
        #expect(CoreArray.multiply([1, 2, 3], [4, 5, 6]) == [4, 10, 18])
    }

    @Test
    func multiplyArrayScalar() {
        #expect(CoreArray.multiply([1, 2, 3], 2) == [2, 4, 6])
    }

    @Test
    func multiplyScalarArray() {
        #expect(CoreArray.multiply(2, [1, 2, 3]) == [2, 4, 6])
    }

    // MARK: - Divide

    @Test
    func divideArrayArray() {
        #expect(CoreArray.divide([4, 10, 18], [2, 5, 3]) == [2, 2, 6])
    }

    @Test
    func divideArrayScalar() {
        #expect(CoreArray.divide([4, 10, 18], 2) == [2, 5, 9])
    }

    @Test
    func divideScalarArray() {
        #expect(CoreArray.divide(18, [2, 3, 6]) == [9, 6, 3])
    }

    // MARK: - Unary Minus

    @Test
    func unaryMinus() {
        #expect(CoreArray.unaryMinus([1, -2, 3]) == [-1, 2, -3])
    }
    
    // MARK: - Edge Cases

    @Test
    func emptyArrays() {
        #expect(CoreArray.add([], []) == [])
        #expect(CoreArray.subtract([], []) == [])
        #expect(CoreArray.multiply([], []) == [])
        #expect(CoreArray.divide([], []) == [])
        #expect(CoreArray.unaryMinus([]) == [])
    }

    @Test
    func divideByZeroScalar() {
        let result = CoreArray.divide([1, -2, 0], 0.0)
        #expect(result[0].isInfinite && result[0] > 0)   // +∞
        #expect(result[1].isInfinite && result[1] < 0)   // -∞
        #expect(result[2].isNaN)                         // 0 / 0 = NaN
    }

    @Test
    func divideByZeroArray() {
        let result = CoreArray.divide([1, -2, 0], [0, 0, 0])
        #expect(result[0].isInfinite && result[0] > 0)   // +∞
        #expect(result[1].isInfinite && result[1] < 0)   // -∞
        #expect(result[2].isNaN)                         // 0 / 0 = NaN
    }

    @Test
    func specialFloatingPointValues() {
        let nan = Double.nan
        let inf = Double.infinity
        let ninf = -Double.infinity

        // Add
        #expect(CoreArray.add([nan, inf, ninf], [1, 1, 1])[0].isNaN)
        #expect(CoreArray.add([nan, inf, ninf], [1, 1, 1])[1].isInfinite)
        #expect(CoreArray.add([nan, inf, ninf], [1, 1, 1])[2].isInfinite)

        // Multiply
        #expect(CoreArray.multiply([nan, inf, ninf], [2, 2, 2])[0].isNaN)
        #expect(CoreArray.multiply([nan, inf, ninf], [2, 2, 2])[1].isInfinite)
        #expect(CoreArray.multiply([nan, inf, ninf], [2, 2, 2])[2].isInfinite)
    }
}

#endif
