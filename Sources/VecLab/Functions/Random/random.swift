//
//  random.swift
//
//
//  Created by Marcus Painter on 11/09/2023.
//

// https://www.cocoawithlove.com/blog/2016/05/19/random-numbers.html

import Foundation

// Define a protocol for RNGs with focused functionality
protocol VecLabRandomNumberGenerator: Sendable {
    var seed: UInt32 { get }
    init(seed: UInt32)
    func rand() -> Real
    func randn() -> Real
    func rand(count: Int) -> [Real]
    func randn(count: Int) -> [Real]
}

// Default implementations for the protocol
extension VecLabRandomNumberGenerator {
    // Default Box-Muller transform for normal distribution
    func randn() -> Real {
        let u1 = rand()
        let u2 = rand()

        return Real(Darwin.sqrt(-2.0 * Darwin.log(u1)) * Darwin.cos(2 * .pi * u2))
    }

    // Default implementation for generating array of random numbers
    func rand(count: Int) -> [Real] {
        var result = [Real](repeating: 0, count: count)
        for i in 0..<count {
            result[i] = rand()
        }
        return result
    }

    // Default implementation for generating array of normally distributed random numbers
    func randn(count: Int) -> [Real] {
        var result = [Real](repeating: 0, count: count)
        for i in 0..<count {
            result[i] = randn()
        }
        return result
    }
}

// Implementation of a Mersenne Twister RNG to match MATLAB's behavior
final class MersenneTwisterRNG: VecLabRandomNumberGenerator, @unchecked Sendable {
    let seed: UInt32
    private var mt: [UInt32]
    private var index: Int

    private let n = 624
    private let m = 397
    private let matrixA: UInt32 = 0x9908b0df
    private let upperMask: UInt32 = 0x80000000
    private let lowerMask: UInt32 = 0x7fffffff

    required init(seed: UInt32) {
        self.seed = seed
        self.mt = [UInt32](repeating: 0, count: n)
        self.index = n + 1
        initGenerator(seed)
    }

    private func initGenerator(_ seed: UInt32) {
        mt[0] = seed
        for i in 1..<n {
            mt[i] = UInt32(1812433253 * (mt[i-1] ^ (mt[i-1] >> 30)) + UInt32(i))
        }
        index = n
    }

    private func generateNumbers() {
        let mag01: [UInt32] = [0, matrixA]

        for kk in 0..<n {
            let y = (mt[kk] & upperMask) | (mt[(kk+1) % n] & lowerMask)
            mt[kk] = mt[(kk + m) % n] ^ (y >> 1) ^ mag01[Int(y & 1)]
        }

        index = 0
    }

    func rand() -> Real {
        if index >= n {
            generateNumbers()
        }

        var y = mt[index]
        index += 1

        // Tempering
        y ^= (y >> 11)
        y ^= (y << 7) & 0x9d2c5680
        y ^= (y << 15) & 0xefc60000
        y ^= (y >> 18)

        // Convert to [0,1) interval like MATLAB
        // Avoid overflow by first converting to Real type
        return Real(y) / (Real(UInt32.max) + 1.0)
    }

    // Using default protocol implementation for other methods
}

// Implementation of the default Swift RNG
final class DefaultRNG: VecLabRandomNumberGenerator, @unchecked Sendable {
    let seed: UInt32
    private var generator: RandomNumberGenerator?

    required init(seed: UInt32) {
        self.seed = seed
        // In a real implementation, you'd use the seed to initialize Swift's RNG
    }

    func rand() -> Real {
        return Real.random(in: 0..<1)
    }

    // Using default protocol implementation for other methods
}

// Thread-safe global RNG singleton
final class GlobalRNG: @unchecked Sendable {
    public static let shared = GlobalRNG()
    private var rng: VecLabRandomNumberGenerator
    private let lock = NSLock()

    private init() {
        // Initialize with the current time as seed
        self.rng = MersenneTwisterRNG(seed: UInt32(time(nil)))
    }

    func setRNG(rng: VecLabRandomNumberGenerator) {
        lock.lock()
        defer { lock.unlock() }
        self.rng = rng
    }

    var seed: UInt32 {
        lock.lock()
        defer { lock.unlock() }
        return rng.seed
    }

    func rand() -> Real {
        lock.lock()
        defer { lock.unlock() }
        return rng.rand()
    }

    func randn() -> Real {
        lock.lock()
        defer { lock.unlock() }
        return rng.randn()
    }

    func rand(count: Int) -> [Real] {
        lock.lock()
        defer { lock.unlock() }
        return rng.rand(count: count)
    }

    func randn(count: Int) -> [Real] {
        lock.lock()
        defer { lock.unlock() }
        return rng.randn(count: count)
    }
}

// Public API for using the random number generators

/// Uniformly distributed random numbers.
/// - Returns: A random number from the uniform distribution in the interval [0,1).
public func rand() -> Real {
    return GlobalRNG.shared.rand()
}

/// Uniformly distributed random numbers as an array.
/// - Parameter count: The number of elements in the array.
/// - Returns: An array of random numbers from the uniform distribution in the interval [0,1).
public func rand(count: Int) -> [Real] {
    return GlobalRNG.shared.rand(count: count)
}

/// Normally distributed random numbers.
/// - Returns: A random number from the standard normal distribution.
public func randn() -> Real {
    return GlobalRNG.shared.randn()
}

/// Normally distributed random numbers as an array.
/// - Parameter count: The number of elements in the array.
/// - Returns: An array of random numbers from the standard normal distribution.
public func randn(count: Int) -> [Real] {
    return GlobalRNG.shared.randn(count: count)
}

/// Control random number generator seed and algorithm.
/// - Parameters:
///   - seed: Seed for random number generator.
///   - generator: The type of random number generator to use.
public func rng(seed: UInt32, generator: String = "MersenneTwister") {
    switch generator {
    case "Default":
        GlobalRNG.shared.setRNG(rng: DefaultRNG(seed: seed))
    case "MersenneTwister":
        GlobalRNG.shared.setRNG(rng: MersenneTwisterRNG(seed: seed))
    default:
        fatalError("Unsupported RNG algorithm: \(generator)")
    }
}

/// Returns the seed of the random number generator.
/// - Returns: Current seed of the random number generator.
public func rng() -> UInt32 {
    return GlobalRNG.shared.seed
}
