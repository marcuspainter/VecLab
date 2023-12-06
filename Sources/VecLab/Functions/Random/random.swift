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
    mutating func rand() -> Real
}

// Implement DefaultRNG to conform to the protocol
struct DefaultRNG: RandomNumberGenerator {
    var seed: UInt32 = 0

    init(seed: UInt32) {
        self.seed = seed
    }

    // Generate a random number
    mutating func rand() -> Real {
        return Real.random(in: 0 ... 1)
    }
}

// Internal singleton
private struct GlobalRNG {
    static var rng: RandomNumberGenerator = DefaultRNG(seed: UInt32(time(nil)))

    static func rand() -> Real {
        rng.rand()
    }

    // Centralized normal distribution generation
    static func randn() -> Real {
        // Using the Box-Muller transform with rand() from the chosen RNG
        let u1 = rng.rand()
        let u2 = rng.rand()

        let z0 = Darwin.sqrt(-2.0 * log(u1)) * Darwin.cos(2 * .pi * u2)
        return z0
    }
}

/// Uniformly distributed random numbers.
/// - Returns: A random number from the uniform distribution in the interval (0,1).
/// ## See Also
///
/// - ``rand(count:)``
/// - ``randn()``
/// - ``randn(count:)``
/// - ``rng(seed:generator:)``
///
public func rand() -> Real {
    return GlobalRNG.rand()
}

/// Uniformly distributed random numbers as an array.
/// - Parameter count: The number of elements in the array.
/// - Returns: A random number from the uniform distribution in the interval (0,1).
public func rand(count: Int) -> RealArray {
    return (0..<count).map { _ in GlobalRNG.rand() }
}

/// Normally distributed random numbers.
/// - Returns: A random number from the standard normal distribution.
public func randn() -> Real {
    return GlobalRNG.randn()
}

/// Normally distributed random numbers as an array.
/// - Parameter count: The number of elements in the array.
/// - Returns: A random array from the standard normal distribution.
public func randn(count: Int) -> RealArray {
    // let y = RealArray(repeating: 0, count: n)
    return (0..<count).map { _ in GlobalRNG.randn() }
}

/// Control random number generator seed and algorithm.
///
/// - Parameters:
///   - seed: Seed for random number generator.
///   - generator: The type of random number generator to use.
public func rng(seed: UInt32, generator: String = "Default") {
    switch generator {
    case "Default":
        GlobalRNG.rng = DefaultRNG(seed: seed)
    // case "Another":
    //     GlobalRNG.rng = AnotherRNG(seed: seedValue)
    default:
        fatalError("Unsupported RNG algorithm: \(generator)")
    }
}

/// Returns the seed of the random number generator.
///
/// - Returns: Current seed of the random number generator.
public func rng() -> UInt32 {
    return GlobalRNG.rng.seed
}
