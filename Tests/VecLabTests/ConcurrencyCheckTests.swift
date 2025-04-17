//
//  ConcurrencyCheckTests.swift
//  VecLab
//
//  Created by Marcus Painter on 17/04/2025.
//


import XCTest
@testable import VecLab

/*
final class ConcurrencyCheckTests: XCTestCase {
    
    // This class is not marked as @MainActor or with any other concurrency annotations
    class UnsafeSharedState {
        var value: Int = 0
    }
    
    func testConcurrencyChecking() async {
        let sharedState = UnsafeSharedState()
        
        // Create multiple tasks that access the shared state without proper synchronization
        async let task1 = Task {
            for _ in 0..<1000 {
                sharedState.value += 1
            }
            return sharedState.value
        }
        
        async let task2 = Task {
            for _ in 0..<1000 {
                sharedState.value += 1
            }
            return sharedState.value
        }
        
        // Wait for both tasks to complete
        let (result1, result2) = await (task1.value, task2.value)
        
        // This assertion isn't the important part - the compiler should flag 
        // the race condition above if strict concurrency checking is enabled
        XCTAssertTrue(result1 > 0 && result2 > 0)
    }
}
*/
