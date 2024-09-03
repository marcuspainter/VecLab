//
//  PolynomialTests.swift
//  
//
//  Created by Marcus Painter on 27/08/2024.
//

import XCTest
import VecLab

class PolynomialTests: XCTestCase {
    
    let accuracy: Real = 1e-6
    
    // MARK: filter
    
    func testPolyval() throws {
        let p: RealArray = [3, 2, 1]
        let x: RealArray = [5, 7, 9]
        let result: RealArray = polyval(p,x)
        let expected: RealArray = [86, 162, 262]
        
        XCTAssertEqual(result, expected, accuracy: accuracy, "polyval failed")
    }
    
    func testPolyvalRealArrayComplex() throws {
        let p: RealArray = [3, 2, 1]
        let x: Complex = (5, 5)
        let result: Complex = polyval(p,x)
        let expected: Complex =  (11, 160)
        
        disp(result)
        
        XCTAssertEqual(result, expected, accuracy: accuracy, "polyval failed")
    }
    
    func testPolyvalRealArrayComplexArray() throws {
        let p: RealArray = [3, 2, 1]
        let x: ComplexArray = ([5, 7, 9], [5, 7, 9])
        let result: ComplexArray = polyval(p,x)
        let expected: ComplexArray = ([11, 15, 19], [160, 308, 504])
        
        disp(result)
        
        XCTAssertEqual(result, expected, accuracy: accuracy, "polyval failed")
    }
    
    func testPolyvalComplexArrayComplexArray() throws {
        let p: ComplexArray = ([3, 2, 1], [3, 2 ,1])
        let x: ComplexArray = ([5, 7, 9], [5, 7, 9])
        let result: ComplexArray = polyval(p,x)
        let expected: ComplexArray = ([-149, -293, -485], [171, 323, 523])
        
        disp(result)
        
        XCTAssertEqual(result, expected, accuracy: accuracy, "polyval failed")
    }
}
