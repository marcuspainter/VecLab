//
//  BenchmarkTests.swift
//  VecLab
//
//  Created by Marcus Painter on 24/09/2025.
//

import Accelerate
import XCTest

@testable
import VecLab

final class BenchmarkTests: XCTestCase {
    
    let n = 10000

    
    func testMath() throws {
        let a = vector(1...n)
        var b = vector(1...n)
        var c = vector(1...n)

        let t0 = benchmark {
             c = a * b
        }
        let t1 = benchmark {
             c = op(a, b)
        }
    }
        
    func op(_ a: [Double], _ b: [Double]) -> [Double] {
        var c = vector(1...n)
        for i in 0..<n {
            c[i] = a[i] * b[i]
        }
        return c
    }
    
}
