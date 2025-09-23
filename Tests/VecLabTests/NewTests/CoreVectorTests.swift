//
//  CoreVectorTests.swift
//  VecLab
//
//  Created by Marcus Painter on 23/09/2025.
//


//
//  CoreVectorTests.swift
//  VecLabTests
//
//  Created by ChatGPT on 23/09/2025.
//

import Testing
@testable import VecLab

struct CoreVectorTests {

    // MARK: - Add

    @Test
    func addArrayArray() {
        #expect(CoreVector.add([1, 2, 3], [4, 5, 6]) == [5, 7, 9])
    }

    @Test
    func addArrayScalar() {
        #expect(CoreVector.add([1, 2, 3], 2) == [3, 4, 5])
    }

    @Test
    func addScalarArray() {
        #expect(CoreVector.add(2, [1, 2, 3]) == [3, 4, 5])
    }

    // MARK: - Subtract

    @Test
    func subtractArrayArray() {
        #expect(CoreVector.subtract([5, 7, 9], [1, 2, 3]) == [4, 5, 6])
    }

    @Test
    func subtractArrayScalar() {
        #expect(CoreVector.subtract([5, 7, 9], 1) == [4, 6, 8])
    }

    @Test
    func subtractScalarArray() {
        #expect(CoreVector.subtract(10, [1, 2, 3]) == [9, 8, 7])
    }

    // MARK: - Multiply

    @Test
    func multiplyArrayArray() {
        #expect(CoreVector.multiply([1, 2, 3], [4, 5, 6]) == [4, 10, 18])
    }

    @Test
    func multiplyArrayScalar() {
        #expect(CoreVector.multiply([1, 2, 3], 2) == [2, 4, 6])
    }

    @Test
    func multiplyScalarArray() {
        #expect(CoreVector.multiply(2, [1, 2, 3]) == [2, 4, 6])
    }

    // MARK: - Divide

    @Test
    func divideArrayArray() {
        #expect(CoreVector.divide([4, 10, 18], [2, 5, 3]) == [2, 2, 6])
    }

    @Test
    func divideArrayScalar() {
        #expect(CoreVector.divide([4, 10, 18], 2) == [2, 5, 9])
    }

    @Test
    func divideScalarArray() {
        #expect(CoreVector.divide(18, [2, 3, 6]) == [9, 6, 3])
    }

    // MARK: - Unary Minus

    @Test
    func unaryMinus() {
        #expect(CoreVector.unaryMinus([1, -2, 3]) == [-1, 2, -3])
    }

    // MARK: - Precondition Failures
    
/*
    @Test
    func addMismatchedLengthsPrecondition() {
        #expect(throws: .preconditionFailure, of: Never.self) {
            _ = CoreVector.add([1, 2], [1])
        }
    }

    @Test
    func subtractMismatchedLengthsPrecondition() {
        #expect(throws: .preconditionFailure, of: Never.self) {
            _ = CoreVector.subtract([1, 2], [1])
        }
    }

    @Test
    func divideMismatchedLengthsPrecondition() {
        #expect(throws: .preconditionFailure, of: Never.self) {
            _ = CoreVector.divide([1, 2], [1])
        }
    }
*/
    // MARK: - Edge Cases

    @Test
    func emptyArrays() {
        #expect(CoreVector.add([], []) == [])
        #expect(CoreVector.subtract([], []) == [])
        #expect(CoreVector.multiply([], []) == [])
        #expect(CoreVector.divide([], []) == [])
        #expect(CoreVector.unaryMinus([]) == [])
    }

    @Test
    func divideByZeroScalar() {
        let result = CoreVector.divide([1, -2, 0], 0.0)
        #expect(result[0].isInfinite && result[0] > 0)   // +∞
        #expect(result[1].isInfinite && result[1] < 0)   // -∞
        #expect(result[2].isNaN)                         // 0 / 0 = NaN
    }

    @Test
    func divideByZeroArray() {
        let result = CoreVector.divide([1, -2, 0], [0, 0, 0])
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
        #expect(CoreVector.add([nan, inf, ninf], [1, 1, 1])[0].isNaN)
        #expect(CoreVector.add([nan, inf, ninf], [1, 1, 1])[1].isInfinite)
        #expect(CoreVector.add([nan, inf, ninf], [1, 1, 1])[2].isInfinite)

        // Multiply
        #expect(CoreVector.multiply([nan, inf, ninf], [2, 2, 2])[0].isNaN)
        #expect(CoreVector.multiply([nan, inf, ninf], [2, 2, 2])[1].isInfinite)
        #expect(CoreVector.multiply([nan, inf, ninf], [2, 2, 2])[2].isInfinite)
    }
}
