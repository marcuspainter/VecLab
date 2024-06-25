//
//  Test.swift
//  
//
//  Created by Marcus Painter on 23/06/2024.
//

import Testing
import VecLab

struct AddTestsNew2 {
    
    @Test func testExample() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        #expect(Bool(true))
    }
    
    @Test func testAddReal() {
        // Test real number addition
        let a: RealArray = [1.0, 2.0, 3.0]
        let b: RealArray = [3.0, 2.0, 1.0]
        let result = a + b
        #expect(result == [4.0, 4.0, 4.0], "Real addition failed")
    }
    
}

/*

import XCTest
import VecLab

class AddTests: XCTestCase {
    // Test real number addition
    func testAddReal() {
        let a: RealArray = [1.0, 2.0, 3.0]
        let b: RealArray = [3.0, 2.0, 1.0]
        let result = a + b
        XCTAssertEqual(result, [4.0, 4.0, 4.0], "Real addition failed")
    }
}

*/

/*
 
Apple has released a new Swift testing framework to replace XCTest.
 
 I want to convert my tests to the new method. Here are some simple instructions and an example of the old and new methiods.

1. Replace testing framework
Replace
import XCTest
with
import Testing

2. Change class to struct with 'New' prefix.
Change
class AddTests: XCTestCase {
to
struct NewAddTests {

3. Add @Teat attribute to function.
func testAddReal() {
to
@Test func testAddReal() {
 
4. Replace XCTAssertEqual assertion with #expect macro.
XCTAssertEqual(result, [4.0, 4.0, 4.0], "Real addition failed")
to
 #expect(result == [4.0, 4.0, 4.0], "Real addition failed")
 
 // Old
 import XCTest
 import VecLab

 class AddTests: XCTestCase {
     // Test real number addition
     func testAddReal() {
         let a: RealArray = [1.0, 2.0, 3.0]
         let b: RealArray = [3.0, 2.0, 1.0]
         let result = a + b
         XCTAssertEqual(result, [4.0, 4.0, 4.0], "Real addition failed")
     }
 }
 
 // New
 import Testing
 import VecLab
 
 struct AddTestsNew {
     
     @Test func testAddReal() {
         // Test real number addition
         let a: RealArray = [1.0, 2.0, 3.0]
         let b: RealArray = [3.0, 2.0, 1.0]
         let result = a + b
         #expect(result == [4.0, 4.0, 4.0], "Real addition failed")
     }
     
 }
 
 Do you understand your task. If yes, I will give you some test to convert.
 
 
 */
