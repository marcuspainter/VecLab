//
//  DoubleArrayInitCountTests.swift
//  VecLab
//
//  Created by Marcus Painter on 02/09/2025.
//

import VecLab
import XCTest

final class DoubleArrayInitCountTests: XCTestCase {
    
    func testInit() throws {
        let count = 10
        let array = [Double](count: count)
        
        XCTAssertEqual(array.count, count)
    }
    
}
