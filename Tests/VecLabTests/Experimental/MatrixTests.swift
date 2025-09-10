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
        let a = Matrix([1, 2, 3, 4], 2, 2)
        let b = Matrix([5, 6, 7, 8], 2, 2)
        
        let f = Matrix([[1,2,3],
                        [4,5,6],
                        [7,8,9]])
        
        var c = 10 + b
        
        let z = [Complex](repeating: Complex(2, 2), count: 12)
        let result = z * z
        print(result)
        
        c = a ./ b
        
        let q = MatrixComplex([1.0+1.i, 2.0+2.i, 3.0+3.i, 4.0+4.i], 2, 2)
        var d = q * 10.0
        
        d = q ./ q
        
        let nnn = 100 * 100
        let r = MatrixComplex(real: vector(1...nnn), imag: vector(1...nnn), rows: 100, cols: 100 )
        let s = (r + r).H
        
        print(s.grid)
        
        let t = r * r
        
        c.grid = rightDivision(a.grid, a.grid, m: a.rows, n: a.cols)
        print(c.grid)
        
        var m = Double(1)
        m += m
        m -= m
        m *= m
        
        var double = 2.0
        
        // MARK: [Double]

        var arrayDouble = [Double](count: 10)
        arrayDouble = arrayDouble + arrayDouble
        arrayDouble = arrayDouble - arrayDouble
        arrayDouble = arrayDouble * arrayDouble
        arrayDouble = arrayDouble / arrayDouble
        arrayDouble += arrayDouble
        arrayDouble -= arrayDouble
        arrayDouble *= arrayDouble
        arrayDouble /= arrayDouble
        
        // Double
        arrayDouble = arrayDouble + double
        arrayDouble = double + arrayDouble
        arrayDouble = arrayDouble - double
        arrayDouble = double - arrayDouble
        arrayDouble = arrayDouble * double
        arrayDouble = double * arrayDouble
        arrayDouble = arrayDouble / double
        arrayDouble = double / arrayDouble
        
        arrayDouble += double
        arrayDouble -= double
        arrayDouble *= double
        arrayDouble /= double
        
        // MARK: Complex
        
        var complex = Complex(1,2) // (real, imag)
        complex = complex + complex
        complex = complex - complex
        complex = complex * complex
        complex = complex / complex
        complex += complex
        complex -= complex
        complex *= complex
        complex /= complex
        
        complex = complex + double
        complex = double + complex
        complex = complex - double
        complex = double - complex
        complex = complex * double
        complex = double * complex
        complex = complex / double
        complex = double / complex
        
        complex += double
        complex -= double
        complex *= double
        complex /= double
        
        //complex = complex + arrayDouble
        //complex = arrayDouble + complex
        //complex = complex - arrayDouble
        //complex = arrayDouble - complex
        //complex = complex * arrayDouble
        //complex = arrayDouble * complex
        //complex = complex / arrayDouble
        //complex = arrayDouble / complex
        
        
        // Not valid
       // complex += arrayDouble
        //complex -= arrayDouble
       // complex *= arrayDouble
        //complex /= arrayDouble
        
        // MARK: [Complex]
    
        var arrayComplex = [Complex](repeating: Complex(1,1), count: 10)
        arrayComplex = arrayComplex + arrayComplex
        arrayComplex = arrayComplex - arrayComplex
        arrayComplex = arrayComplex * arrayComplex
        arrayComplex = arrayComplex / arrayComplex
        arrayComplex += arrayComplex
        arrayComplex -= arrayComplex
        arrayComplex *= arrayComplex
        arrayComplex /= arrayComplex
        
        arrayComplex = arrayComplex + arrayComplex
        arrayComplex = arrayComplex - arrayComplex
        arrayComplex = arrayComplex * arrayComplex
        arrayComplex = arrayComplex / arrayComplex
        arrayComplex += arrayComplex
        arrayComplex -= arrayComplex
        arrayComplex *= arrayComplex
        arrayComplex /= arrayComplex
        
        // Double
        arrayComplex = arrayComplex + double
        arrayComplex = double + arrayComplex
        arrayComplex = arrayComplex - double
        arrayComplex = double - arrayComplex
        arrayComplex = arrayComplex * double
        arrayComplex = double * arrayComplex
        arrayComplex = arrayComplex / double
        arrayComplex = double / arrayComplex
        
        // [Double]
        arrayComplex = arrayComplex + arrayDouble
        arrayComplex = arrayDouble + arrayComplex
        arrayComplex = arrayComplex - arrayDouble
        arrayComplex = arrayDouble - arrayComplex
        arrayComplex = arrayComplex * arrayDouble
        arrayComplex = arrayDouble * arrayComplex
        arrayComplex = arrayComplex / arrayDouble
        arrayComplex = arrayDouble / arrayComplex
        
        // MARK: Matrix
        
        var matrix = Matrix(5,5)
        matrix = matrix + matrix
        matrix = matrix - matrix
        matrix = matrix * matrix
        matrix = matrix .* matrix
        //matrix = matrix / matrix
        matrix = matrix ./ matrix
        
        matrix += matrix
        matrix -= matrix
        matrix *= matrix
        // matrix /= matrix
        
        matrix = matrix + double
        matrix = double + matrix
        matrix = matrix - double
        matrix = double - matrix
        matrix = matrix * double
        matrix = double * matrix
        matrix = matrix / double
        matrix = double / matrix
        
        matrix += double
        matrix -= double
        matrix *= double
        
        // [Double] is not valid
        //matrix = matrix + arrayDouble
        //matrix = arrayDouble + matrix
        //matrix = matrix - arrayDouble
        //matrix = arrayDouble - matrix
        //matrix = matrix * arrayDouble
        //matrix = arrayDouble * matrix
        //matrix = matrix / arrayDouble
        //matrix = arrayDouble / matrix
     
        var matrixComplex = MatrixComplex(5,5)

        matrixComplex = matrixComplex + matrixComplex
        matrixComplex = matrixComplex - matrixComplex
        matrixComplex = matrixComplex * matrixComplex
        matrixComplex = matrixComplex .* matrixComplex
        //matrixComplex = matrixComplex / matrixComplex
        matrixComplex = matrixComplex ./ matrixComplex
        
        matrixComplex += matrixComplex
        matrixComplex -= matrixComplex
        matrixComplex *= matrixComplex
        matrixComplex .*= matrixComplex
        //matrixComplex /= matrixComplex
        matrixComplex ./= matrixComplex
        
        //  Double
        matrixComplex = matrixComplex + double
        matrixComplex = double + matrixComplex
        matrixComplex = matrixComplex - double
        matrixComplex = double - matrixComplex
        matrixComplex = matrixComplex * double
        matrixComplex = double * matrixComplex
        matrixComplex = matrixComplex / double
        matrixComplex = double / matrixComplex
        
        //  Complex
        matrixComplex = matrixComplex + complex
        matrixComplex = complex + matrixComplex
        matrixComplex = matrixComplex - complex
        matrixComplex = complex - matrixComplex
        matrixComplex = matrixComplex * complex
        matrixComplex = complex * matrixComplex
        matrixComplex = matrixComplex / complex
        matrixComplex = complex / matrixComplex
    }
    
    func test3() {
        let double = 2.0
        
        // MARK: [Double]
        
        let n = 5
        var arrayDouble: [Double] = [1,2,3,4,5]
        arrayDouble = arrayDouble + arrayDouble
        arrayDouble = arrayDouble - arrayDouble
        arrayDouble = arrayDouble * arrayDouble
        arrayDouble = arrayDouble / arrayDouble
        arrayDouble += arrayDouble
        arrayDouble -= arrayDouble
        arrayDouble *= arrayDouble
        arrayDouble /= arrayDouble
        
        // Double
        arrayDouble = arrayDouble + double
        arrayDouble = double + arrayDouble
        arrayDouble = arrayDouble - double
        arrayDouble = double - arrayDouble
        arrayDouble = arrayDouble * double
        arrayDouble = double * arrayDouble
        arrayDouble = arrayDouble / double
        arrayDouble = double / arrayDouble
        
        arrayDouble += double
        arrayDouble -= double
        arrayDouble *= double
        arrayDouble /= double
        
        // MARK: Complex
        
        var complex = Complex(1,2) // (real, imag)
        complex = complex + complex
        complex = complex - complex
        complex = complex * complex
        complex = complex / complex
        complex += complex
        complex -= complex
        complex *= complex
        complex /= complex
        
        complex = complex + double
        complex = double + complex
        complex = complex - double
        complex = double - complex
        complex = complex * double
        complex = double * complex
        complex = complex / double
        complex = double / complex
        
        complex += double
        complex -= double
        complex *= double
        complex /= double
        
        //complex = complex + arrayDouble
        //complex = arrayDouble + complex
        //complex = complex - arrayDouble
        //complex = arrayDouble - complex
        //complex = complex * arrayDouble
        //complex = arrayDouble * complex
        //complex = complex / arrayDouble
        //complex = arrayDouble / complex
        
        
        // Not valid
        // complex += arrayDouble
        //complex -= arrayDouble
        // complex *= arrayDouble
        //complex /= arrayDouble
        
        // MARK: [Complex]
        
        var arrayComplex: [Complex] = [1.0+2.i, 3.0+4.i, 5.0+6.i, 7.0+8.i, 9.0+10.i] // Expand
        arrayComplex = arrayComplex + arrayComplex
        arrayComplex = arrayComplex - arrayComplex
        arrayComplex = arrayComplex * arrayComplex
        arrayComplex = arrayComplex / arrayComplex
        arrayComplex += arrayComplex
        arrayComplex -= arrayComplex
        arrayComplex *= arrayComplex
        arrayComplex /= arrayComplex
        
        arrayComplex = arrayComplex + arrayComplex
        arrayComplex = arrayComplex - arrayComplex
        arrayComplex = arrayComplex * arrayComplex
        arrayComplex = arrayComplex / arrayComplex
        arrayComplex += arrayComplex
        arrayComplex -= arrayComplex
        arrayComplex *= arrayComplex
        arrayComplex /= arrayComplex
        
        // Double
        arrayComplex = arrayComplex + double
        arrayComplex = double + arrayComplex
        arrayComplex = arrayComplex - double
        arrayComplex = double - arrayComplex
        arrayComplex = arrayComplex * double
        arrayComplex = double * arrayComplex
        arrayComplex = arrayComplex / double
        arrayComplex = double / arrayComplex
        
        // [Double]
        arrayComplex = arrayComplex + arrayDouble
        arrayComplex = arrayDouble + arrayComplex
        arrayComplex = arrayComplex - arrayDouble
        arrayComplex = arrayDouble - arrayComplex
        arrayComplex = arrayComplex * arrayDouble
        arrayComplex = arrayDouble * arrayComplex
        arrayComplex = arrayComplex / arrayDouble
        arrayComplex = arrayDouble / arrayComplex
        
        // MARK: Matrix
        
        // Row-major
        let gridDouble = cat(arrayDouble, arrayDouble, arrayDouble, arrayDouble, arrayDouble)
        
        var matrix = Matrix(gridDouble, 5,5)
        matrix = matrix + matrix
        matrix = matrix - matrix
        matrix = matrix * matrix
        matrix = matrix .* matrix
        //matrix = matrix / matrix
        matrix = matrix ./ matrix
        
        matrix += matrix
        matrix -= matrix
        matrix *= matrix
        // matrix /= matrix
        
        matrix = matrix + double
        matrix = double + matrix
        matrix = matrix - double
        matrix = double - matrix
        matrix = matrix * double
        matrix = double * matrix
        matrix = matrix / double
        matrix = double / matrix
        
        matrix += double
        matrix -= double
        matrix *= double
        
        // [Double] is not valid
        //matrix = matrix + arrayDouble
        //matrix = arrayDouble + matrix
        //matrix = matrix - arrayDouble
        //matrix = arrayDouble - matrix
        //matrix = matrix * arrayDouble
        //matrix = arrayDouble * matrix
        //matrix = matrix / arrayDouble
        //matrix = arrayDouble / matrix
        
        // Row-major
        var gridComplex: [Complex] = []
        gridComplex.append(contentsOf: arrayComplex)
        gridComplex.append(contentsOf: arrayComplex)
        gridComplex.append(contentsOf: arrayComplex)
        gridComplex.append(contentsOf: arrayComplex)
        gridComplex.append(contentsOf: arrayComplex)
        
        var matrixComplex = MatrixComplex(gridComplex,5,5)

        matrixComplex = matrixComplex + matrixComplex
        matrixComplex = matrixComplex - matrixComplex
        matrixComplex = matrixComplex * matrixComplex
        matrixComplex = matrixComplex .* matrixComplex
        //matrixComplex = matrixComplex / matrixComplex
        matrixComplex = matrixComplex ./ matrixComplex
        
        matrixComplex += matrixComplex
        matrixComplex -= matrixComplex
        matrixComplex *= matrixComplex
        matrixComplex .*= matrixComplex
        //matrixComplex /= matrixComplex
        matrixComplex ./= matrixComplex
        
        //  Double
        matrixComplex = matrixComplex + double
        matrixComplex = double + matrixComplex
        matrixComplex = matrixComplex - double
        matrixComplex = double - matrixComplex
        matrixComplex = matrixComplex * double
        matrixComplex = double * matrixComplex
        matrixComplex = matrixComplex / double
        matrixComplex = double / matrixComplex
        
        //  Complex
        matrixComplex = matrixComplex + complex
        matrixComplex = complex + matrixComplex
        matrixComplex = matrixComplex - complex
        matrixComplex = complex - matrixComplex
        matrixComplex = matrixComplex * complex
        matrixComplex = complex * matrixComplex
        matrixComplex = matrixComplex / complex
        matrixComplex = complex / matrixComplex
    }
    
    
}
