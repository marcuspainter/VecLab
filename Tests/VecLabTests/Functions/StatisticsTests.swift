//
//  StatisticTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import XCTest
import VecLab

class StatisticsTests: XCTestCase {

    let accuracy: Real = 1e-6

    // MARK: histcounts

    // TODO: Does not match Matlab

    func testHistcountsRealArrayAuto() throws {
        let realArrayA: RealArray = [1.0, 1.0, 1.0, 2.0, 2.0, 3.0, 4.0]
        let (counts, edges) = histcounts(realArrayA)
        let expectedCounts: [Int] = [7]
        let expectedEdges: RealArray = [1.0, 4.0]
        XCTAssertEqual(counts, expectedCounts, "max failed")
        XCTAssertEqual(edges, expectedEdges, "max failed")
    }

    func testHistcountsRealArrayBins() throws {
        let realArrayA: RealArray = [1.0, 1.0, 1.0, 2.0, 2.0, 3.0, 4.0]
        let bins = 4
        let (counts, edges) = histcounts(realArrayA, bins: bins)
        let expectedCounts: [Int] = [3, 2, 1, 1]
        let expectedEdges: RealArray = [1.0, 1.75, 2.5, 3.25, 4.0]
        XCTAssertEqual(counts, expectedCounts, "max failed")
        XCTAssertEqual(edges, expectedEdges, "max failed")
    }

/*
    func testHistcountsRealArrayAutoMatlab() throws {
        let realArrayA: RealArray = [1.0, 1.0, 1.0, 2.0, 2.0, 3.0,  4.0]
        let (counts, edges) = histcounts(realArrayA)
        let expectedCounts: [Int] = [3, 2, 1, 1]
        let expectedEdges: RealArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(counts, expectedCounts, "max failed")
        XCTAssertEqual(edges, expectedEdges, "max failed")
    }
    
    func testHistcountsRealArrayBinsMatlab() throws {
        let realArrayA: RealArray = [1.0, 1.0, 1.0, 2.0, 2.0, 3.0,  4.0]
        let bins = 4
        let (counts, edges) = histcounts(realArrayA, bins: bins)
        let expectedCounts: [Int] = [3, 2, 1, 1]
        let expectedEdges: RealArray = [0.7, 1.6, 2.5, 3.4, 4.3]
        XCTAssertEqual(counts, expectedCounts, "max failed")
        XCTAssertEqual(edges, expectedEdges, "max failed")
    }
*/

    // MARK: max

    func testMaxRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Real = max(realArrayA)
        let expected: Real = 4.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "max failed")
    }

    func testMaxindexRealArrayIndex() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let (result, index) = maxindex(realArrayA)
        let expected: Real = 4.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "max failed")
        XCTAssertEqual(index, 3, "max failed")
    }

    // MARK: mean

    func testMeanRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Real = mean(realArrayA)
        let expected: Real = 2.5
        XCTAssertEqual(result, expected, accuracy: accuracy, "mean failed")
    }

    // MARK: median

    func testMedianRealArraySplit() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Real = median(realArrayA)
        let expected: Real = 2.5
        XCTAssertEqual(result, expected, accuracy: accuracy, "median failed")
    }

    func testMedianRealArrayWhole() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0]
        let result: Real = median(realArrayA)
        let expected: Real = 3.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "median failed")
    }

    // MARK: min

    func testMinRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Real = min(realArrayA)
        let expected: Real = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "min failed")
    }

    func testMinRealArrayIndex() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let (result, index) = min(realArrayA)
        let expected: Real = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "min failed")
        XCTAssertEqual(index, 0, "min failed")
    }

    // MARK: mode

    func testModeRealArrayMany() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealArray = mode(realArrayA)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "mode failed")
    }

    func testModeRealArray1() throws {
        let realArrayA: RealArray = [1.0, 2.0, 2.0, 2.0]
        let result: RealArray = mode(realArrayA)
        let expected: RealArray = [2.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "mode failed")
    }

    func testModeRealArray2() throws {
        let realArrayA: RealArray = [1.0, 2.0, 1.0, 2.0]
        let result: RealArray = mode(realArrayA)
        let expected: RealArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "mode failed")
    }

    func testModeRealArrayEmpty() throws {
        let realArrayA: RealArray = []
        let result: RealArray = mode(realArrayA)
        let expected: RealArray = []
        XCTAssertEqual(result, expected, accuracy: accuracy, "mode failed")
    }

    // MARK: rms

    func testRmsRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Real = rms(realArrayA)
        let expected: Real = 2.738612787525831
        XCTAssertEqual(result, expected, accuracy: accuracy, "rms failed")
    }

    func testRmsComplexArray() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: Real = rms(complexArrayA)
        let expected: Real = 3.872983346207417
        XCTAssertEqual(result, expected, accuracy: accuracy, "rms failed")
    }

    // MARK: stddev

    func testStddevRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Real = stddev(realArrayA)
        let expected: Real = 1.290994448735806
        XCTAssertEqual(result, expected, accuracy: accuracy, "stddev failed")
    }

    // MARK: variance

    func testVarianceRealArray() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: Real = variance(realArrayA)
        let expected: Real = 1.666666666666667
        XCTAssertEqual(result, expected, accuracy: accuracy, "variance failed")
    }

}
