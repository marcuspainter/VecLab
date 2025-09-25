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
        
        let q = ComplexMatrix([1.0+1.i, 2.0+2.i, 3.0+3.i, 4.0+4.i], 2, 2)
        var d = q * 10.0
        
        d = q ./ q
        
        let nnn = 100 * 100
        let r = ComplexMatrix(real: vector(1...nnn), imag: vector(1...nnn), rows: 100, cols: 100 )
        let s = (r + r).H
        
        print(s.data)
        
        let t = r * r
  
   //     c.data = rightDivision(a.data, a.data, m: a.rows, n: a.cols)
    //    print(c.data)
        
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
     
        var matrixComplex = ComplexMatrix(5,5)

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
        let dataDouble = cat(arrayDouble, arrayDouble, arrayDouble, arrayDouble, arrayDouble)
        
        var matrix = Matrix(dataDouble, 5,5)
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
        var dataComplex: [Complex] = []
        dataComplex.append(contentsOf: arrayComplex)
        dataComplex.append(contentsOf: arrayComplex)
        dataComplex.append(contentsOf: arrayComplex)
        dataComplex.append(contentsOf: arrayComplex)
        dataComplex.append(contentsOf: arrayComplex)
        
        var matrixComplex = ComplexMatrix(dataComplex,5,5)

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
    
    func testMat() {
        let a = Matrix([[1,2],
                        [3,4]])
        let b = Matrix([[5,6],
                        [7,8]])
                
        var data: [Complex] = [1.0+2.i, 3.0+4.i,
                               5.0+6.i, 7.0+8.i]
        
        let z = ComplexMatrix(data, 2, 2)
        
        //let c = a * b - a .* b ./ a
        
        let f = (a * b)
        let c = f - a
        
        let zz = z * z
        
        //print(zz.data)
        
        let d = det(b.data, n: 2)
        
        print("det: \(d)")
    }
    
    func testOrder() {
    
        
        var r: [Double] = [1, 2, 3,
                          4, 5, 6]
   //     var c = rowMajorToColumnMajor(r, rows: 2, cols: 3)
    //    print(r)
    //    print(c)
        
   //     r = columnMajorToRowMajor(c, rows: 2, cols: 3)
   //     print(r)
        
  //      c = transposeMatrix(r, rows: 2, cols: 3)
   //     print(c)
    }
    
    func testArrayLiteral() {
        let a: Matrix = [[1],[2],[3]]
        print(a)
    }
    
    func testDet() {
        let a: Matrix = [[1,2],[3,4]]
        let d = det(a)
        print(d)
    }
    
    func testEye() {
        let i = eye(4)
        let b: Matrix = [[1,2,3,4],
                 [5,6,7,8],
                 [9,10,11,12],
                 [13,14,15,16]]
        let c = b.T.T
        disp(b)
        print(c)
        
    }
    
    func testDiag() {
        let b: Matrix = [[1,2,3,4],
                 [5,6,7,8],
                 [9,10,11,12],
                 [13,14,15,16]]
        let c = diag(b)
        disp(b)
        disp(c)
        
        let t = trace(b)
        disp(t)
    }
    
    func testSvd() {
        let b: Matrix = [[1, 0, 1],[ -1, -2, 0],[0, 1, -1]]
        let a: Matrix = [[1, 2], [3, 4], [5,6],[7, 8]]
        let (u,s,v) = MatrixOp.svd(a: a.data, rows: a.rows, columns: a.cols)
        
        let U = Matrix(rows: a.rows, cols: a.rows, data: u)
        let S = Matrix(rows: a.cols, cols: 1, data: s)
        let V = Matrix(rows: a.cols, cols: a.cols, data: v)
        
        disp(b)
        disp(U)
        disp(S)
        disp(V.T.debugDescription)
        disp(eye(5).debugDescription)
        
        
    }
    
    func testFormat() { // Test floating point numbers
        let floatTests = [
            "[1.5 2.7; 3.14 4.0]",        // Basic decimals
            "[1.0, 2.5;   3.14159, 4.7]",   // Mixed with commas
            "[-1.5 2.7; -3.14 4.0]",      // Negative numbers
            "[1e-3 2.5e2; 0.001 250.0]",  // Scientific notation
            "[.5 2.; 3. 4.5]",            // Leading/trailing decimal points
        ]
        
        for test in floatTests {
            if let result = parseMatrix(test) {
                print("\(test)")
                print("→ \(result)")
                print()
            } else {
                print("\(test) → INVALID")
            }
        }

    
    }
    
    func testOutput() {
     
        // Test with tabs
        let tabSeparated = """
        -0.1525 -0.8226 -0.3945  \t -0.3800
        -0.3499   -0.4214    0.000    0.8007
        -0.5474   -0.0201    0.6979   -0.4614
        -0.7448    0.3812   -0.5462    0.0407
        """

        let mixedSeparators = """
          -0.1525,  \t  -0.8226   -0.3945,    1234567890.0000
           -0.3499    0.0,    0.2428   0.8007
        """
        
        let a: Matrix =
                """
                  -0.1525,  -0.8226   -0.3945,  1234567890.0000
                   -0.3499    0.0,    0.2428   0.8007
                """
        
        disp(a)
        
        /*

        print("Tab-separated:")
        if let matrix = parseMatrixOutput(tabSeparated) {
            for row in matrix {
                print("  \(row)")
            }
        }

        print("\nMixed separators (spaces, tabs, commas):")
        if let matrix = parseMatrixOutput(mixedSeparators) {
            //for row in matrix {
            //    print("  \(row)")
           // }
            
            let q = Matrix(matrix)
            print(q)
        }

        */

    }
}

