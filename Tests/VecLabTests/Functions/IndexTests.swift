//
//  IndexTests.swift
//  VecLab
//
//  Created by Marcus Painter on 09/03/2025.
//

import XCTest
import VecLab

class IndexTests: XCTestCase {
    
    func testSetindex2() {
        // Example usage
        let a0: [Real] = [0, 0, 0, 0, 0, 0, 0, 0]
        let indices1: [Int] = [0, 2] // 0-based indices (equivalent to MATLAB's [1,3])
        let indices2: [Int] = [4, 6] // 0-based indices (equivalent to MATLAB's [5,7])
        
        let ttt = (1, 2) ** (2, 3)
        
        print(ttt)
        
        let b: RealArray = [10, 20, 30, 40, 50, 60, 70, 80]
        let c: RealArray = [19, 29]
        
        _ = setindex(a0, value: 1.0)
        
        _ = setindex(a0, indices: [1], values: [1.0])
        _ = setindex(a0, indices: [0, 1], values: [1.0, 2.0])
        
        _ = setindex(a0, indices: [0, 1], values: [1.0, 2.0])
        _ = setindex(a0, indices: [1.0, 2.0], values: [1.0, 2.0])
        
        _ = setindex(a0, indices: [0, 1], values: [1.0, 2.0], valueIndices: [0, 1])
        _ = setindex(a0, indices: [0, 1], values: [1.0, 2.0], valueIndices: [0.0, 1.0])
        
        let b2 = getindex(b, indices: [3, 7])
        disp(b2)
        
        // Set all to scalar
        let result1 = setindex(a0, value: 1)
        print("Set all to scalar: \(result1)")
        // Output: [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]
        
        // Set indices to scalar
        let result2 = setindex(a0, indices: indices1, value: 1.0)
        print("Set indices to scalar: \(result2)")
        // Output: [1.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
        // Set indices to vector
        let result3 = setindex(a0, indices: indices1, values: c)
        print("Set indices to vector: \(result3)")
        // Output: [19.0, 0.0, 29.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
        // Set indices to indices of vector
        let result4 = setindex(a0, indices: indices2, values: b, valueIndices: indices1)
        print("Set indices to indices of vector: \(result4)")
        // Output: [0.0, 0.0, 0.0, 0.0, 10.0, 0.0, 30.0, 0.0]
    }
    
}
