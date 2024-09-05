//
//  random.swift
//
//
//  Created by Marcus Painter on 11/09/2023.
//

// https://www.cocoawithlove.com/blog/2016/05/19/random-numbers.html

import Foundation

// Define a protocol for RNGs
protocol RandomNumberGenerator {
    var seed: UInt32 { get }
    init(seed: UInt32)
    mutating func rand() -> RealDouble
}

// Implement DefaultRNG to conform to the protocol
struct DefaultRNG: RandomNumberGenerator {
    var seed: UInt32 = 0

    init(seed: UInt32) {
        self.seed = seed
    }

    // Generate a random number
    mutating func rand() -> RealDouble {
        return Double.random(in: 0 ... 1)
    }
}

// Internal singleton
final class GlobalRNG: @unchecked Sendable {
    public static let shared = GlobalRNG()
    private var rng: RandomNumberGenerator = DefaultRNG(seed: UInt32(time(nil)))
    private let lock = NSLock()

    func setRNG(rng: RandomNumberGenerator) {
        self.lock.lock()
        self.rng = rng
        self.lock.unlock()
    }

    var seed: UInt32 {
        self.lock.lock()
        defer { self.lock.unlock() }
        return rng.seed
    }

    func rand() -> RealDouble {
        self.lock.lock()
        let x = self.rng.rand()
        self.lock.unlock()
        return x
    }

    // Centralized normal distribution generation
    func randn() -> RealDouble {
        self.lock.lock()
        defer {  self.lock.unlock()}
        // Using the Box-Muller transform with rand() from the chosen RNG
        let u1 = self.rng.rand()
        let u2 = self.rng.rand()

        let z0 = Darwin.sqrt(-2.0 * Darwin.log(u1)) * Darwin.cos(2 * .pi * u2)
        return z0
    }
    
    func rand(count: Int) -> RealDoubleArray {
        return (0..<count).map { _ in self.rand() }
    }

    func randn(count: Int) -> RealDoubleArray {
        return (0..<count).map { _ in self.randn() }
    }
}




