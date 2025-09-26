//
//  SplitComplexArray+Range.swift
//  VecLab
//
//  Created by Marcus Painter on 18/04/2025.
//

import Foundation

// Moved to main SplitComplexArray+Collection.swift

// Returns concrete type SplitComplexArray not SubSequence

extension SplitComplexArray {

/// Access a range of complex elements
public subscript(bounds: Range<Int>) -> SplitComplexArray {
    get {
        precondition(bounds.lowerBound >= 0 && bounds.upperBound <= count, "Range out of bounds")
        var slice = SplitComplexArray()
        slice.real = Array(real[bounds])
        slice.imag = Array(imag[bounds])
        return slice
    }
    set {
        precondition(bounds.lowerBound >= 0 && bounds.upperBound <= count, "Range out of bounds")

        // Validate replacement size matches range size
        if bounds.count != newValue.count {
            print("ERROR: Replacement size must match range size: \(bounds.count) vs \(newValue.count)")
            return  // Exit without making changes
        }

        real.replaceSubrange(bounds, with: newValue.real)
        imag.replaceSubrange(bounds, with: newValue.imag)
    }
}

/// Access a closed range of complex elements
public subscript(bounds: ClosedRange<Int>) -> SplitComplexArray {
    get {
        precondition(bounds.lowerBound >= 0 && bounds.upperBound < count, "Range out of bounds")
        return self[bounds.lowerBound..<(bounds.upperBound + 1)]
    }
    set {
        precondition(bounds.lowerBound >= 0 && bounds.upperBound < count, "Range out of bounds")

        let halfOpenRange = bounds.lowerBound..<(bounds.upperBound + 1)

        // Validate replacement size matches range size
        if halfOpenRange.count != newValue.count {
            print("ERROR: Replacement size must match range size: \(halfOpenRange.count) vs \(newValue.count)")
            return  // Exit without making changes
        }

        self[halfOpenRange] = newValue
    }
}

/// Access a partial range from lower bound
public subscript(bounds: PartialRangeFrom<Int>) -> SplitComplexArray {
    get {
        precondition(bounds.lowerBound >= 0, "Lower bound must be non-negative")
        precondition(bounds.lowerBound < count, "Lower bound out of range")
        return self[bounds.lowerBound..<endIndex]
    }
    set {
        precondition(bounds.lowerBound >= 0, "Lower bound must be non-negative")
        precondition(bounds.lowerBound < count, "Lower bound out of range")

        let fullRange = bounds.lowerBound..<endIndex

        // Validate replacement size matches range size
        if fullRange.count != newValue.count {
            print("ERROR: Replacement size must match range size: \(fullRange.count) vs \(newValue.count)")
            return  // Exit without making changes
        }

        self[fullRange] = newValue
    }
}

/// Access a partial range up to upper bound
public subscript(bounds: PartialRangeUpTo<Int>) -> SplitComplexArray {
    get {
        precondition(bounds.upperBound >= 0, "Upper bound must be non-negative")
        precondition(bounds.upperBound <= count, "Upper bound out of range")
        return self[0..<bounds.upperBound]
    }
    set {
        precondition(bounds.upperBound >= 0, "Upper bound must be non-negative")
        precondition(bounds.upperBound <= count, "Upper bound out of range")

        let fullRange = 0..<bounds.upperBound

        // Validate replacement size matches range size
        if fullRange.count != newValue.count {
            print("ERROR: Replacement size must match range size: \(fullRange.count) vs \(newValue.count)")
            return  // Exit without making changes
        }

        self[fullRange] = newValue
    }
}

/// Access a partial range through upper bound
public subscript(bounds: PartialRangeThrough<Int>) -> SplitComplexArray {
    get {
        precondition(bounds.upperBound >= 0, "Upper bound must be non-negative")
        precondition(bounds.upperBound < count, "Upper bound out of range")
        return self[0...bounds.upperBound]
    }
    set {
        precondition(bounds.upperBound >= 0, "Upper bound must be non-negative")
        precondition(bounds.upperBound < count, "Upper bound out of range")

        let fullRange = 0...bounds.upperBound

        // Validate replacement size matches range size
        if (fullRange.upperBound - fullRange.lowerBound + 1) != newValue.count {
            print(
                "ERROR: Replacement size must match range size: \((fullRange.upperBound - fullRange.lowerBound + 1)) vs \(newValue.count)"
            )
            return  // Exit without making changes
        }

        self[fullRange] = newValue
    }
}

// Function to assert that two arrays have the same size
private func assertSameSize<T, U>(_ lhs: [T], _ rhs: [U]) {
    precondition(lhs.count == rhs.count, "Arrays must have the same size: \(lhs.count) vs \(rhs.count)")
}
}
