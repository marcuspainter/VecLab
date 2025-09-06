//
//  rand.swift
//  VecLab
//
//  Created by Marcus Painter on 06/09/2025.
//

import Foundation

// Private singleton class to manage global RNG state
private final class GlobalRNG: @unchecked Sendable {
    static let shared = GlobalRNG()
    
    private var generator: any RandomNumberGenerator
    private let lock = NSLock()
    
    private init() {
        // Start with a random seed for non-reproducible behavior by default
        let randomSeed = UInt64.random(in: 0...UInt64.max)
        self.generator = SeededRandomNumberGenerator(seed: randomSeed)
    }
    
    func rand() -> Real {
        lock.lock()
        defer { lock.unlock() }
        // Use Swift's built-in random generation
        return Real.random(in: 0.0..<1.0, using: &generator)
    }
    
    func setSeed(_ seed: UInt64) {
        lock.lock()
        defer { lock.unlock() }
        // For seeded generation, use a seeded generator
        generator = SeededRandomNumberGenerator(seed: seed)
    }
}

// Simple seeded RNG for reproducible results
private struct SeededRandomNumberGenerator: RandomNumberGenerator {
    private var state: UInt64
    
    init(seed: UInt64) {
        self.state = seed
    }
    
    mutating func next() -> UInt64 {
        // Simple Xorshift* (better quality)
        state ^= state >> 12
        state ^= state << 25
        state ^= state >> 27
        return state &* 0x2545F4914F6CDD1D
    }
}

// Public interface functions

/// Uniformly distributed random numbers.
/// - Returns: A random number from the uniform distribution in the interval [0,1).
public func rand() -> Real {
    return GlobalRNG.shared.rand()
}

/// Normally distributed random numbers.
///
/// Box-Muller transform for normal distribution.
/// - Returns: A random number from the standard normal distribution.
public func randn() -> Real {
    // Default Box-Muller transform for normal distribution
    let u1 = rand()
    let u2 = rand()

    return Real(Darwin.sqrt(-2.0 * Darwin.log(u1)) * Darwin.cos(2 * .pi * u2))
}

/// Uniformly distributed random numbers as an array.
///
/// Box-Muller transform for normal distribution
/// - Parameter count: The number of elements in the array.
/// - Returns: An array of random numbers from the uniform distribution in the interval [0,1).
public func rand(count: Int) -> RealArray {
    var result = [Real](repeating: 0, count: count)
    for i in 0..<count {
        result[i] = rand()
    }
    return result
}

/// Normally distributed random numbers as an array.
/// - Parameter count: The number of elements in the array.
/// - Returns: An array of random numbers from the standard normal distribution.
public func randn(count: Int) -> RealArray {
    var result = [Real](repeating: 0, count: count)
    for i in 0..<count {
        result[i] = randn()
    }
    return result
}

@discardableResult
public func rng(seed: UInt64 = UInt64.random(in: UInt64.min...UInt64.max)) -> UInt64 {
    GlobalRNG.shared.setSeed(seed)
    return seed
}
