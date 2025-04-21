//
//  ComplexDoubleArrayTests.swift
//  VecLab
//
//  Created by Marcus Painter on 16/04/2025.
//

import XCTest
import VecLab  // Replace with your actual module name

final class ComplexDoubleArrayTests: XCTestCase {
    
    // Test initialization
    func testInitialization() {
        // Empty init
        let empty = ComplexDoubleArray()
        XCTAssertEqual(empty.count, 0)
        XCTAssertTrue(empty.isEmpty)
        
        // Init with sequence
        let values = [ComplexDouble(1, 2), ComplexDouble(3, 4), ComplexDouble(5, 6)]
        let array = ComplexDoubleArray(values)
        XCTAssertEqual(array.count, 3)
        XCTAssertEqual(array[0].real, 1)
        XCTAssertEqual(array[0].imag, 2)
        
        // Array literal init
        let literal: ComplexDoubleArray = [ComplexDouble(7, 8), ComplexDouble(9, 10)]
        XCTAssertEqual(literal.count, 2)
        XCTAssertEqual(literal[1].real, 9)
        XCTAssertEqual(literal[1].imag, 10)
    }
    
    // Test collection operations
    func testCollectionOperations() {
        var array: ComplexDoubleArray = [
            ComplexDouble(1, 2),
            ComplexDouble(3, 4),
            ComplexDouble(5, 6),
            ComplexDouble(7, 8),
            ComplexDouble(9, 10)
        ]
        
        // Access by index
        XCTAssertEqual(array[2].real, 5)
        XCTAssertEqual(array[2].imag, 6)
        
        // Modify by index
        array[2] = ComplexDouble(50, 60)
        XCTAssertEqual(array[2].real, 50)
        XCTAssertEqual(array[2].imag, 60)
        
        // Iteration
        var sum = ComplexDouble(0, 0)
        for element in array {
            sum = ComplexDouble(sum.real + element.real, sum.imag + element.imag)
        }
        XCTAssertEqual(sum.real, 1 + 3 + 50 + 7 + 9)
        XCTAssertEqual(sum.imag, 2 + 4 + 60 + 8 + 10)
        
        // Count and non-empty checks
        XCTAssertEqual(array.count, 5)
        XCTAssertFalse(array.isEmpty)
    }
    
    // Test range-based operations
    func testRangeOperations() {
        var array: ComplexDoubleArray = [
            ComplexDouble(1, 2),
            ComplexDouble(3, 4),
            ComplexDouble(5, 6),
            ComplexDouble(7, 8),
            ComplexDouble(9, 10)
        ]
        
        // Range subscript get
        let slice = array[1..<4]
        XCTAssertEqual(slice.count, 3)
        XCTAssertEqual(slice[0].real, 3)
        XCTAssertEqual(slice[2].imag, 8)
        
        // Range subscript set
        array[1..<3] = [ComplexDouble(30, 40), ComplexDouble(50, 60)]
        XCTAssertEqual(array[1].real, 30)
        XCTAssertEqual(array[1].imag, 40)
        XCTAssertEqual(array[2].real, 50)
        XCTAssertEqual(array[2].imag, 60)
        
        // Closed range
        let closedSlice = array[2...4]
        XCTAssertEqual(closedSlice.count, 3)
        XCTAssertEqual(closedSlice[0].real, 50)
        XCTAssertEqual(closedSlice[2].imag, 10)
        
        // Partial ranges
        let fromRange = array[3...]
        XCTAssertEqual(fromRange.count, 2)
        XCTAssertEqual(fromRange[0].real, 7)
        
        let upToRange = array[..<2]
        XCTAssertEqual(upToRange.count, 2)
        XCTAssertEqual(upToRange[1].real, 30)
        
        let throughRange = array[...2]
        XCTAssertEqual(throughRange.count, 3)
        XCTAssertEqual(throughRange[2].imag, 60)
    }
    
    // Test RangeReplaceableCollection operations
    func testRangeReplaceableOperations() {
        var array = ComplexDoubleArray()
        
        // Append
        array.append(ComplexDouble(1, 2))
        XCTAssertEqual(array.count, 1)
        XCTAssertEqual(array[0].real, 1)
        
        // Append contentsOf
        array.append(contentsOf: [ComplexDouble(3, 4), ComplexDouble(5, 6)])
        XCTAssertEqual(array.count, 3)
        XCTAssertEqual(array[2].imag, 6)
        
        // Insert
        array.insert(ComplexDouble(7, 8), at: 1)
        XCTAssertEqual(array.count, 4)
        XCTAssertEqual(array[1].real, 7)
        XCTAssertEqual(array[2].real, 3)
        
        // Remove
        let removed = array.remove(at: 2)
        XCTAssertEqual(array.count, 3)
        XCTAssertEqual(removed.real, 3)
        XCTAssertEqual(array[2].real, 5)
        
        // RemoveSubrange
        array.removeSubrange(0..<2)
        XCTAssertEqual(array.count, 1)
        XCTAssertEqual(array[0].real, 5)
        
        // ReplaceSubrange
        array.replaceSubrange(0..<1, with: [ComplexDouble(9, 10), ComplexDouble(11, 12)])
        XCTAssertEqual(array.count, 2)
        XCTAssertEqual(array[0].real, 9)
        XCTAssertEqual(array[1].imag, 12)
    }
    
    // Test Equatable conformance
    func testEquatable() {
        let array1: ComplexDoubleArray = [ComplexDouble(1, 2), ComplexDouble(3, 4)]
        let array2: ComplexDoubleArray = [ComplexDouble(1, 2), ComplexDouble(3, 4)]
        let array3: ComplexDoubleArray = [ComplexDouble(1, 2), ComplexDouble(5, 6)]
        
        XCTAssertEqual(array1, array2)
        XCTAssertNotEqual(array1, array3)
    }
 /*
    // Test description
    func testDescription() {
        let array: ComplexDoubleArray = [ComplexDouble(1, 2), ComplexDouble(3, -4)]
        let description = array.description
        
        // Just check that it contains some relevant substrings
        XCTAssertTrue(description.contains("1"))
        XCTAssertTrue(description.contains("2i"))
        XCTAssertTrue(description.contains("3"))
        XCTAssertTrue(description.contains("- 4i"))
    }
  */
    
    // Test Equatable conformance
    func testCat() {
        var array1: ComplexDoubleArray = [ComplexDouble(1, 2), ComplexDouble(3, 4)]
        var array2 = [1.0, 2.0]
        array1 += array1
        array2 += array2
        disp(array2)
    }
}
