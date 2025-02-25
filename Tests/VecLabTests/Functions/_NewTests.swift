//
//  NewTests.swift
//
//
//  Created by Marcus Painter on 28/08/2024.
//

import Accelerate
import Foundation
import VecLab
import XCTest

class NewTests: XCTestCase {
    let accuracy: Real = 1e-3

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
    
    // MARK: xcorr
    
    func testXcorrRealArrayCross() throws {
        let a: RealArray = [1, 2, 3, 4]
        let b: RealArray = [5, 6, 7, 8]
        let result: RealArray = xcorr(a, b)
        let expected: RealArray = [8.0, 23.0, 44.0, 70.0, 56.0, 39.0, 20.0]
        
        XCTAssertEqual(result, expected, accuracy: accuracy, "xcorr failed")
    }

    func testXcorrRealArrayAuto() throws {
        let a: RealArray = [1, 2, 3, 4]
        let result: RealArray = xcorr(a)
        let expected: RealArray = [4.0, 11.0, 20.0, 30.0, 20.0, 11.0, 4.0]

        XCTAssertEqual(result, expected, accuracy: accuracy, "xcorr failed")
    }
    
    func testXcorrRealArrayRealArray2() throws {
        let a: RealArray = [1, 2, 3, 4, 5, 6]
        let b: RealArray = [7, 8, 9, 10, 11, 12]
        let result: RealArray = xcorr(a, b)
        let expected: RealArray = [12.0, 35.0, 68.0, 110.0, 160.0, 217.0, 190.0, 158.0, 122.0, 83.0, 42.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "xcorr failed")
    }
    
    func testXcorrComplexArrayCross() throws {
        let a: ComplexArray = ([1, 2, 3, 4], [1, 2, 3, 4])
        let b: ComplexArray = ([5, 6, 7, 8], [5, 6, 7, 8])
        let result: ComplexArray = xcorr(a, b)
        let expected: ComplexArray =
        ( [16.0, 46.0, 88.0, 140.0, 112.0, 78.0, 40.0], [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
        
        XCTAssertEqual(result, expected, accuracy: accuracy, "xcorr failed")
    }

    func testXcorrComplexArrayAuto() throws {
        let a: ComplexArray = ([1, 2, 3, 4], [1, 2, 3, 4])
        let result: ComplexArray = xcorr(a)
        let expected: ComplexArray = ([8.0, 22.0, 40.0, 60.0, 40.0, 22.0, 8.0], [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])

        XCTAssertEqual(result, expected, accuracy: accuracy, "xcorr failed")
    }
    
    func testXcorrComplexArray2() throws {
        let a: ComplexArray = ([1, 2, 3, 4, 5, 6],[1, 2, 3, 4, 5, 6])
        let b: ComplexArray = ([7, 8, 9, 10, 11, 12], [7, 8, 9, 10, 11, 12])
        let result: ComplexArray = xcorr(a, b)
        let expected: ComplexArray = ([24.0, 70.0, 136.0, 220.0, 320.0, 434.0, 380.0, 316.0, 244.0, 166.0, 84.0],
                                      [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "xcorr failed")
    }
    
    // MARK: conv
    
    func testConvSameRealArray2() throws {
        let a: RealArray = [1, 2, 3, 4, 5, 6]
        let b: RealArray = [7, 8, 9, 10, 11, 12]
        let result = conv(a, b, "same")
        let expected: RealArray = [80.0, 125.0, 182.0, 190.0, 184.0, 163.0]
        
        print(result)
        
        XCTAssertEqual(result, expected, accuracy: accuracy, "conv failed")
    }
    
    func testConvSameRealArray() throws {
        let a: RealArray = [1.0, 0.0, 1.0]
        let b: RealArray = [2.0, 7.0]
        let result: RealArray = conv(a, b, "same")
        let expected: RealArray = [7.0, 2.0, 7.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "conv failed")
    }
    
    func testConvSameComplexArray() throws {
        let a: ComplexArray = ([1.0, 0.0, 1.0], [1.0, 0.0, 1.0])
        let b: ComplexArray = ([2.0, 7.0], [2.0, 7.0])
        let result: ComplexArray = conv(a, b, "same")
        let expected: ComplexArray = ([0.0, 0.0, 0.0], [14.0, 4.0, 14.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "conv failed")
    }
    
    func testConvFullRealArray2() throws {
        let a: RealArray = [1, 2, 3, 4, 5, 6]
        let b: RealArray = [7, 8, 9, 10, 11, 12]
        let result = conv(a, b, "full")
        let expected: RealArray = [7.0, 22.0, 46.0, 80.0, 125.0, 182.0, 190.0, 184.0, 163.0, 126.0, 72.0]
        
        print(result)
        
        XCTAssertEqual(result, expected, accuracy: accuracy, "conv failed")
    }
    
    func testConvFullComplexArray() throws {
        let a: ComplexArray = ([1.0, 0.0, 1.0], [1.0, 0.0, 1.0])
        let b: ComplexArray = ([2.0, 7.0], [2.0, 7.0])
        let result = conv(a, b, "full")
        let expected: ComplexArray = ([0.0, 0.0, 0.0, 0.0], [4.0, 14.0, 4.0, 14.0])
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
