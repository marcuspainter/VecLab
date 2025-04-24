import XCTest
import VecLab
import Accelerate

final class VecLabTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest
        
        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        
        //var a = ComplexArray(count: 10)
        var a: [Double] = [1,2,3,4,5]
        
        let qqq = a + 1.0
        
        let z = Complex(1,2)
        
        print("Type \(type(of: z)) is Numeric \(z is (any Numeric) ? "Yes" : "No") !")
        
        let v1 = VectorComplex(real: [1,2,3], imag: [1,2,3])
        let v2 = VectorComplex(real: [4,5,6], imag: [4,5,6])
        
        let vv = v1 + v2
        print(vv.asArray())
        
        var b1 = DoubleBlock([1,2,3,4,5])
        var b2 = DoubleBlock([6,7,8,9,10])
        
        b1.add(b1).add(b2).add(b1)
        
        print(b1.asArray)

    }
    
    func testFFT() throws {
        let x = vector(1...2**12)
        let z = ComplexArray(realOnly: x)
        
        tic()
        let X = fft(z)
        toc()
        //disp(X)
        tic()
        let XX = fftx2(z)
        toc()
        print("---")
       //disp(XX)
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

public func fftx2(_ x: [Double]) -> ComplexArray {
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
        return ComplexArray(realOnly: x)
    }
}
