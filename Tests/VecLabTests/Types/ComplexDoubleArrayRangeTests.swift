//
//  ComplexDoubleArrayRangeTests.swift
//  VecLab
//
//  Created by Marcus Painter on 20/04/2025.
//

import VecLab // Replace with your actual module name
import XCTest

final class ComplexDoubleArrayRangeTests: XCTestCase {
    // Test initialization
    func testSubscriptRange() throws {
        let aa = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
        var a = aa
        let b = [7.0, 7.0, 7.0, 7.0]

        let cc = ComplexArray(a, a)
        var c = cc
        let d = ComplexArray(b, b)

        let m = 1
        let n = 2

        a = aa
        a[1 ..< 3] = b[1 ..< 3]
        print(a)

        a = aa
        a[0 ... 2] = b[1 ... 3]
        print(a)

        a = aa
        a[1 ..< 3] = b[1 ..< 3]
        print(a)

        a = aa
        a[...2] = b[...3]
        print(a)

        a = aa
        a[2...] = b[2...]
        print(a)

        a = aa
        let ix = [3, 1, 2, 0]
        a = aa[ix]
        print(a)

        //

        c = cc
        c[1 ..< 3] = d[1 ..< 3]
        print(c)

        c = cc
        c[0 ... 2] = d[1 ... 3]
        print(c)

        c = cc
        c[1 ..< 3] = d[1 ..< 3]
        print(c)

        c = cc
        c[...2] = d[...3]
        print(c)

        c = cc
        c[2...] = d[2...]
        print(c)

        c = cc
        c = cc[ix]
        print(c)
        
        var z = c.imag[0]
        z = c[0].imag
        c[0].imag = 1

        //

        a = aa
        a = a[2 ..< 7, 2]
        print(a)
        
        let p = [1,2]
        let q = [3,4]
        let r = [Int]([1,2]) + [Int]([3,4])
    
        print(p + q) // Adds
        print(r)
        print([1,2] + [3,4]) // Concatenates
        print([1.0,2.0] + [3.0,4.0]) // Adds
        
        print(type(of: [1,2]))
        
        var t: [Int] = [1,2,3,4,5,6,7]
        let idx: [Int] = [3,2,1,0]

        let v = cc.reversed()
        v.forEach { print($0) }
        
        cc.forEach { print($0) }
        

        
    }
}
