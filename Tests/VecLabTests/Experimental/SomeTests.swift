//
//  SomeTests.swift
//  VecLab
//
//  Created by Marcus Painter on 10/05/2025.
//

import Accelerate
import VecLab
import XCTest

final class SomeTests: XCTestCase {
    /*
    func testExample() throws {

        let x = vector(1...10);
        
        let frequency = 100.0 // Hz
        let sampleRate: Double = 48000.0 // Hz
        let qualityFactor = sqrt(2.0) / 2.0 // 0.707106781186548 - Butterworth
        let dbGain = 0.0
        
        // Filter coefficients for Butterworth
        let (b,a) = biquad(f: frequency, fs: sampleRate, q: qualityFactor, db: dbGain, type: .lowpass)
        
        let y = filter(b: b, a: a, x: x)
        
        disp(y) // Print
        
    }
    
    func testDct() {
        let x = vector(1...8)
        let d = dct(x)
        let xx = idct(d)
        disp(d)
        disp(xx)
        
    }
     */
    
    /*
    func test1() {
        let a: [Double] = []
        let b: [Double] = []
        
        var c = a + b
        print("c: \(c)")
    
        c = sin(a) + a
        print("c: \(c)")
        
        let d = vector(1 ... 100)
        let e = [Float](doubleArray: d)
    }
    */
    
    func test1() {
        var d = [1.0, 2.0, 3.0]
        let f = [Float](doubleArray: d)
        d = [Double](floatArray: f)
        
        let empty = [Float](doubleArray: [])
        
        print(empty)
    }
}
