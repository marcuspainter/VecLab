//
//  DoubleArrayInitSizedTests.swift
//  VecLab
//
//  Created by Marcus Painter on 02/09/2025.
//

import VecLab
import XCTest

final class DoubleArrayInitSizedTests: XCTestCase {
    
    func testInit() throws {
        let a = [Double](repeating: 0.0, count: 10)
        
        let b = [Double](sized: a)
        
        XCTAssertEqual(b.count, a.count)
    }

}
