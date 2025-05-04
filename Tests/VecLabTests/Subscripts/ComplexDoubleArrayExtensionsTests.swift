//
//  ComplexDoubleArrayExtensionsTests.swift
//  VecLab
//
//  Created by Marcus Painter on 17/04/2025.
//

import XCTest
import VecLab  // Replace with your actual module name

final class ComplexDoubleArrayExtensionsTests: XCTestCase {
    
    // Test that range subscripts return ComplexDoubleArrays, not slices
    func testRangeSubscriptsReturnComplexArrays() {
        let array = ComplexDoubleArray([
            ComplexDouble(1, 1), 
            ComplexDouble(2, 2), 
            ComplexDouble(3, 3), 
            ComplexDouble(4, 4), 
            ComplexDouble(5, 5)
        ])
        
        // Test regular range
        let slice1 = array[1..<4]
        XCTAssertTrue(type(of: slice1) == ComplexDoubleArray.self, "Range subscript should return ComplexDoubleArray")
        
        // Test closed range
        let slice2 = array[1...3]
        XCTAssertTrue(type(of: slice2) == ComplexDoubleArray.self, "Closed range subscript should return ComplexDoubleArray")
        
        // Test partial range from
        let slice3 = array[2...]
        XCTAssertTrue(type(of: slice3) == ComplexDoubleArray.self, "Partial range from subscript should return ComplexDoubleArray")
        
        // Test partial range up to
        let slice4 = array[..<3]
        XCTAssertTrue(type(of: slice4) == ComplexDoubleArray.self, "Partial range up to subscript should return ComplexDoubleArray")
        
        // Test partial range through
        let slice5 = array[...2]
        XCTAssertTrue(type(of: slice5) == ComplexDoubleArray.self, "Partial range through subscript should return ComplexDoubleArray")
    }
    
    // Test that the arrays contain the correct values
    func testRangeSubscriptsContent() {
        let array = ComplexDoubleArray([
            ComplexDouble(1, 1), 
            ComplexDouble(2, 2), 
            ComplexDouble(3, 3), 
            ComplexDouble(4, 4), 
            ComplexDouble(5, 5)
        ])
        
        // Test regular range
        let slice1 = array[1..<4]
        XCTAssertEqual(slice1[0].real, 2)
        XCTAssertEqual(slice1[0].imag, 2)
        XCTAssertEqual(slice1[2].real, 4)
        XCTAssertEqual(slice1.count, 3)
        
        // Test closed range
        let slice2 = array[1...3]
        XCTAssertEqual(slice2[0].real, 2)
        XCTAssertEqual(slice2[2].real, 4)
        XCTAssertEqual(slice2.count, 3)
        
        // Test partial range from
        let slice3 = array[2...]
        XCTAssertEqual(slice3[0].real, 3)
        XCTAssertEqual(slice3[2].real, 5)
        XCTAssertEqual(slice3.count, 3)
        
        // Test partial range up to
        let slice4 = array[..<3]
        XCTAssertEqual(slice4[0].real, 1)
        XCTAssertEqual(slice4[2].real, 3)
        XCTAssertEqual(slice4.count, 3)
        
        // Test partial range through
        let slice5 = array[...2]
        XCTAssertEqual(slice5[0].real, 1)
        XCTAssertEqual(slice5[2].real, 3)
        XCTAssertEqual(slice5.count, 3)
    }
    
    // Test the size validation during assignment
    func testRangeSubscriptsSizeValidation() {
        // Redirect standard output to capture error messages
        //let pipe = Pipe()
        //let originalStdout = FileHandle.standardOutput
        //FileHandle.standardOutput = pipe
        
        var array = ComplexDoubleArray([
            ComplexDouble(1, 1), 
            ComplexDouble(2, 2), 
            ComplexDouble(3, 3), 
            ComplexDouble(4, 4), 
            ComplexDouble(5, 5)
        ])
        
        // Test valid replacement (correct size)
        array[1..<4] = ComplexDoubleArray([
            ComplexDouble(10, 10),
            ComplexDouble(20, 20),
            ComplexDouble(30, 30)
        ])
        
        XCTAssertEqual(array[0].real, 1)
        XCTAssertEqual(array[1].real, 10)
        XCTAssertEqual(array[3].real, 30)
        XCTAssertEqual(array[4].real, 5)
        
        // Store current state for comparison
        let expectedReal = array.real
        let expectedImag = array.imag
        
        // Test invalid replacement (wrong size)
        array[1..<4] = ComplexDoubleArray([
            ComplexDouble(40, 40),
            ComplexDouble(50, 50)
        ])
        
        // Restore standard output
   //     FileHandle.standardOutput = originalStdout
        
        // Verify the array wasn't changed
        XCTAssertEqual(array.real, expectedReal)
        XCTAssertEqual(array.imag, expectedImag)
    }
    
    // Test assignment with closed ranges
    func testClosedRangeAssignment() {
        var array = ComplexDoubleArray([
            ComplexDouble(1, 1), 
            ComplexDouble(2, 2), 
            ComplexDouble(3, 3), 
            ComplexDouble(4, 4), 
            ComplexDouble(5, 5)
        ])
        
        // Test valid replacement (correct size)
        array[1...3] = ComplexDoubleArray([
            ComplexDouble(10, 10),
            ComplexDouble(20, 20),
            ComplexDouble(30, 30)
        ])
        
        XCTAssertEqual(array[0].real, 1)
        XCTAssertEqual(array[1].real, 10)
        XCTAssertEqual(array[3].real, 30)
        XCTAssertEqual(array[4].real, 5)
        
        // Store current state
        let expectedReal = array.real
        let expectedImag = array.imag
        
        // Test invalid replacement (wrong size) - should log error and not change
        array[1...3] = ComplexDoubleArray([
            ComplexDouble(40, 40),
            ComplexDouble(50, 50)
        ])
        
        // Verify the array wasn't changed
        XCTAssertEqual(array.real, expectedReal)
        XCTAssertEqual(array.imag, expectedImag)
    }
    
    // Test assignment with partial ranges
    func testPartialRangeAssignment() {
        var array = ComplexDoubleArray([
            ComplexDouble(1, 1), 
            ComplexDouble(2, 2), 
            ComplexDouble(3, 3), 
            ComplexDouble(4, 4), 
            ComplexDouble(5, 5)
        ])
        
        // Test partial range from
        array[2...] = ComplexDoubleArray([
            ComplexDouble(30, 30),
            ComplexDouble(40, 40),
            ComplexDouble(50, 50)
        ])
        
        XCTAssertEqual(array[0].real, 1)
        XCTAssertEqual(array[2].real, 30)
        XCTAssertEqual(array[4].real, 50)
        
        // Reset array
        array = ComplexDoubleArray([
            ComplexDouble(1, 1), 
            ComplexDouble(2, 2), 
            ComplexDouble(3, 3), 
            ComplexDouble(4, 4), 
            ComplexDouble(5, 5)
        ])
        
        // Test partial range up to
        array[..<3] = ComplexDoubleArray([
            ComplexDouble(10, 10),
            ComplexDouble(20, 20),
            ComplexDouble(30, 30)
        ])
        
        XCTAssertEqual(array[0].real, 10)
        XCTAssertEqual(array[2].real, 30)
        XCTAssertEqual(array[3].real, 4)
        
        // Reset array
        array = ComplexDoubleArray([
            ComplexDouble(1, 1), 
            ComplexDouble(2, 2), 
            ComplexDouble(3, 3), 
            ComplexDouble(4, 4), 
            ComplexDouble(5, 5)
        ])
        
        // Test partial range through
        array[...2] = ComplexDoubleArray([
            ComplexDouble(10, 10),
            ComplexDouble(20, 20),
            ComplexDouble(30, 30)
        ])
        
        XCTAssertEqual(array[0].real, 10)
        XCTAssertEqual(array[2].real, 30)
        XCTAssertEqual(array[3].real, 4)
    }
}
