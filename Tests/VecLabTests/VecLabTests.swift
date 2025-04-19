import XCTest
import VecLab

final class VecLabTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest
        
        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        
        //var a = ComplexArray(count: 10)
        var a = RealArray(0 ... 9)
        a[0...,2] = a[0..., 2]
        
        print(a[0..., 2])
    }
    
    func testFFT() throws {
        let x = vector(1...2**12)
        let z = ComplexArray(realOnly: x)
        
        tic()
        let X = fft(z)
        toc()
       // disp(X)
        tic()
        let XX = fftx2(z)
        toc()
        print("---")
     //   disp(XX - X)
        
    }
}

public func fftx(_ x: ComplexArray) -> ComplexArray {
    let n = length(x)
    let omega = exp(-2 * Real.pi * 1.i / Real(n))
    if rem(n, 2) == 0 {
        // Recursive divide and conquer.
        let k = vector(0 ... (n / 2 - 1))
        let w = omega ** k
        let u = fftx(slice(x, 0 ..< n - 1, 2))
        let v = w * fftx(slice(x, 1 ..< n, 2))
        return cat(u + v, u - v)
    } else {
        return x
    }
}

public func fftx2(_ x: ComplexArray) -> ComplexArray {
    let n = length(x)
    let omega = exp(-2.i * .pi / Double(n))
    if rem(n, 2) == 0 {
        // Recursive divide and conquer.
        let k = vector(0 ... (n / 2 - 1))
        let w = omega ** k
        let u = fftx2(x[0 ..< n - 1, 2])
        let v = w * fftx2(x[1 ..< n, 2])
        return cat(u + v, u - v)
    } else {
        return x
    }
}
