//
//  File.swift
//
//
//  Created by Marcus Painter on 28/08/2024.
//

import Accelerate
import Foundation
import VecLab
import XCTest

class NewTests: XCTestCase {
    let accuracy: Real = 1e-6

    func testFillRealArray() throws {
        let c: RealArray = [1, 2, 3, 4, 5]
        let a: Real = 999.0
        fill(c, a)
        let expected: RealArray = [999, 999, 999, 999, 999]
        XCTAssertEqual(c, expected, "fill failed")
    }

    func testFillComplexDArray() throws {
        let c: ComplexArray = ([1, 2, 3, 4, 5], [1, 2, 3, 4, 5])
        let a: Complex = (999.0, 777.0)
        fill(c, a)
        let expected: ComplexArray = ([999, 999, 999, 999, 999], [777, 777, 777, 777, 777])
        XCTAssertEqual(c, expected, "fill failed")
    }

    func testXcorrRealArray() throws {
        let a: RealArray = [1, 2, 3, 4]
        let result: RealArray = xcorr(a)
        let expected: RealArray = [4.0, 11.0, 20.0, 30.0, 20.0, 11.0, 4.0]

        XCTAssertEqual(result, expected, accuracy: accuracy, "xcorr failed")
    }
    
    // TODO: Fix tests
    /*

    func testXcorrRealArrayRealArray() throws {
        let a: RealArray = [1, 2, 3, 4]
        let b: RealArray = [5, 6, 7, 8]
        var result: RealArray = xcorr(a, b)
        let expected: RealArray = [8.0, 23.0, 44.0, 70.0, 56.0, 39.0, 20.0]

        XCTAssertEqual(result, expected, accuracy: accuracy, "xcorr failed")
    }



    func testXcorrRealArrayRealArray2() throws {
        let a: RealArray = [1, 2, 3, 4, 5, 6]
        let b: RealArray = [7, 8, 9, 10, 11, 12]
        var result: RealArray = xcorr(a, b)
        let expected: RealArray = [12.0, 35.0, 68.0, 110.0, 160.0, 217.0, 190.0, 158.0, 122.0, 83.0, 42.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "xcorr failed")
    }

    func testConvRealArrayRealArray2() throws {
        let a: RealArray = [1, 2, 3, 4, 5, 6]
        let b: RealArray = [7, 8, 9, 10, 11, 12]
        var result = conv(a, b)
        let expected: RealArray = [7, 22, 46, 80, 125, 182, 190, 184, 163, 126, 72]
        XCTAssertEqual(result, expected, accuracy: accuracy, "xcorr failed")
    }
*/
    
    func testConvRealArrayRealArray() throws {
        let a: RealArray = [1.0, 0.0, 1.0]
        let b: RealArray = [2.0, 7.0]
        let result: RealArray = conv(a, b)
        let expected: RealArray = [2.0, 7.0, 2.0, 7.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "conv failed")
    }

    /*
    func testConv() throws {
        let a: RealArray = [1.0, 0.0, 1.0]
        let b: RealArray = [2.0, 7.0]
        let c: RealArray = vDSP.convolve(a, withKernel: b)
    }
*/
    func testConvSimple() throws {
        let a: RealArray = [1.0, 0.0, 1.0]
        let b: RealArray = [2.0, 7.0]
        let result: RealArray = convSimple(a, b)
        let expected: RealArray = [2.0, 7.0, 2.0, 7.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "convSimple failed")
    }

    func testXcorrSimple() throws {
        let a: RealArray = [1, 2, 3, 4]
        let b: RealArray = [5, 6, 7, 8]
        let result: RealArray = xcorrSimple(a, b)
        let expected: RealArray = [8.0, 23.0, 44.0, 70.0, 56.0, 39.0, 20.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "xcorrSimple failed")
    }

    /*
    func testXcorrMatlabAuto() throws {
        let signal: RealArray = [1, 2, 3, 4, 5, 6, 7, 8]
        let result: RealArray = xcorr(signal, signal)
        let correlationResult: RealArray = [8, 23, 44, 70, 100, 133, 168, 204, 168, 133, 100, 70, 44, 23, 8]
        XCTAssertEqual(result, correlationResult, accuracy: accuracy, "xcorr failed")
    }

    // TODO: Fix

    func testXcorrMatlabCross() throws {
        let signal: RealArray = [1, 2, 3, 4, 5, 6, 7, 8]
        let filter: RealArray = [10, 20, 30]
        let result: RealArray = xcorr(signal, filter)
        let correlationResult: RealArray = [0, 0, 0, 0, 0, 30, 80, 140, 200, 260, 320, 380, 440, 230, 80]
        XCTAssertEqual(result, correlationResult, accuracy: accuracy, "xcorr failed")
        disp(correlationResult)
    }

    func testConvMatlabAuto() throws {
        let signal: RealArray = [1, 2, 3, 4, 5, 6, 7, 8]
        let result: RealArray = conv(signal, signal)
        let correlationResult: RealArray = [1, 4, 10, 20, 35, 56, 84, 120, 147, 164, 170, 164, 145, 112, 64]
        XCTAssertEqual(result, correlationResult, accuracy: accuracy, "xcorr failed")
    }

    func testConvMatlabCross() throws {
        let signal: RealArray = [1, 2, 3, 4, 5, 6, 7, 8]
        let filter: RealArray = [10, 20, 30]
        let result: RealArray = conv(signal, filter)
        let correlationResult: RealArray = [10, 40, 100, 160, 220, 280, 340, 400, 370, 240]
        XCTAssertEqual(result, correlationResult, accuracy: accuracy, "xcorr failed")
    }
*/
     
    func testUpsample() throws {
        let signal: RealArray = [1, 2, 3]
        let result: RealArray = upsample(signal, 3)
        let expected: RealArray = [1, 0, 0, 2, 0, 0, 3, 0, 0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "upsample failed")
    }

    func testUpsamplePhase() throws {
        let signal: RealArray = [1, 2, 3]
        let result: RealArray = upsample(signal, 3, 1)
        let expected: RealArray = [0, 1, 0, 0, 2, 0, 0, 3, 0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "upsample failed")
    }

    func testDownsample() throws {
        let signal: RealArray = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        let result: RealArray = downsample(signal, 3)
        let expected: RealArray = [1, 4, 7]
        XCTAssertEqual(result, expected, accuracy: accuracy, "downsample failed")
    }

    func testDownsamplePhase() throws {
        let signal: RealArray = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        let result: RealArray = downsample(signal, 3, 1)
        let expected: RealArray = [2, 5, 8]
        XCTAssertEqual(result, expected, accuracy: accuracy, "downsample failed")
    }
}
