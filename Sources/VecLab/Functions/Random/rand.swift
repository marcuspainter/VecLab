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
    
    private init() {
        // Use Swift's default high-quality system RNG
        self.generator = SystemRandomNumberGenerator()
    }
    
    func rand() -> Real {
        // Use Swift's built-in random generation
        return Real.random(in: 0.0..<1.0, using: &generator)
    }
    
    func setSeed(_ seed: UInt64) {
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
public func rand() -> Real {
    return GlobalRNG.shared.rand()
}

public func randn() -> Real {
    let u1 = rand()
    let u2 = rand()

    return Real(Darwin.sqrt(-2.0 * Darwin.log(u1)) * Darwin.cos(2 * .pi * u2))
}

public func rand(count: Int) -> RealArray {
    var result = [Real](repeating: 0, count: count)
    for i in 0..<count {
        result[i] = rand()
    }
    return result
}

public func randn(count: Int) -> RealArray {
    var result = [Real](repeating: 0, count: count)
    for i in 0..<count {
        result[i] = randn()
    }
    return result
}

public func rng(seed: UInt64) {
    GlobalRNG.shared.setSeed(seed)
}
