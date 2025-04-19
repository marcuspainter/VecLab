//
//  ArrayDoubleExtensionsTests.swift
//  VecLab
//
//  Created by Marcus Painter on 17/04/2025.
//


import XCTest
@testable import VecLab  // Replace with your actual module name

final class ArrayDoubleExtensionsTests: XCTestCase {
    
    // Test that range subscripts return Arrays, not ArraySlices
    func testRangeSubscriptsReturnArrays() {
        let array = [1.0, 2.0, 3.0, 4.0, 5.0]
        
        // Test regular range
        let slice1 = array[1..<4]
        XCTAssertTrue(type(of: slice1) == [Double].self, "Range subscript should return [Double]")
        
        // Test closed range
        let slice2 = array[1...3]
        XCTAssertTrue(type(of: slice2) == [Double].self, "Closed range subscript should return [Double]")
        
        // Test partial range from
        let slice3 = array[2...]
        XCTAssertTrue(type(of: slice3) == [Double].self, "Partial range from subscript should return [Double]")
        
        // Test partial range up to
        let slice4 = array[..<3]
        XCTAssertTrue(type(of: slice4) == [Double].self, "Partial range up to subscript should return [Double]")
        
        // Test partial range through
        let slice5 = array[...2]
        XCTAssertTrue(type(of: slice5) == [Double].self, "Partial range through subscript should return [Double]")
    }
    
    // Test that the arrays contain the correct values
    func testRangeSubscriptsContent() {
        let array = [1.0, 2.0, 3.0, 4.0, 5.0]
        
        // Test regular range
        let slice1 = array[1..<4]
        XCTAssertEqual(slice1, [2.0, 3.0, 4.0])
        
        // Test closed range
        let slice2 = array[1...3]
        XCTAssertEqual(slice2, [2.0, 3.0, 4.0])
        
        // Test partial range from
        let slice3 = array[2...]
        XCTAssertEqual(slice3, [3.0, 4.0, 5.0])
        
        // Test partial range up to
        let slice4 = array[..<3]
        XCTAssertEqual(slice4, [1.0, 2.0, 3.0])
        
        // Test partial range through
        let slice5 = array[...2]
        XCTAssertEqual(slice5, [1.0, 2.0, 3.0])
    }
    
    // Test the size validation during assignment
    func testRangeSubscriptsSizeValidation() {
        // Redirect standard output to capture error messages
        //let pipe = Pipe()
        //let originalStdout = FileHandle.standardOutput
        //FileHandle.standardOutput = pipe
        
        var array = [1.0, 2.0, 3.0, 4.0, 5.0]
        
        // Test valid replacement (correct size)
        array[1..<4] = [10.0, 20.0, 30.0]
        XCTAssertEqual(array, [1.0, 10.0, 20.0, 30.0, 5.0])
        
        // Test invalid replacement (wrong size)
        array[1..<4] = [10.0, 20.0]
        
        // Restore standard output
    //    FileHandle.standardOutput = originalStdout
        
        // Verify the array wasn't changed
        XCTAssertEqual(array, [1.0, 10.0, 20.0, 30.0, 5.0], "Array should not change when size validation fails")
        
        // Note: In a real test, we would read the pipe to check for the error message,
        // but this is simplified for demonstration purposes
    }
    
    // Test assignment with closed ranges
    func testClosedRangeAssignment() {
        var array = [1.0, 2.0, 3.0, 4.0, 5.0]
        
        // Test valid replacement (correct size)
        array[1...3] = [10.0, 20.0, 30.0]
        XCTAssertEqual(array, [1.0, 10.0, 20.0, 30.0, 5.0])
        
        // Test invalid replacement (wrong size) - should log error and not change
        let originalArray = array.map { $0 }
        array[1...3] = [40.0, 50.0]
        XCTAssertEqual(array, originalArray, "Array should not change when size validation fails")
    }
    
    // Test assignment with partial ranges
    func testPartialRangeAssignment() {
        var array = [1.0, 2.0, 3.0, 4.0, 5.0]
        
        // Test partial range from
        array[2...] = [30.0, 40.0, 50.0]
        XCTAssertEqual(array, [1.0, 2.0, 30.0, 40.0, 50.0])
        
        // Reset array
        array = [1.0, 2.0, 3.0, 4.0, 5.0]
        
        // Test partial range up to
        array[..<3] = [10.0, 20.0, 30.0]
        XCTAssertEqual(array, [10.0, 20.0, 30.0, 4.0, 5.0])
        
        // Reset array
        array = [1.0, 2.0, 3.0, 4.0, 5.0]
        
        // Test partial range through
        array[...2] = [10.0, 20.0, 30.0]
        XCTAssertEqual(array, [10.0, 20.0, 30.0, 4.0, 5.0])
    }
}
