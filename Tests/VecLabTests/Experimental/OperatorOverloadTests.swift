import XCTest
import VecLab

class OperatorOverloadTests: XCTestCase {
    
    let tolerance = 1e-14
    
    // MARK: - [Double] Tests
    
    func testDoubleArrayArithmetic() {
        var arrayA: [Double] = [1.5, 2.7, 3.9, 4.2, 5.8]
        let arrayB: [Double] = [0.5, 1.3, 2.1, 1.8, 2.2]
        let scalar = 3.14
        
        // Array + Array
        let sumResult = arrayA + arrayB
        XCTAssertEqual(sumResult, [2.0, 4.0, 6.0, 6.0, 8.0], accuracy: tolerance)
        
        let diffResult = arrayA - arrayB
        XCTAssertEqual(diffResult, [1.0, 1.4, 1.8, 2.4, 3.6], accuracy: tolerance)
        
        let productResult = arrayA * arrayB
        XCTAssertEqual(productResult, [0.75, 3.51, 8.19, 7.56, 12.76], accuracy: tolerance)
        
        let divisionResult = arrayA / arrayB
        XCTAssertEqual(divisionResult, [
            3.0,
            2.076923076923077,
            1.8571428571428572,
            2.3333333333333335,
            2.6363636363636362
        ], accuracy: tolerance)
        
        // Compound assignment (array vs array)
        arrayA += arrayB
        XCTAssertEqual(arrayA, [2.0, 4.0, 6.0, 6.0, 8.0], accuracy: tolerance)
        
        arrayA -= arrayB
        XCTAssertEqual(arrayA, [1.5, 2.7, 3.9, 4.2, 5.8], accuracy: tolerance)
        
        arrayA *= arrayB
        XCTAssertEqual(arrayA, [0.75, 3.51, 8.19, 7.56, 12.76], accuracy: tolerance)
        
        // Reset for division test
        arrayA = [1.5, 2.7, 3.9, 4.2, 5.8]
        arrayA /= arrayB
        XCTAssertEqual(arrayA, [
            3.0,
            2.076923076923077,
            1.8571428571428572,
            2.3333333333333335,
            2.6363636363636362
        ], accuracy: tolerance)
        
        // Array + Scalar operations (now tested from fresh base each time for numerical stability)
        // Add
        arrayA = [1.5, 2.7, 3.9, 4.2, 5.8]
        arrayA += scalar
        XCTAssertEqual(arrayA, [
            4.640000000000001, // 1.5 + 3.14 -> tiny fp artifact
            5.84,
            7.04,
            7.34,
            8.94
        ], accuracy: tolerance)
        
        // Subtract
        arrayA = [1.5, 2.7, 3.9, 4.2, 5.8]
        arrayA -= scalar
        XCTAssertEqual(arrayA, [
            -1.6400000000000001,
            -0.43999999999999995,
            0.7599999999999998,
            1.06,
            2.6599999999999997
        ], accuracy: tolerance)
        
        // Multiply
        arrayA = [1.5, 2.7, 3.9, 4.2, 5.8]
        arrayA *= scalar
        XCTAssertEqual(arrayA, [
            4.71,
            8.478000000000002,
            12.246,
            13.188,
            18.212
        ], accuracy: tolerance)
        
        // Divide
        arrayA = [1.5, 2.7, 3.9, 4.2, 5.8]
        arrayA /= scalar
        XCTAssertEqual(arrayA, [
            0.47770700636942676,
            0.8598726114649682,
            1.2420382165605095,
            1.3375796178343948,
            1.8471337579617833
        ], accuracy: tolerance)
        
        // Also test the non-mutating scalar operations
        arrayA = [1.5, 2.7, 3.9, 4.2, 5.8]
        let arrayPlusScalar = arrayA + scalar
        XCTAssertEqual(arrayPlusScalar, [
            4.640000000000001,
            5.84,
            7.04,
            7.34,
            8.94
        ], accuracy: tolerance)
        
        let scalarPlusArray = scalar + arrayA
        XCTAssertEqual(scalarPlusArray, [
            4.640000000000001,
            5.84,
            7.04,
            7.34,
            8.94
        ], accuracy: tolerance)
        
        let arrayMinusScalar = arrayA - scalar
        XCTAssertEqual(arrayMinusScalar, [
            -1.6400000000000001,
            -0.43999999999999995,
            0.7599999999999998,
            1.06,
            2.6599999999999997
        ], accuracy: tolerance)
        
        let scalarMinusArray = scalar - arrayA
        XCTAssertEqual(scalarMinusArray, [
            1.6400000000000001,
            0.43999999999999995,
            -0.7599999999999998,
            -1.06,
            -2.6599999999999997
        ], accuracy: tolerance)
    }
    
    // MARK: - Complex Tests
    
    func testComplexArithmetic() {
        var complexA = Complex(2.5, 1.7)  // 2.5 + 1.7i
        let complexB = Complex(1.3, -0.8) // 1.3 - 0.8i
        let scalar = 2.5

        // Difference: (2.5-1.3, 1.7-(-0.8)) = (1.2, 2.5)
        let complexDiff = complexA - complexB
        XCTAssertEqual(complexDiff, Complex(1.2, 2.5), accuracy: tolerance)

        // Product: (2.5+1.7i)*(1.3-0.8i)
        // real = 2.5*1.3 - 1.7*(-0.8) = 4.61
        // imag = 2.5*(-0.8) + 1.7*1.3 = 0.21 (represented as 0.20999999999999996 in double)
        let complexProduct = complexA * complexB
        XCTAssertEqual(complexProduct, Complex(4.61, 0.20999999999999996), accuracy: tolerance)

        // Compound addition
        complexA += complexB
        XCTAssertEqual(complexA, Complex(3.8, 0.9), accuracy: tolerance)

        // Reset and scalar ops
        complexA = Complex(2.5, 1.7)
        let complexPlusScalar = complexA + scalar
        XCTAssertEqual(complexPlusScalar, Complex(5.0, 1.7), accuracy: tolerance)

        let scalarPlusComplex = scalar + complexA
        XCTAssertEqual(scalarPlusComplex, Complex(5.0, 1.7), accuracy: tolerance)

        let complexTimesScalar = complexA * scalar
        XCTAssertEqual(complexTimesScalar, Complex(6.25, 4.25), accuracy: tolerance)

        // Compound scalar ops (in-place)
        complexA += scalar
        XCTAssertEqual(complexA, Complex(5.0, 1.7), accuracy: tolerance)

        complexA -= scalar
        XCTAssertEqual(complexA, Complex(2.5, 1.7), accuracy: tolerance)

        complexA *= scalar
        XCTAssertEqual(complexA, Complex(6.25, 4.25), accuracy: tolerance)

        complexA /= scalar
        XCTAssertEqual(complexA, Complex(2.5, 1.7), accuracy: tolerance)
    }
    
    // MARK: - [Complex] Tests
    
    func testSplitComplexArrayArithmetic() {
        var arrayComplexA: [Complex] = [
            Complex(1.0, 2.0),
            Complex(3.0, -1.0),
            Complex(-2.0, 4.0),
            Complex(0.5, -3.0)
        ]
        
        let arrayComplexB: [Complex] = [
            Complex(2.0, -1.0),
            Complex(1.0, 2.0),
            Complex(3.0, 1.0),
            Complex(-1.0, 2.0)
        ]
        
        let arrayDouble: [Double] = [2.0, 1.5, 0.5, 3.0]
        let scalar = 1.5
        
        let SplitComplexArraySum = arrayComplexA + arrayComplexB
        XCTAssertEqual(SplitComplexArraySum, [
            Complex(3.0, 1.0),
            Complex(4.0, 1.0),
            Complex(1.0, 5.0),
            Complex(-0.5, -1.0)
        ], accuracy: tolerance)
        
        let SplitComplexArrayDiff = arrayComplexA - arrayComplexB
        XCTAssertEqual(SplitComplexArrayDiff, [
            Complex(-1.0, 3.0),
            Complex(2.0, -3.0),
            Complex(-5.0, 3.0),
            Complex(1.5, -5.0)
        ], accuracy: tolerance)
        
        arrayComplexA += arrayComplexB
        XCTAssertEqual(arrayComplexA, [
            Complex(3.0, 1.0),
            Complex(4.0, 1.0),
            Complex(1.0, 5.0),
            Complex(-0.5, -1.0)
        ], accuracy: tolerance)
        
        arrayComplexA = [
            Complex(1.0, 2.0),
            Complex(3.0, -1.0),
            Complex(-2.0, 4.0),
            Complex(0.5, -3.0)
        ]
        
        let SplitComplexArrayPlusScalar = arrayComplexA + scalar
        XCTAssertEqual(SplitComplexArrayPlusScalar, [
            Complex(2.5, 2.0),
            Complex(4.5, -1.0),
            Complex(-0.5, 4.0),
            Complex(2.0, -3.0)
        ], accuracy: tolerance)
        
        let SplitComplexArrayPlusDoubleArray = arrayComplexA + arrayDouble
        XCTAssertEqual(SplitComplexArrayPlusDoubleArray, [
            Complex(3.0, 2.0),
            Complex(4.5, -1.0),
            Complex(-1.5, 4.0),
            Complex(3.5, -3.0)
        ], accuracy: tolerance)
        
        let doubleArrayPlusSplitComplexArray = arrayDouble + arrayComplexA
        XCTAssertEqual(doubleArrayPlusSplitComplexArray, [
            Complex(3.0, 2.0),
            Complex(4.5, -1.0),
            Complex(-1.5, 4.0),
            Complex(3.5, -3.0)
        ], accuracy: tolerance)
    }
    
    // MARK: - Matrix Tests
    
    func testMatrixArithmetic() {
        let gridA: [Double] = [1,2,3, 4,5,6, 7,8,9]
        let gridB: [Double] = [9,8,7, 6,5,4, 3,2,1]
        
        var matrixA = Matrix(gridA, 3, 3)
        let matrixB = Matrix(gridB, 3, 3)
        let scalar = 2.0
        
        let matrixSum = matrixA + matrixB
        XCTAssertEqual(matrixSum.grid, Array(repeating: 10.0, count: 9), accuracy: tolerance)
        
        let matrixDiff = matrixA - matrixB
        XCTAssertEqual(matrixDiff.grid, [-8,-6,-4,-2,0,2,4,6,8], accuracy: tolerance)
        
        let matrixElementWiseProduct = matrixA .* matrixB
        XCTAssertEqual(matrixElementWiseProduct.grid, [9,16,21,24,25,24,21,16,9], accuracy: tolerance)
        
        let matrixElementWiseDivision = matrixA ./ matrixB
        XCTAssertEqual(matrixElementWiseDivision.grid, [Double]([1.0/9.0, 2.0/8.0, 3.0/7.0, 4.0/6.0, 1.0, 6.0/4.0, 7.0/3.0, 8.0/2.0, 9.0/1.0]), accuracy: tolerance)
        
        let matrixProduct = matrixA * matrixB
        XCTAssertEqual(matrixProduct.grid, [30,24,18, 84,69,54, 138,114,90], accuracy: tolerance)
        
        matrixA += matrixB
        XCTAssertEqual(matrixA.grid, Array(repeating: 10.0, count: 9), accuracy: tolerance)
        
        matrixA = Matrix(gridA, 3, 3)
        let matrixPlusScalar = matrixA + scalar
        XCTAssertEqual(matrixPlusScalar.grid, [3,4,5,6,7,8,9,10,11], accuracy: tolerance)
        
        let scalarPlusMatrix = scalar + matrixA
        XCTAssertEqual(scalarPlusMatrix.grid, [3,4,5,6,7,8,9,10,11], accuracy: tolerance)
        
        let matrixTimesScalar = matrixA * scalar
        XCTAssertEqual(matrixTimesScalar.grid, [2,4,6,8,10,12,14,16,18], accuracy: tolerance)
        
        matrixA += scalar
        XCTAssertEqual(matrixA.grid, [3,4,5,6,7,8,9,10,11], accuracy: tolerance)
        
        matrixA -= scalar
        XCTAssertEqual(matrixA.grid, gridA, accuracy: tolerance)
        
        matrixA *= scalar
        XCTAssertEqual(matrixA.grid, [2,4,6,8,10,12,14,16,18], accuracy: tolerance)
    }

    // MARK: - MatrixComplex Tests
   
    func testComplexMatrixArithmetic() {
        let gridComplexA: [Complex] = [
            Complex(1.0, 1.0),
            Complex(2.0, -1.0),
            Complex(3.0, 2.0),
            Complex(-1.0, 1.0)
        ]
        
        let gridComplexB: [Complex] = [
            Complex(2.0, -1.0),
            Complex(1.0, 2.0),
            Complex(-1.0, 1.0),
            Complex(3.0, -2.0)
        ]
        
        var matrixComplexA = MatrixComplex(gridComplexA, 2, 2)
        let matrixComplexB = MatrixComplex(gridComplexB, 2, 2)
        let scalar = 2.0
        let complexScalar = Complex(1.5, -0.5)
        
        let complexMatrixSum = matrixComplexA + matrixComplexB
        XCTAssertEqual(complexMatrixSum.grid, [
            Complex(3.0, 0.0),
            Complex(3.0, 1.0),
            Complex(2.0, 3.0),
            Complex(2.0, -1.0)
        ], accuracy: tolerance)
        
        let complexMatrixElementProduct = matrixComplexA .* matrixComplexB
        XCTAssertEqual(complexMatrixElementProduct.grid, [
            Complex(3.0, 1.0),
            Complex(4.0, 3.0),
            Complex(-5.0, 1.0),
            Complex(-1.0, 5.0)
        ], accuracy: tolerance)
        
        matrixComplexA += matrixComplexB
        XCTAssertEqual(matrixComplexA.grid, [
            Complex(3.0, 0.0),
            Complex(3.0, 1.0),
            Complex(2.0, 3.0),
            Complex(2.0, -1.0)
        ], accuracy: tolerance)
        
        matrixComplexA = MatrixComplex(gridComplexA, 2, 2)
        let complexMatrixPlusScalar = matrixComplexA + scalar
        XCTAssertEqual(complexMatrixPlusScalar.grid, [
            Complex(3.0, 1.0),
            Complex(4.0, -1.0),
            Complex(5.0, 2.0),
            Complex(1.0, 1.0)
        ], accuracy: tolerance)
        
        let complexMatrixPlusComplexScalar = matrixComplexA + complexScalar
        XCTAssertEqual(complexMatrixPlusComplexScalar.grid, [
            Complex(2.5, 0.5),
            Complex(3.5, -1.5),
            Complex(4.5, 1.5),
            Complex(0.5, 0.5)
        ], accuracy: tolerance)
        
        let complexScalarPlusComplexMatrix = complexScalar + matrixComplexA
        XCTAssertEqual(complexScalarPlusComplexMatrix.grid, [
            Complex(2.5, 0.5),
            Complex(3.5, -1.5),
            Complex(4.5, 1.5),
            Complex(0.5, 0.5)
        ], accuracy: tolerance)
        
        let complexMatrixProduct = matrixComplexA * matrixComplexB
        XCTAssertEqual(complexMatrixProduct.grid, [
            Complex(2.0, 4.0),
            Complex(3.0, -4.0),
            Complex(8.0, -1.0),
            Complex(-2.0, 13.0)
        ], accuracy: tolerance)
    }
     
    // MARK: - Edge Cases and Integration Tests
    
    func testEdgeCases() {
        let zeroArray: [Double] = [0.0, 0.0, 0.0]
        let testArray: [Double] = [1.0, 2.0, 3.0]
        
        let zeroResult = testArray * zeroArray
        XCTAssertEqual(zeroResult, [0.0, 0.0, 0.0], accuracy: tolerance)
        
        let ones: [Double] = [1.0, 1.0, 1.0]
        let identityResult = testArray / ones
        XCTAssertEqual(identityResult, testArray, accuracy: tolerance)
        
        let realComplex = Complex(5.0, 0.0)
        let pureReal = 5.0
        let complexRealSum = realComplex + pureReal
        XCTAssertEqual(complexRealSum, Complex(10.0, 0.0), accuracy: tolerance)
    }
    
    // MARK: - Performance
    
    func testPerformanceOfLargeOperations() {
        let largeSize = 1000
        let largeArray = Array(repeating: 3.14, count: largeSize)
        let anotherLargeArray = Array(repeating: 2.71, count: largeSize)
        
        measure {
            let _ = largeArray + anotherLargeArray
        }
    }
    
    func testUnary() {
        let arrayDouble:[Double] = [1,2,3,4,5]
        var a = -arrayDouble
        
        let arrayComplex:[Complex] = [1,2,3,4,5]
        var b = -arrayComplex
        
        print(b)
        
        let matrix =  Matrix([1.0,2.0,3.0
                              ,4.0,5.0,6.0], 2,3)
        var c = -matrix
        print(c.grid)
        
        let grid: [Complex] = [
            Complex(1.0, 1.0),
            Complex(2.0, 1.0),
            Complex(3.0, 2.0),
            Complex(1.0, 1.0)
        ]
        var matrixComplex = MatrixComplex(grid, 2, 2)
        var d = -matrixComplex
        print(d.grid)
    }
}
