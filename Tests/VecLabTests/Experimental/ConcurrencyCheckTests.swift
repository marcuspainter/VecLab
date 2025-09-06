//
//  ConcurrencyCheckTests.swift
//  VecLab
//
//  Created by Marcus Painter on 17/04/2025.
//

import XCTest

// Set true or false to test error checking

#if false
final class ConcurrencyCheckTests: XCTestCase {
        
    func testConcurrencyChecking() async {
        let sharedState = UnsafeSharedState()

        await withTaskGroup(of: Void.self) { group in
            group.addTask {
                sharedState.value += 1 // Should definitely error
            }
            group.addTask {
                sharedState.value += 1 // Should definitely error
            }
        }
    }
}
#endif
