//
//  ComplexArray+More.swift
//  VecLab
//
//  Created by Marcus Painter on 24/04/2025.
//

extension ComplexArray {
    /// Returns an array of subsequences split by a predicate.
    @inlinable
    public func split(
        omittingEmptySubsequences: Bool = true,
        whereSeparator isSeparator: (Complex) -> Bool
    ) -> [ComplexArray] {
        Array(self).split(omittingEmptySubsequences: omittingEmptySubsequences, whereSeparator: isSeparator)
            .map { ComplexArray(Array($0)) }
    }

    /// Returns an array of at most `maxSplits + 1` subsequences, splitting by a predicate.
    @inlinable
    public func split(
        maxSplits: Int,
        omittingEmptySubsequences: Bool = true,
        whereSeparator isSeparator: (Complex) -> Bool
    ) -> [ComplexArray] {
        Array(self).split(
            maxSplits: maxSplits,
            omittingEmptySubsequences: omittingEmptySubsequences,
            whereSeparator: isSeparator
        ).map { ComplexArray(Array($0)) }
    }
}

extension ComplexArray {
    /// Returns the last element matching the predicate.
    @inlinable
    public func last(where predicate: (Complex) -> Bool) -> Complex? {
        for element in reversed() {
            if predicate(element) {
                return element
            }
        }
        return nil
    }

    /// Returns the index of the first element matching the predicate.
    @inlinable
    public func firstIndex(where predicate: (Complex) -> Bool) -> Int? {
        for (index, element) in enumerated() {
            if predicate(element) {
                return index
            }
        }
        return nil
    }

    /// Returns the index of the last element matching the predicate.
    @inlinable
    public func lastIndex(where predicate: (Complex) -> Bool) -> Int? {
        for (index, element) in enumerated().reversed() {
            if predicate(element) {
                return index
            }
        }
        return nil
    }
}

extension ComplexArray {
    @inlinable
    public func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Complex) -> Result)
        -> Result
    {
        var result = initialResult
        for element in self {
            result = nextPartialResult(result, element)
        }
        return result
    }
}

extension ComplexArray {
    @inlinable
    public mutating func partition(by belongsInSecondPartition: (Complex) -> Bool) -> Int {
        var low = startIndex
        var high = endIndex - 1

        while low <= high {
            while low <= high && !belongsInSecondPartition(self[low]) {
                low += 1
            }
            while low <= high && belongsInSecondPartition(self[high]) {
                high -= 1
            }
            if low < high {
                swapAt(low, high)
                low += 1
                high -= 1
            }
        }

        return low
    }
}

extension ComplexArray {
    @inlinable
    public func split(whereSeparator isSeparator: (Complex) -> Bool, omittingEmptySubsequences: Bool = true)
        -> [[Complex]]
    {
        var result: [[Complex]] = []
        var currentChunk: [Complex] = []

        for element in self {
            if isSeparator(element) {
                if !currentChunk.isEmpty || !omittingEmptySubsequences {
                    result.append(currentChunk)
                    currentChunk = []
                }
            } else {
                currentChunk.append(element)
            }
        }

        if !currentChunk.isEmpty || !omittingEmptySubsequences {
            result.append(currentChunk)
        }

        return result
    }

    @inlinable
    public func splitToArrays(
        whereSeparator isSeparator: (Complex) -> Bool,
        omittingEmptySubsequences: Bool = true
    ) -> [ComplexArray] {
        let grouped: [[Complex]] = split(
            whereSeparator: isSeparator,
            omittingEmptySubsequences: omittingEmptySubsequences
        )
        return grouped.map { ComplexArray($0) }
    }
}

extension ComplexArray {
    @inlinable
    public func chunked(into size: Int) -> [ComplexArray] {
        precondition(size > 0, "Chunk size must be positive.")

        var chunks: [ComplexArray] = []
        var start = 0

        while start < count {
            let end = Swift.min(start + size, count)
            let realChunk = real[start..<end]
            let imagChunk = imag[start..<end]
            chunks.append(ComplexArray(realChunk, imagChunk))
            start += size
        }

        return chunks
    }
}

extension ComplexArray {
    @inlinable
    public func elementsEqual(_ other: ComplexArray, by areEquivalent: (Complex, Complex) -> Bool)
        -> Bool
    {
        guard count == other.count else { return false }
        for i in 0..<count {
            if !areEquivalent(self[i], other[i]) {
                return false
            }
        }
        return true
    }
}
