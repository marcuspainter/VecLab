//
//  cplxpair.swift
//
//
//  Created by Marcus Painter on 09/09/2023.
//

import Foundation

/// Sort complex numbers into complex conjugate pairs.
///
/// - Parameters:
///   - A: Complex array.
///   - tol: tolerance.
/// - Returns:An array of sorted pairs
public func cplxpair(_ A: ComplexArray, tol: Real = 1e-6) -> ComplexArray {
    // Ensure that a one-element array returns itself.
    guard A.0.count > 1 else { return ([A.0.first!], [A.1.first!]) }

    // Allocate memory for the output arrays.
    var realPaired = RealArray(repeating: 0, count: A.0.count)
    var imagPaired = RealArray(repeating: 0, count: A.1.count)

    // Create an array to keep track of which complex numbers have been paired.
    var pairedIndices: [Bool] = Array(repeating: false, count: A.0.count)

    var pairedCount = 0

    // Iterate over each complex number in the array.
    for index in 0 ..< A.0.count {
        // If the current number has already been paired, skip it.
        if pairedIndices[index] { continue }

        // Search for a conjugate match for the current number.
        if let matchIndex = A.0.indices.first(where: {
            !pairedIndices[$0] &&
                isApproximatelyEqualTo(A, (A.0[index], -A.1[index]), tol: tol, at: $0)
        }) {
            // Add the number and its match to the output only once based on the order of indices.
            if index < matchIndex {
                realPaired[pairedCount] = A.0[index]
                imagPaired[pairedCount] = A.1[index]
                pairedCount += 1

                realPaired[pairedCount] = A.0[matchIndex]
                imagPaired[pairedCount] = A.1[matchIndex]
                pairedCount += 1
            }

            // Mark the current number and its match as paired.
            pairedIndices[index] = true
            pairedIndices[matchIndex] = true
        } else {
            // If no match was found for the current number, add it to the output.
            realPaired[pairedCount] = A.0[index]
            imagPaired[pairedCount] = A.1[index]
            pairedCount += 1

            pairedIndices[index] = true
        }
    }

    // Resize the output arrays to match the number of paired complex numbers.
    realPaired = Array(realPaired[..<pairedCount])
    imagPaired = Array(imagPaired[..<pairedCount])

    // Issue a warning if some complex numbers couldn't be paired.
    if pairedCount != A.0.count {
        print("Warning: Some complex numbers are unpaired.")
    }

    return (realPaired, imagPaired)
}

func isApproximatelyEqualTo(_ complex: ComplexArray, _ other: Complex, tol: Real, at index: Int) -> Bool {
    return abs(complex.0[index] - other.0) <= tol && abs(complex.1[index] + other.1) <= tol
}
