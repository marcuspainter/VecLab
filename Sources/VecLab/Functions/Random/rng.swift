//
//  File.swift
//  
//
//  Created by Marcus Painter on 05/09/2024.
//

import Foundation

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
