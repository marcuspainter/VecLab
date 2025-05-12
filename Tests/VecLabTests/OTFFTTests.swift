//
//  OTFFTTests.swift
//  VecLab
//
//  Created by Marcus Painter on 12/05/2025.
//

import XCTest
import Foundation
import VecLab

final class OTFFTTests: XCTestCase {
    
    func testExample() throws {
        let r = vector(1...2**14)
        var z1 = ComplexArray(realOnly: r)
        var z2 = ComplexArray(realOnly: r)
        
        tic()
        fft(n: z1.count, x: &z1)
        toc()
    
        tic()
        let Z = fft(z2)
        toc()
        
       // disp(z)
        
      // ifft(n: z.count, x: &z)
      //  disp(z)
    }
    
}

import Foundation

// Assuming Complex type exists
// typealias Complex = Complex<Double>

func fft0(n: Int, s: Int, eo: Bool, x: inout ComplexArray, y: inout ComplexArray) {
    // n  : sequence length
    // s  : stride
    // eo : x is output if eo == false, y is output if eo == true
    // x  : input sequence (or output sequence if eo == false)
    // y  : work area (or output sequence if eo == true)
    
    let m = n/2
    let theta0 = 2.0 * Double.pi / Double(n)
    
    if n == 2 {
        if eo {
            for q in 0..<s {
                let a = x[q + 0]
                let b = x[q + s]
                y[q + 0] = a + b
                y[q + s] = a - b
            }
        } else {
            for q in 0..<s {
                let a = x[q + 0]
                let b = x[q + s]
                x[q + 0] = a + b
                x[q + s] = a - b
            }
        }
    }
    else if n >= 4 {
        for p in 0..<m {
            let wp = Complex(cos(Double(p) * theta0), -sin(Double(p) * theta0))
            for q in 0..<s {
                let a = x[q + s * (p + 0)]
                let b = x[q + s * (p + m)]
                y[q + s * (2 * p + 0)] = a + b
                y[q + s * (2 * p + 1)] = (a - b) * wp
            }
        }
        fft0(n: n/2, s: 2*s, eo: !eo, x: &y, y: &x)
    }
}

func fft(n: Int, x: inout ComplexArray) {
    // n : sequence length
    // x : input/output sequence
    
    var y = ComplexArray(count: x.count)
    
    fft0(n: n, s: 1, eo: false, x: &x, y: &y)
    
    // Normalize the output
   // for k in 0..<n {
   //     x[k] = x[k] / Double(n)
   // }
}

func ifft(n: Int, x: inout ComplexArray) {
    // n : sequence length
    // x : input/output sequence
    
    var y = ComplexArray(count: x.count)
    x = conj(x)
    
    fft0(n: n, s: 1, eo: false, x: &x, y: &y)
    
    x = conj(x)
    
    // Normalize the output
    for k in 0..<n {
        x[k] = x[k] / Double(n)
   }
}
