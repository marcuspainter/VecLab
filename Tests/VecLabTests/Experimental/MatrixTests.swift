//
//  MatrixTests.swift
//  VecLab
//
//  Created by Marcus Painter on 07/09/2025.
//

import Accelerate
import XCTest
@testable import VecLab

final class MatrixTests: XCTestCase {
    
    func testMatrix() throws {
        let a = Matrix([1, 2, 3, 4], rows: 2, cols: 2)
        let b = Matrix([5, 6, 7, 8], rows: 2, cols: 2)
        
        var c = 10 + b
        
        let z = [Complex](repeating: Complex(2, 2), count: 12)
        let result = z * z
        print(result)
        
        c = a ./ b
        
        let q = MatrixComplex([1.0+1.i, 2.0+2.i, 3.0+3.i, 4.0+4.i], rows: 2, cols: 2)
        var d = q * 10.0
        
        d = q ./ q
        
        let nnn = 100 * 100
        let r = MatrixComplex(real: vector(1...nnn), imag: vector(1...nnn), rows: 100, cols: 100 )
        let s = r ./ r
        
        print(s.grid)
        
        c.grid = rightDivision(a.grid, a.grid, m: a.rows, n: a.cols)
        print(c.grid)
    }
    
}
