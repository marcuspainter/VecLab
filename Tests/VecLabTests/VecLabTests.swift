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
        let a: [Double] = [1,2,3,4,5]
        let b: [Double] = [1,2,3,4,5]
        
        _ = a + 1.0
        
        _ = Complex(1,2)
        
        //print("Type \(type(of: z)) is Numeric \(z is (any Numeric) ? "Yes" : "No") !")
        
        a.forEach { print($0) }
        
        let zz = ComplexArray(a,b)
        let zzz = zz.enumerated()
        let ttt = zzz.map { Real($0) + $1 }
        print(ttt)
        print(type(of:ttt))
        
        let zzzzz = iterate(zz, { Double($0) + $1 } )
        print(zzzzz)

        let zzzz = zz.enumerated().map { Double($0) + $1 }
        print(zzzz)
        
        let f = zip(zz, zz).map { $0 + $1 }
        
        for w in zz {
            print("Go", w)
        }
        
        print(f)
        print(type(of:f))
        
        let h = zip(zz, zz)
        //let h = zz.enumerated()
        
        let r = h.enumerated().filter { $0.offset == 1 }
        print(r)
        
        let _ = zz.enumerated().map { (index, value) in Real(index) + value }
        let _ = zz.enumerated().map { index, value in Real(index) + value }
                
        for (i,v) in h {
            print("Hello",i,v)
        }
        
        let g = zz.reduce(0, +)
        print(g)
        
    }
    
    func testFFT() throws {
        let x = vector(1...2**12)
        let z = ComplexArray(realOnly: x)
        
        tic()
        _ = fft(z)
        toc()
        //disp(X)
        tic()
        _ = fftx2(z)
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
