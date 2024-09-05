//
//  PolynomialTests.swift
//  
//
//  Created by Marcus Painter on 27/08/2024.
//

import XCTest
import VecLab

class PolynomialTests: XCTestCase {
    
    let accuracy: RealDouble = 1e-6
    
    // MARK: filter
    
    func testPolyval() throws {
        let p: RealDoubleArray = [3, 2, 1]
        let x: RealDoubleArray = [5, 7, 9]
        let result: RealDoubleArray = polyval(p,x)
        let expected: RealDoubleArray = [86, 162, 262]
        
        XCTAssertEqual(result, expected, accuracy: accuracy, "polyval failed")
    }
    
    func testPolyvalRealArrayComplex() throws {
        let p: RealDoubleArray = [3, 2, 1]
        let x: ComplexDouble = (5, 5)
        let result: ComplexDouble = polyval(p,x)
        let expected: ComplexDouble =  (11, 160)
        
        disp(result)
        
        XCTAssertEqual(result, expected, accuracy: accuracy, "polyval failed")
    }
    
    func testPolyvalRealArrayComplexArray() throws {
        let p: RealDoubleArray = [3, 2, 1]
        let x: ComplexDoubleArray = ([5, 7, 9], [5, 7, 9])
        let result: ComplexDoubleArray = polyval(p,x)
        let expected: ComplexDoubleArray = ([11, 15, 19], [160, 308, 504])
        
        disp(result)
        
        XCTAssertEqual(result, expected, accuracy: accuracy, "polyval failed")
    }
    
    func testPolyvalComplexArrayComplexArray() throws {
        let p: ComplexDoubleArray = ([3, 2, 1], [3, 2 ,1])
        let x: ComplexDoubleArray = ([5, 7, 9], [5, 7, 9])
        let result: ComplexDoubleArray = polyval(p,x)
        let expected: ComplexDoubleArray = ([-149, -293, -485], [171, 323, 523])
        
        disp(result)
        
        XCTAssertEqual(result, expected, accuracy: accuracy, "polyval failed")
    }
}
