//
//  ComplexDoubleEnumeratedTest.swift
//  VecLab
//
//  Created by Marcus Painter on 25/04/2025.
//

import VecLab // Replace with your actual module name
import XCTest

final class ComplexDoubleArrayEnumeratedTests: XCTestCase {
    
    func testEnumerated() throws {
        
        let a = ComplexDoubleArray([1,2,3,4,5], [1,2,3,4,5])
        let b = a.enumerated()
        print(type(of:b))
        let c = b.map { Real($0) + $1 }
        let cc = ComplexDoubleArray(array: c)
        print(c)
        print(cc)
        
        let total = b.count(where: { _ in true })
        print(total)
        
        for (i,v) in a.enumerated() {
            print(i, v)
        }
        
        let q = a.reduce(0, +)
        
        print(q)
    }
    
    func testEnumeratedMap() throws {
        
        
    }
    
}
