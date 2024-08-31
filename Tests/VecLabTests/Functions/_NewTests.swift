//
//  File.swift
//  
//
//  Created by Marcus Painter on 28/08/2024.
//

import Foundation
import XCTest
import VecLab
import Accelerate

class NewTests: XCTestCase {
    
    let accuracy = 1e-6
    
    func testFillRealArray() throws {
        let c: RealArray = [1 ,2, 3, 4, 5]
        let a: Real = 999.0
        fill(c, a)
        let expected: RealArray = [999, 999, 999, 999, 999]
        XCTAssertEqual(c, expected, "fill failed")
    }
    
    func testFillComplexDArray() throws {
        let c: ComplexArray = ([1 ,2, 3, 4, 5], [1, 2, 3, 4, 5])
        let a: Complex = (999.0, 777.0)
        fill(c, a)
        let expected: ComplexArray = ([999, 999, 999, 999, 999], [777, 777, 777, 777, 777])
        XCTAssertEqual(c, expected, "fill failed")
    }
  /*
    func testXcorrRealArray() throws {
        let a: RealArray = [1 ,2, 3, 4]
        let result = xcorr(a)
        let expected = [4.0, 11.0, 20.0, 30.0, 20.0, 11.0, 4.0]
   
        XCTAssertEqual(result, expected, accuracy: accuracy, "xcorr failed")
    }
    
    func testXcorrRealArrayRealArray() throws {
        let a: RealArray = [1 ,2, 3, 4]
        let b: RealArray = [5 ,6, 7, 8]
        var result = xcorr(a, b)
        let expected = [8.0, 23.0, 44.0, 70.0, 56.0, 39.0, 20.0]
        
        
        disp(result)
        print( a.count + b.count - 1, nextpow2(a.count + b.count - 1))
        
        let shift = nextpow2(a.count + b.count - 1) - (a.count + b.count - 1) + 2
        print("Shift", shift)
        //result = circshift(result, shift)
        //result = slice(result, 0 ..< (a.count + b.count - 1))
        
        disp("--")
        disp(result)
        
        XCTAssertEqual(result, expected, accuracy: accuracy, "xcorr failed")
    }
    
    func testXcorrRealArrayRealArray2() throws {
        let a: RealArray = [1, 2, 3,  4,  5,  6]
        let b: RealArray = [7, 8, 9, 10, 11, 12]
        var result = xcorr(a, b)

        disp(result)
        print( a.count + b.count - 1, nextpow2(a.count + b.count - 1))
        
        var shift = nextpow2(a.count + b.count - 1) - (a.count + b.count - 1)
        shift = 5
        print("Shift", shift)
        result = circshift(result, shift)
        //result = slice(result, 0 ..< (a.count + b.count - 1))
        
        disp("--")
        disp(result)
        
        let expected = [12.0, 35.0, 68.0, 110.0, 160.0, 217.0, 190.0, 158.0, 122.0, 83.0, 42.0]
        
        XCTAssertEqual(result, expected, accuracy: accuracy, "xcorr failed")
    }
*/
    func testConvRealArrayRealArray() throws {
        let a: RealArray = [1.0, 0.0, 1.0]
        let b: RealArray = [2.0, 7.0]
        let result = conv(a, b)
        let expected = [2.0, 7.0, 2.0, 7.0]
        
        XCTAssertEqual(result, expected, accuracy: accuracy, "conv failed")
    }
    
    func testConv() throws {
        let a: RealArray = [1.0, 0.0, 1.0]
        let b: RealArray = [2.0, 7.0]
        let c = vDSP.convolve(a, withKernel: b)
        print(c)
    }
    
    func testConvSimple() throws {
        let a: RealArray = [1.0, 0.0, 1.0]
        let b: RealArray = [2.0, 7.0]
        let result = convSimple(a, b)
        
        disp(result)
        
        let expected = [2.0, 7.0, 2.0, 7.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "convSimple failed")
    }
    
    func testXcorrSimple() throws {
        let a: RealArray = [1 ,2, 3, 4]
        let b: RealArray = [5 ,6, 7, 8]
        let result = xcorrSimple(a, b)
        let expected = [8.0, 23.0, 44.0, 70.0, 56.0, 39.0, 20.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "xcorrSimple failed")
    }
}
