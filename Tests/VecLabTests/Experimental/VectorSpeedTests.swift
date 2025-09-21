//
//  VectorSpeedTests.swift
//  VecLab
//
//  Created by Marcus Painter on 17/09/2025.
//

import Accelerate
import XCTest

@testable import VecLab

final class VectorSpeedTests: XCTestCase {
    
    func testVectorSpeed1() {
        
        let n = 2**16
        let a = vector(1...n)
        let b = vector(1...n)
        var c = vector(1...n)
        
        /*
        benchmark {

            CoreVectorNative.add(a, b)
        }
        
        benchmark {

            CoreVectorSIMD.add(a, b)
        }
        
        benchmark {

            CoreVectorVDSP.add(a, b)
        }
         */
        
        measure(metrics: [XCTClockMetric()]) {
            CoreVectorSIMD.add(a, b)
        }
        print("Done")

 
    }
    
    func testVectorSpeed2() {
        
        let n = 2**16
        let a = vector(1...n)
        let b = vector(1...n)
        var c = vector(1...n)
        
        measure(metrics: [XCTClockMetric()]) {
            CoreVectorSIMD.add(a, b)
        }
        print("Done")
        
    }
    
}
