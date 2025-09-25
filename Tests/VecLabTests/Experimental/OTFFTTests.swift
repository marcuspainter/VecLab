//
//  OTFFTTests.swift
//  VecLab
//
//  Created by Marcus Painter on 12/05/2025.
//

import Foundation
import VecLab
import XCTest

/*
 
 136.000000000000e+000 + 0.00000000000000e+000i
-8.00000000000000e+000 + 40.2187159370068e+000i
-8.00000000000000e+000 + 19.3137084989848e+000i
-8.00000000000000e+000 + 11.9728461013239e+000i
-8.00000000000000e+000 + 8.00000000000000e+000i
-8.00000000000000e+000 + 5.34542910335439e+000i
-8.00000000000000e+000 + 3.31370849898476e+000i
-8.00000000000000e+000 + 1.59129893903727e+000i
-8.00000000000000e+000 + 0.00000000000000e+000i
-8.00000000000000e+000 - 1.59129893903727e+000i
-8.00000000000000e+000 - 3.31370849898476e+000i
-8.00000000000000e+000 - 5.34542910335439e+000i
-8.00000000000000e+000 - 8.00000000000000e+000i
-8.00000000000000e+000 - 11.9728461013239e+000i
-8.00000000000000e+000 - 19.3137084989848e+000i
-8.00000000000000e+000 - 40.2187159370068e+000i
 
 */

typealias XComplexArray = [Complex]

final class OTFFTTests: XCTestCase {
    
        func testExample() throws {
            let n: Int = Int(2**4)
            let r = vector(1...n)
            var s = r
            var z1 = XComplexArray(realOnly: r)
            var z2 = XComplexArray(realOnly: r)
            var Z = XComplexArray(realOnly: r)
            var Z2 = XComplexArray(realOnly: r)
            
            var ss = SplitComplexArray(realOnly: r)
            var zz = SplitComplexArray(count: n)
    
            benchmark {
                //fft(n: z1.count, x: &z1)
                zz = fft(ss)
            }
            //disp(zz)
    
            benchmark {
                //Z = fft(z2)
                Z = fft(z1)
            }
            disp(Z)
            
            benchmark {
                z2 = ifft(Z)
            }
            disp(z2)
    
            benchmark {
                ifft(n: Z.count, x: &Z)
            }
            disp(r)
        }
    /*
     Elapsed time: 0.167159417 seconds (167.159417 ms)
     Elapsed time: 0.002971917 seconds (2.971917 ms)
     Elapsed time: 0.000362208 seconds (0.362208 ms)
     Elapsed time: 0.178409708 seconds (178.409708 ms)
     */
}

// Assuming Complex type exists
// typealias Complex = Complex<Double>

func fft0(n: Int, s: Int, eo: Bool, x: inout XComplexArray, y: inout XComplexArray) {
    // n  : sequence length
    // s  : stride
    // eo : x is output if eo == false, y is output if eo == true
    // x  : input sequence (or output sequence if eo == false)
    // y  : work area (or output sequence if eo == true)

    let m = n / 2
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
    } else if n >= 4 {
        for p in 0..<m {
            let wp = Complex(cos(Double(p) * theta0), -sin(Double(p) * theta0))
            for q in 0..<s {
                let a = x[q + s * (p + 0)]
                let b = x[q + s * (p + m)]
                y[q + s * (2 * p + 0)] = a + b
                y[q + s * (2 * p + 1)] = (a - b) * wp
            }
        }
        fft0(n: n / 2, s: 2 * s, eo: !eo, x: &y, y: &x)
    }
}

func fft(n: Int, x: inout XComplexArray) {
    // n : sequence length
    // x : input/output sequence

    var y = XComplexArray(count: x.count)

    fft0(n: n, s: 1, eo: false, x: &x, y: &y)

    // Normalize the output
    // for k in 0..<n {
    //     x[k] = x[k] / Double(n)
    // }
}

func ifft(n: Int, x: inout XComplexArray) {
    // n : sequence length
    // x : input/output sequence

    var y = XComplexArray(count: x.count)
    x = conj(x)

    fft0(n: n, s: 1, eo: false, x: &x, y: &y)

    x = conj(x)

    // Normalize the output
    for k in 0..<n {
        x[k] = x[k] / Double(n)
    }
}

