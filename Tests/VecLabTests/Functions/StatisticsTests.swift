//
//  StatisticTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import XCTest
import VecLab

class StatisticsTests: XCTestCase {

    let accuracy: RealDouble = 1e-6

    // MARK: histcounts

    // TODO: Does not match Matlab

    func testHistcountsRealArrayAuto() throws {
        let realArrayA: RealDoubleArray = [1.0, 1.0, 1.0, 2.0, 2.0, 3.0, 4.0]
        let (counts, edges) = histcounts(realArrayA)
        let expectedCounts: [Int] = [7]
        let expectedEdges: RealDoubleArray = [1.0, 4.0]
        XCTAssertEqual(counts, expectedCounts, "max failed")
        XCTAssertEqual(edges, expectedEdges, "max failed")
    }

    func testHistcountsRealArrayBins() throws {
        let realArrayA: RealDoubleArray = [1.0, 1.0, 1.0, 2.0, 2.0, 3.0, 4.0]
        let bins = 4
        let (counts, edges) = histcounts(realArrayA, bins: bins)
        let expectedCounts: [Int] = [3, 2, 1, 1]
        let expectedEdges: RealDoubleArray = [1.0, 1.75, 2.5, 3.25, 4.0]
        XCTAssertEqual(counts, expectedCounts, "max failed")
        XCTAssertEqual(edges, expectedEdges, "max failed")
    }

/*
    func testHistcountsRealArrayAutoMatlab() throws {
        let realArrayA: RealDoubleArray = [1.0, 1.0, 1.0, 2.0, 2.0, 3.0,  4.0]
        let (counts, edges) = histcounts(realArrayA)
        let expectedCounts: [Int] = [3, 2, 1, 1]
        let expectedEdges: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(counts, expectedCounts, "max failed")
        XCTAssertEqual(edges, expectedEdges, "max failed")
    }
    
    func testHistcountsRealArrayBinsMatlab() throws {
        let realArrayA: RealDoubleArray = [1.0, 1.0, 1.0, 2.0, 2.0, 3.0,  4.0]
        let bins = 4
        let (counts, edges) = histcounts(realArrayA, bins: bins)
        let expectedCounts: [Int] = [3, 2, 1, 1]
        let expectedEdges: RealDoubleArray = [0.7, 1.6, 2.5, 3.4, 4.3]
        XCTAssertEqual(counts, expectedCounts, "max failed")
        XCTAssertEqual(edges, expectedEdges, "max failed")
    }
*/

    // MARK: max

    func testMaxRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDouble = max(realArrayA)
        let expected: RealDouble = 4.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "max failed")
    }

    func testMaxindexRealArrayIndex() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let (result, index) = maxindex(realArrayA)
        let expected: RealDouble = 4.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "max failed")
        XCTAssertEqual(index, 3, "max failed")
    }

    // MARK: mean

    func testMeanRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDouble = mean(realArrayA)
        let expected: RealDouble = 2.5
        XCTAssertEqual(result, expected, accuracy: accuracy, "mean failed")
    }

    // MARK: median

    func testMedianRealArraySplit() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDouble = median(realArrayA)
        let expected: RealDouble = 2.5
        XCTAssertEqual(result, expected, accuracy: accuracy, "median failed")
    }

    func testMedianRealArrayWhole() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0, 5.0]
        let result: RealDouble = median(realArrayA)
        let expected: RealDouble = 3.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "median failed")
    }

    // MARK: min

    func testMinRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDouble = min(realArrayA)
        let expected: RealDouble = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "min failed")
    }

    func testMinRealArrayIndex() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let (result, index) = minindex(realArrayA)
        let expected: RealDouble = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "min failed")
        XCTAssertEqual(index, 0, "min failed")
    }

    // MARK: mode

    func testModeRealArrayMany() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = mode(realArrayA)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "mode failed")
    }

    func testModeRealArray1() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 2.0, 2.0]
        let result: RealDoubleArray = mode(realArrayA)
        let expected: RealDoubleArray = [2.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "mode failed")
    }

    func testModeRealArray2() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 1.0, 2.0]
        let result: RealDoubleArray = mode(realArrayA)
        let expected: RealDoubleArray = [1.0, 2.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "mode failed")
    }

    func testModeRealArrayEmpty() throws {
        let realArrayA: RealDoubleArray = []
        let result: RealDoubleArray = mode(realArrayA)
        let expected: RealDoubleArray = []
        XCTAssertEqual(result, expected, accuracy: accuracy, "mode failed")
    }

    // MARK: rms

    func testRmsRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDouble = rms(realArrayA)
        let expected: RealDouble = 2.738612787525831
        XCTAssertEqual(result, expected, accuracy: accuracy, "rms failed")
    }

    func testRmsComplexArray() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: RealDouble = rms(complexArrayA)
        let expected: RealDouble = 3.872983346207417
        XCTAssertEqual(result, expected, accuracy: accuracy, "rms failed")
    }

    // MARK: stddev

    func testStddevRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDouble = stddev(realArrayA)
        let expected: RealDouble = 1.290994448735806
        XCTAssertEqual(result, expected, accuracy: accuracy, "stddev failed")
    }

    // MARK: variance

    func testVarianceRealArray() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: RealDouble = variance(realArrayA)
        let expected: RealDouble = 1.666666666666667
        XCTAssertEqual(result, expected, accuracy: accuracy, "variance failed")
    }

}
