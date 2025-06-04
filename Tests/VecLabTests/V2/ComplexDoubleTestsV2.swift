//
//  ComplexDoubleTests.swift
//  VecLab
//
//  Created by Marcus Painter on 15/05/2025.
//

import XCTest
import VecLab

final class ComplexDoubleTestsV2: XCTestCase {
    
    func testFormatted() throws {
        var a = Complex(2, 3)
        var s = a.formatted()
        print(s)
        
        a = Complex(2, -3)
        s = a.formatted()
        print(s)
        
        a = Complex(-2, -3)
        s = a.formatted()
        print(s)
        
        a = Complex(-2, -3)
        s = a.formatted(style: .engineering)
        print(s)
        
        let b = Complex(7, 5)
        a += 1.0
        a -= 2.0
        a *= 3.0
        a /= 4.0
        
        a += b
        a -= b
        a *= b
        a /= b
    }
}
