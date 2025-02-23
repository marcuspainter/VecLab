//
//  gatherTest.swift
//  VecLab
//
//  Created by Marcus Painter on 22/02/2025.
//

import Testing
@testable import VecLab

extension ArrayTests2 {
    
    @Test func testGatherRealArrayRealIndices() {
        let a = arange(0.0, 10.0)
        let indices = [2.0,4.0,6.0,8.0]
        let result = gather(a, indices)
        let expected = [2.0,4.0,6.0,8.0]
        #expect(result == expected)
    }
    
    @Test func testGatherRealArrayIntIndices() {
        let a = arange(0.0, 10.0)
        let indices = [2,4,6,8]
        let result = gather(a, indices)
        let expected = [2.0,4.0,6.0,8.0]
        #expect(result == expected)
    }
    
    @Test func testGatherComplexArrayRealIndices() {
        let a = arange(0.0, 10.0)
        let b = (a,a)
        let indices = [2.0,4.0,6.0,8.0]
        let result = gather(b, indices)
        let expected = [2.0,4.0,6.0,8.0]
        #expect(result.0 == expected)
    }
    
    @Test func testGatherComplexArrayIntIndices() {
        let a = arange(0.0, 10.0)
        let b = (a,a)
        let indices = [2,4,6,8]
        let result = gather(b, indices)
        let expected = [2.0,4.0,6.0,8.0]
        #expect(result.0 == expected)
    }
    
}
