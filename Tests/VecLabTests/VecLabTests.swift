import XCTest
@testable import VecLab

final class VecLabTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest
        
        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        
        //var a = ComplexArray(count: 10)
        var a = RealArray(repeating: 1.0, count: 10)
        a[0...,2] = a[0..., 1]
        
        print(a[0..., 2])
    }
}
