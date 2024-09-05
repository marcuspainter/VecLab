//
//  DivideTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import Foundation
import XCTest
import VecLab

/*
class DivideInfinityTests: XCTestCase {
    
    // MATLAB
    // inf/(0 -1i) = 0 +Inf
    // inf/(0 +1i) = 0 -Inf
    // (-inf)/(0 - 1i) = 0 -Inf
    // (-inf)/(0 +1i) = 0 + Inf
    
    // 1/(1i) = 0 -1i
    // 1/(-1i) = 0 +1i
    
    // inf/(0 -1i) = 0 +Inf
    func testDivideInf1() {
        let result: ComplexDouble = Double.infinity / complex(0.0, -1.0)
        let expected: ComplexDouble = (Real.nan, Double.infinity)
        
        disp(result)
        
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    // inf/(0 +1i) = 0 -Inf
    func testDivideInf2() {
        let result: ComplexDouble = Double.infinity / complex(0.0, 1.0)
        let expected: ComplexDouble = (0.0, -Double.infinity)
        
        disp(result)
        
        XCTAssertEqual(result, expected, "Divide failed")
    }

    // (-inf)/(0 - 1i) = 0 -Inf
    func testDivideInf3() {
        let result: ComplexDouble = -Double.infinity / complex(0.0, -1.0)
        let expected: ComplexDouble = (0.0, -Double.infinity)
        
        disp(result)
        
        XCTAssertEqual(result, expected, "Divide failed")
    }

    // (-inf)/(0 +1i) = 0 + Inf
    func testDivideInf4() {
        let result: ComplexDouble = -Double.infinity / complex(0.0, 1.0)
        let expected: ComplexDouble = (0.0, Double.infinity)
        
        disp(result)
        
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    // 1/(1i) = 0 +1i
    func testDivideInf5() {
        let result: ComplexDouble = 1.0 / complex(0, 1)
        let expected: ComplexDouble = (0.0, -1.0)
        
        disp(result)
        
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    // 1/(-1i) = 0 -1i
    func testDivideInf6() {
        let result: ComplexDouble = 1.0 / complex(0, -1)
        let expected: ComplexDouble = (0.0, 1.0)
        
        disp(result)
        
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    // 1/(inf + inf*i) = 0
    func testDivideInf7() {
        let result: ComplexDouble = 1.0 / complex(.infinity, .infinity)
        let expected: ComplexDouble = (0.0, 0.0)
        
        disp(result)
        
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    // 1/(inf - inf*i) = 0
    func testDivideInf8() {
        let result: ComplexDouble = 1.0 / complex(.infinity, -.infinity)
        let expected: ComplexDouble = (0.0, 0.0)
        
        disp(result)
        print( 1.0 / .infinity)
        print( Double.infinity / Double.infinity)
        
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    // inf / 2 = inf
    func testDivideInf9() {
        let result: RealDouble = .infinity / 2.0
        let expected: RealDouble = .infinity
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    func testInfinity1() {
        let result: RealDouble = 0.0 / 0.0
        var _: RealDouble = Real.nan
        print(result)
        XCTAssertEqual(result.isNaN, true, "Divide failed")
        
    }
    
    func testInfinity2() {
        let result: RealDouble = 1.0 / 0.0
        let expected: RealDouble = Double.infinity
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
        
    }
    
    func testInfinity3() {
        let result: RealDouble = 1.0 / .infinity
        let expected: RealDouble = 0;
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
        
    }
    
    func testInfinity4() {
        let result: RealDouble = .infinity / .infinity
        let _: RealDouble = .nan;
        print(result)
        XCTAssertEqual(result.isNaN, true, "Divide failed")
        
    }
    
    func testInfinity5() {
        let result: RealDouble = .infinity / (-.infinity)
        let _: RealDouble = .nan;
        print(result)
        XCTAssertEqual(result.isNaN, true, "Divide failed")
        
    }
    
    func testInfinity6() {
        let result: ComplexDouble = 1.0 / (0.0, 0.0)
        let expected: ComplexDouble = (.infinity, 0.0)
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
        
    }
    
    func testInfinity7() {
        let result: ComplexDouble = 1.0 / (0.0, .infinity)
        let expected: ComplexDouble = (0.0, 0.0)
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
        
    }
    
    func testInfinity8() {
        let result: ComplexDouble = 1.0 / (0.0, -.infinity)
        let expected: ComplexDouble = (0.0, 0.0)
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
        
    }
    
    func testInfinity9() {
        let result: ComplexDouble = .infinity / (0.0, .infinity)
        let expected: ComplexDouble = (0.0, -.infinity)
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    func testInfinity10() {
        let result: ComplexDouble = .infinity / (0.0, -.infinity)
        let expected: ComplexDouble = (0.0, .infinity)
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    func testInfinity11() {
        let result: ComplexDouble = -.infinity / (0.0, .infinity)
        let expected: ComplexDouble = (0.0, .infinity)
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    func testInfinity12() {
        let result: ComplexDouble = -.infinity / (0.0, -.infinity)
        let expected: ComplexDouble = (0.0, -.infinity)
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    func testInfinity13() {
        let result: ComplexDouble = (.infinity, .infinity) / (.infinity, .infinity)
        let _: ComplexDouble = (.nan, .nan)
        print(result)
        XCTAssertEqual(result.0.isNaN && result.1.isNaN, true, "Divide failed")
    }
    
    func testInfinity14() {
        let result: ComplexDouble = (-.infinity, .infinity) / (.infinity, .infinity)
        let _: ComplexDouble = (.nan, .nan)
        print(result)
        XCTAssertEqual(result.0.isNaN && result.1.isNaN, true, "Divide failed")
    }
    
    func testInfinity15() {
        let result: ComplexDouble = (-.infinity, -.infinity) / (.infinity, .infinity)
        let _: ComplexDouble = (.nan, .nan)
        print(result)
        XCTAssertEqual(result.0.isNaN && result.1.isNaN, true, "Divide failed")
    }
    
    func testInfinity16() {
        let result: ComplexDouble = (-.infinity, -.infinity) / (-.infinity, .infinity)
        let _: ComplexDouble = (.nan, .nan)
        print(result)
        XCTAssertEqual(result.0.isNaN && result.1.isNaN, true, "Divide failed")
    }

    func testInfinity17() {
        let result: ComplexDouble = (-.infinity, -.infinity) / (-.infinity, -.infinity)
        let _: ComplexDouble = (.nan, .nan)
        print(result)
        XCTAssertEqual(result.0.isNaN && result.1.isNaN, true, "Divide failed")
    }
    
    func testInfinityArray1() {
        let a: RealDoubleArray = [Double.infinity]
        let b: ComplexDoubleArray = ([0.0], [Double.infinity])
        let result: ComplexDoubleArray = a / b
        let expected: ComplexDoubleArray = ([0.0], [-Double.infinity])
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    func testInfinityArray2() {
        let a: ComplexDoubleArray = ([Double.infinity], [0.0])
        let b: ComplexDoubleArray = ([0.0], [Double.infinity])
        let result: ComplexDoubleArray = a / b
        let expected: ComplexDoubleArray = ([0.0], [-Double.infinity])
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
        XCTAssertEqual(result.0[0].isNaN, false, "Divide failed")
        XCTAssertEqual(result.1[0].isNaN, false, "Divide failed")
    }
    
    func testInfinityVector() {
        let a: ComplexDoubleArray = ([Double.infinity], [0.0])
        let b: ComplexDoubleArray = ([0.0], [Double.infinity])
        let result = a / b
        
        let expected: ComplexDoubleArray = ([0.0], [-Double.infinity])
        XCTAssertEqual(result, expected, "Divide failed")
        XCTAssertEqual(result.0[0].isNaN, false, "Divide failed")
        XCTAssertEqual(result.1[0].isNaN, false, "Divide failed")
    }
}
*/
