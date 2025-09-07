//
//  ConcurrencyCheckTests.swift
//  VecLab
//
//  Created by Marcus Painter on 17/04/2025.
//

import XCTest

// Set true or false to test error checking


final class ConcurrencyCheckTests: XCTestCase {
    
#if false
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
#endif
}

@discardableResult
fileprivate func benchmark(
    _ desc: String = "Benchmark",
    iterations: Int = 100,
    function: () throws -> Void
) rethrows -> BenchmarkResult {
    
    let clock = ContinuousClock()
    var durations: [Double] = []
    durations.reserveCapacity(iterations)
    
    for _ in 0..<iterations {
        let start = clock.now
        try function()
        let duration = start.duration(to: clock.now)
        let ns = Double(duration.components.attoseconds) / 1e9
        let ms = ns / 1_000_000.0
        durations.append(ms)
    }
    
    let result = BenchmarkResult(iterations: iterations, durationsMs: durations)
    
    print("\(desc): avg \(result.average) ms | min \(result.minimum) ms | max \(result.maximum) ms | median \(result.median) ms")
    
    return result
}

public struct BenchmarkResult {
    public let iterations: Int
    public let durationsMs: [Double] // Duration per iteration in ms
    public var average: Double { durationsMs.reduce(0, +) / Double(iterations) }
    public var minimum: Double { durationsMs.min() ?? 0 }
    public var maximum: Double { durationsMs.max() ?? 0 }
    public var median: Double {
        let sorted = durationsMs.sorted()
        if sorted.isEmpty { return 0 }
        let mid = sorted.count / 2
        return sorted.count % 2 == 0
            ? (sorted[mid - 1] + sorted[mid]) / 2
            : sorted[mid]
    }
}
