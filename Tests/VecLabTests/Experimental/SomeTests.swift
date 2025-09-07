//
//  SomeTests.swift
//  VecLab
//
//  Created by Marcus Painter on 10/05/2025.
//

import Accelerate
@testable import VecLab
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
    
    func test2() {
        let n = 100000
        let m = 100000
        
        var x1: [Double] = vector(0..<n)
        var x2: [Double] = vector(0..<n)
        
        var y1: [Double] = vector(0..<n)
        var y2: [Double] = vector(0..<n)
        
        //let frag1 = x1[0..<20]
        //let frag2 = x1[0...20]
        //disp(frag2)
        
         let t1 = benchmark {
            x1 = vector(1..<n)
            //x1 = x1 + x1
            //x1 = arange(Real(n))
            //x1 = paddata(x1, length: m)
            //x1 = y1[100..<n
            // x1 = circshift(x1, 100)
           
            
        }
        
       let t2 = benchmark {
            x2 = vector(1..<n)// winner
            //x2 = x2 + x2// winner
            //x2 = arange2(Real(n))// winner
            //x2 = paddata(x2, length: m)  // winner
            //x2 = y2[100...n-1]
            //x1 = circshift(x1, 100)
        }

       // XCTAssertEqual(x1,x2,accuracy: 1e-5)
        
        print("%", (t1.median - t2.median) / t2.median * 100)
        print("x", (t1.median / t2.median))
    }
    
    func test3() {
        
        let n = 1000
        let a = ComplexArray(repeating: (3.0 + 4.j), count: n)
        let b = ComplexArray(repeating: (4.0 + 2.j), count: n)
        
        var z1 = ComplexArray(repeating: .zero, count: n)
        var z2 = ComplexArray(repeating: .zero, count: n)
        
        let t1 = benchmark {
            z1 = vectorMultiplyComplexArray(a, b)
            
        }
                              
        let t2 = benchmark {
            z2 = vectorMultiplyComplexArray3(a, b)
        }
    
        print(z1[n-1])
        print(z2[n-1])
        
        print("%", (t1.median - t2.median) / t2.median * 100)
        print("x", (t1.median / t2.median))
        
    }
    
    func test4() {
        print("Hello, World!")

        let n = Int(2 ** 16)
        let a = vector(1...n)
        let b = vector(1...n)
        var c = vector(1...n) * 2.0
        var d = vector(1...n)

        var i = [Double](repeating: 0.0, count: n)
        var r = [Double](repeating: 0.0, count: n)

        var di = [Double](repeating: 0.0, count: n)
        var dr = [Double](repeating: 0.0, count: n)

        var za = ComplexArray(a, b)
        var zb = ComplexArray(c, d)
        var zz = ComplexArray(count: n)

        let t1 = benchmark("Swift  ") {
            for k in 0..<a.count {
                r[k] = (a[k] * c[k]) - (b[k] * d[k])
                i[k] = (a[k] * d[k]) + (b[k] * c[k])
            }
        }

        let t2 = benchmark("Double ") {
            dr = (a * c - b * d)
            di = (a * d + b * c)
        }

        let t3 = benchmark("Complex") {
            zz = za * zb
        }

        //print(r[n-1], i[n-1])
       // print(dr[n-1], di[n-1])
        //print(zz.real[n-1], zz.imag[n-1])

        //print("Done")
        
        print("%", (t1.median - t2.median) / t2.median * 100)
        print("x", (t1.median / t2.median))
        
        print("%", (t1.median - t3.median) / t3.median * 100)
        print("x", (t1.median / t3.median))
        
        print("")
        print("%", (t2.median - t3.median) / t3.median * 100)
        print("x", (t2.median / t3.median))
    }
    
}
