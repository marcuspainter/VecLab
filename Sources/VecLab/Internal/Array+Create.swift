//
//  Array+Create.swift
//
//
//  Created by Marcus Painter on 16/09/2023.
//

import Foundation

func createRealArray(count: Int ) -> [Double] {
    return [Double](repeating: 0, count: count)
}

func createRealArray(count: Int ) -> [Float] {
    return [Float](repeating: 0, count: count)
}

func createRealArray(sized a: [Double] ) -> [Double] {
    return [Double](repeating: 0, count: a.count)
}

func createRealArray(sized a: [Float] ) -> [Float] {
     return [Float](repeating: 0, count: a.count)
}

func createComplexArray(sized a: ([Double], [Double]) ) -> ([Double], [Double]) {
    let r = [Double](repeating: 0, count: a.0.count)
    let i = [Double](repeating: 0, count: a.0.count)
    return (r, i)
}

func createComplexArray(sized a: ([Float], [Float]) ) -> ([Float], [Float]) {
    let r = [Float](repeating: 0, count: a.0.count)
    let i = [Float](repeating: 0, count: a.0.count)
    return (r, i)
}

func createRealArray(repeating x: Real, count: Int) -> RealArray {
    let r = RealArray(repeating: x, count: count)
    return r
}

func createComplexArray(count: Int) -> ComplexArray {
    return createComplexArray(repeating: (Real(0.0), Real(0.0)), count: count)
 }

func createComplexArray(repeating x: Complex, count: Int) -> ComplexArray {
    let r = RealArray(repeating: x.0, count: count)
    let i = RealArray(repeating: x.1, count: count)
    return (r, i)
}
