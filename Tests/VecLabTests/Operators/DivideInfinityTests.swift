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
        let result: Complex = Real.infinity / complex(0.0, -1.0)
        let expected: Complex = (Real.nan, Real.infinity)
        
        disp(result)
        
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    // inf/(0 +1i) = 0 -Inf
    func testDivideInf2() {
        let result: Complex = Real.infinity / complex(0.0, 1.0)
        let expected: Complex = (0.0, -Real.infinity)
        
        disp(result)
        
        XCTAssertEqual(result, expected, "Divide failed")
    }

    // (-inf)/(0 - 1i) = 0 -Inf
    func testDivideInf3() {
        let result: Complex = -Real.infinity / complex(0.0, -1.0)
        let expected: Complex = (0.0, -Real.infinity)
        
        disp(result)
        
        XCTAssertEqual(result, expected, "Divide failed")
    }

    // (-inf)/(0 +1i) = 0 + Inf
    func testDivideInf4() {
        let result: Complex = -Real.infinity / complex(0.0, 1.0)
        let expected: Complex = (0.0, Real.infinity)
        
        disp(result)
        
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    // 1/(1i) = 0 +1i
    func testDivideInf5() {
        let result: Complex = 1.0 / complex(0, 1)
        let expected: Complex = (0.0, -1.0)
        
        disp(result)
        
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    // 1/(-1i) = 0 -1i
    func testDivideInf6() {
        let result: Complex = 1.0 / complex(0, -1)
        let expected: Complex = (0.0, 1.0)
        
        disp(result)
        
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    // 1/(inf + inf*i) = 0
    func testDivideInf7() {
        let result: Complex = 1.0 / complex(.infinity, .infinity)
        let expected: Complex = (0.0, 0.0)
        
        disp(result)
        
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    // 1/(inf - inf*i) = 0
    func testDivideInf8() {
        let result: Complex = 1.0 / complex(.infinity, -.infinity)
        let expected: Complex = (0.0, 0.0)
        
        disp(result)
        print( 1.0 / .infinity)
        print( Real.infinity / Real.infinity)
        
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    // inf / 2 = inf
    func testDivideInf9() {
        let result: Real = .infinity / 2.0
        let expected: Real = .infinity
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    func testInfinity1() {
        let result: Real = 0.0 / 0.0
        var _: Real = Real.nan
        print(result)
        XCTAssertEqual(result.isNaN, true, "Divide failed")
        
    }
    
    func testInfinity2() {
        let result: Real = 1.0 / 0.0
        let expected: Real = Real.infinity
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
        
    }
    
    func testInfinity3() {
        let result: Real = 1.0 / .infinity
        let expected: Real = 0;
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
        
    }
    
    func testInfinity4() {
        let result: Real = .infinity / .infinity
        let _: Real = .nan;
        print(result)
        XCTAssertEqual(result.isNaN, true, "Divide failed")
        
    }
    
    func testInfinity5() {
        let result: Real = .infinity / (-.infinity)
        let _: Real = .nan;
        print(result)
        XCTAssertEqual(result.isNaN, true, "Divide failed")
        
    }
    
    func testInfinity6() {
        let result: Complex = 1.0 / (0.0, 0.0)
        let expected: Complex = (.infinity, 0.0)
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
        
    }
    
    func testInfinity7() {
        let result: Complex = 1.0 / (0.0, .infinity)
        let expected: Complex = (0.0, 0.0)
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
        
    }
    
    func testInfinity8() {
        let result: Complex = 1.0 / (0.0, -.infinity)
        let expected: Complex = (0.0, 0.0)
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
        
    }
    
    func testInfinity9() {
        let result: Complex = .infinity / (0.0, .infinity)
        let expected: Complex = (0.0, -.infinity)
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    func testInfinity10() {
        let result: Complex = .infinity / (0.0, -.infinity)
        let expected: Complex = (0.0, .infinity)
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    func testInfinity11() {
        let result: Complex = -.infinity / (0.0, .infinity)
        let expected: Complex = (0.0, .infinity)
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    func testInfinity12() {
        let result: Complex = -.infinity / (0.0, -.infinity)
        let expected: Complex = (0.0, -.infinity)
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    func testInfinity13() {
        let result: Complex = (.infinity, .infinity) / (.infinity, .infinity)
        let _: Complex = (.nan, .nan)
        print(result)
        XCTAssertEqual(result.0.isNaN && result.1.isNaN, true, "Divide failed")
    }
    
    func testInfinity14() {
        let result: Complex = (-.infinity, .infinity) / (.infinity, .infinity)
        let _: Complex = (.nan, .nan)
        print(result)
        XCTAssertEqual(result.0.isNaN && result.1.isNaN, true, "Divide failed")
    }
    
    func testInfinity15() {
        let result: Complex = (-.infinity, -.infinity) / (.infinity, .infinity)
        let _: Complex = (.nan, .nan)
        print(result)
        XCTAssertEqual(result.0.isNaN && result.1.isNaN, true, "Divide failed")
    }
    
    func testInfinity16() {
        let result: Complex = (-.infinity, -.infinity) / (-.infinity, .infinity)
        let _: Complex = (.nan, .nan)
        print(result)
        XCTAssertEqual(result.0.isNaN && result.1.isNaN, true, "Divide failed")
    }

    func testInfinity17() {
        let result: Complex = (-.infinity, -.infinity) / (-.infinity, -.infinity)
        let _: Complex = (.nan, .nan)
        print(result)
        XCTAssertEqual(result.0.isNaN && result.1.isNaN, true, "Divide failed")
    }
    
    func testInfinityArray1() {
        let a: RealArray = [Real.infinity]
        let b: ComplexArray = ([0.0], [Real.infinity])
        let result: ComplexArray = a / b
        let expected: ComplexArray = ([0.0], [-Real.infinity])
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
    }
    
    func testInfinityArray2() {
        let a: ComplexArray = ([Real.infinity], [0.0])
        let b: ComplexArray = ([0.0], [Real.infinity])
        let result: ComplexArray = a / b
        let expected: ComplexArray = ([0.0], [-Real.infinity])
        print(result)
        XCTAssertEqual(result, expected, "Divide failed")
        XCTAssertEqual(result.0[0].isNaN, false, "Divide failed")
        XCTAssertEqual(result.1[0].isNaN, false, "Divide failed")
    }
    
    func testInfinityVector() {
        let a: ComplexArray = ([Real.infinity], [0.0])
        let b: ComplexArray = ([0.0], [Real.infinity])
        let result = a / b
        
        let expected: ComplexArray = ([0.0], [-Real.infinity])
        XCTAssertEqual(result, expected, "Divide failed")
        XCTAssertEqual(result.0[0].isNaN, false, "Divide failed")
        XCTAssertEqual(result.1[0].isNaN, false, "Divide failed")
    }
}
*/
