//
//  DemoTests.swift
//  VecLab
//
//  Created by Marcus Painter on 22/02/2025.
//

import Foundation
import Testing
@testable import VecLab
/*
public typealias Real = Double
public typealias RealArray = [Real]
public typealias Complex = (Real, Real)
public typealias ComplexArray = (RealArray, RealArray)
*/

class DemoTests { }

extension DemoTests {
@Test func test1() {
let a = [1.0, 2.0, 3.0, 4.0]
let b = [5.0, 6.0, 7.0, 8.0]

let c = a + b * 2 - a ** 2 / b

// Result
// [10.800000000000001, 13.333333333333334, 15.714285714285714, 18.000000000000000]

let complex = (10.0, 20.0)

let realPart = complex.0
let imaginaryPart = complex.1

let c1 = 10.0 + 20.0 * Real.i
let c2 = 10.0 + 20.0.i
let c3 = (10.0, 20.0)

let realArray = [1.0, 2.0, 3.0, 4.0]
let imaginaryArray = [5.0, 6.0, 7.0, 8.0]
let complexArray = (realArray, imaginaryArray)

let index = 3
let element = (complexArray.0[index], complexArray.1[index])

// Result
// (4.0, 8.0)

let t1 = [Double](0 ..< 10)
let s1 = [Double](1 ... 10, 2)

let t2 = vector(0 ..< 10)
let s2 = vector(1 ... 10, 2)
    
disp(s2)

let t3 = arange(100)
let s3 = arange(1, 10, 2)

let n = 10
let numbers = vector(0 ..< n)
let evenNumbers = slice(numbers, 0 ..< n, 2)
let oddNumbers = slice(numbers, 1 ..< n, 2)

// disp(evenNumbers)
// disp(oddNumbers)

let order = [4, 5, 6, 7, 0, 1, 2, 3]
let list = gather(numbers, order)

//disp(list)
// Result
// [4.0, 5.0, 6.0, 7.0, 0.0, 1.0, 2.0, 3.0]
    
let ab = cat(a, b)
    
// Result
// [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]


let fs = 48000.0    // Sample rate in Hz
let f = 1000.0      // Frequency in Hz
let N = 1024        // Length in samples

var x1 = [Double](repeating: 0.0, count: N)
for k in 0 ..< N {
let t = Double(k) / fs
    x1[k] = sin(2.0 * .pi * f * t)
}

// Time vector
let t = vector(0 ..< N) / fs
let x2 = sin(2.0 * .pi * f * t)
}
}
