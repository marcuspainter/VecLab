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

    func rand() -> Real {
        self.lock.lock()
        let x = self.rng.rand()
        self.lock.unlock()
        return x
    }

    // Centralized normal distribution generation
    func randn() -> Real {
        self.lock.lock()
        defer {  self.lock.unlock()}
        // Using the Box-Muller transform with rand() from the chosen RNG
        let u1 = self.rng.rand()
        let u2 = self.rng.rand()

        let z0 = Darwin.sqrt(-2.0 * Darwin.log(u1)) * Darwin.cos(2 * .pi * u2)
        return z0
    }
    
    func rand(count: Int) -> RealArray {
        return (0..<count).map { _ in self.rand() }
    }
    
    func randn(count: Int) -> RealArray {
        return (0..<count).map { _ in self.randn() }
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
    return GlobalRNG.shared.rand()
}

/// Uniformly distributed random numbers as an array.
/// - Parameter count: The number of elements in the array.
/// - Returns: A random number from the uniform distribution in the interval (0,1).
public func rand(count: Int) -> RealArray {
    return GlobalRNG.shared.rand(count: count)
}

/// Normally distributed random numbers.
/// - Returns: A random number from the standard normal distribution.
public func randn() -> Real {
    return GlobalRNG.shared.randn()
}

/// Normally distributed random numbers as an array.
/// - Parameter count: The number of elements in the array.
/// - Returns: A random array from the standard normal distribution.
public func randn(count: Int) -> RealArray {
    return GlobalRNG.shared.randn(count: count)
}

/// Control random number generator seed and algorithm.
///
/// - Parameters:
///   - seed: Seed for random number generator.
///   - generator: The type of random number generator to use.
public func rng(seed: UInt32, generator: String = "Default") {
    switch generator {
    case "Default":
            GlobalRNG.shared.setRNG(rng: DefaultRNG(seed: seed))
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
    return GlobalRNG.shared.seed
}
