//
//  ComplexDoubleArray+More.swift
//  VecLab
//
//  Created by Marcus Painter on 24/04/2025.
//

extension ComplexDoubleArray {
    /// Returns an array of subsequences split by a predicate.
    @inlinable
    public func split(
        omittingEmptySubsequences: Bool = true,
        whereSeparator isSeparator: (ComplexDouble) -> Bool
    ) -> [ComplexDoubleArray] {
        Array(self).split(omittingEmptySubsequences: omittingEmptySubsequences, whereSeparator: isSeparator)
            .map { ComplexDoubleArray(Array($0)) }
    }

    /// Returns an array of at most `maxSplits + 1` subsequences, splitting by a predicate.
    @inlinable
    public func split(
        maxSplits: Int,
        omittingEmptySubsequences: Bool = true,
        whereSeparator isSeparator: (ComplexDouble) -> Bool
    ) -> [ComplexDoubleArray] {
        Array(self).split(
            maxSplits: maxSplits,
            omittingEmptySubsequences: omittingEmptySubsequences,
            whereSeparator: isSeparator
        ).map { ComplexDoubleArray(Array($0)) }
    }
}

extension ComplexDoubleArray {
    /// Returns the last element matching the predicate.
    @inlinable
    public func last(where predicate: (ComplexDouble) -> Bool) -> ComplexDouble? {
        for element in reversed() {
            if predicate(element) {
                return element
            }
        }
        return nil
    }

    /// Returns the index of the first element matching the predicate.
    @inlinable
    public func firstIndex(where predicate: (ComplexDouble) -> Bool) -> Int? {
        for (index, element) in enumerated() {
            if predicate(element) {
                return index
            }
        }
        return nil
    }

    /// Returns the index of the last element matching the predicate.
    @inlinable
    public func lastIndex(where predicate: (ComplexDouble) -> Bool) -> Int? {
        for (index, element) in enumerated().reversed() {
            if predicate(element) {
                return index
            }
        }
        return nil
    }
}

extension ComplexDoubleArray {
    @inlinable
    public func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, ComplexDouble) -> Result)
        -> Result {
        var result = initialResult
        for element in self {
            result = nextPartialResult(result, element)
        }
        return result
    }
}

extension ComplexDoubleArray {
    @inlinable
    public mutating func partition(by belongsInSecondPartition: (ComplexDouble) -> Bool) -> Int {
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

extension ComplexDoubleArray {
    @inlinable
    public func split(whereSeparator isSeparator: (ComplexDouble) -> Bool, omittingEmptySubsequences: Bool = true)
        -> [[ComplexDouble]] {
        var result: [[ComplexDouble]] = []
        var currentChunk: [ComplexDouble] = []

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
    public func splitToArrays(whereSeparator isSeparator: (ComplexDouble) -> Bool,
                              omittingEmptySubsequences: Bool = true) -> [ComplexDoubleArray] {
        let grouped: [[ComplexDouble]] = split(whereSeparator: isSeparator,
                                                omittingEmptySubsequences: omittingEmptySubsequences)
        return grouped.map { ComplexDoubleArray($0) }
    }
}

extension ComplexDoubleArray {
    @inlinable
    public func chunked(into size: Int) -> [ComplexDoubleArray] {
        precondition(size > 0, "Chunk size must be positive.")

        var chunks: [ComplexDoubleArray] = []
        var start = 0

        while start < count {
            let end = Swift.min(start + size, count)
            let realChunk = real[start ..< end]
            let imagChunk = imag[start ..< end]
            chunks.append(ComplexDoubleArray(realChunk, imagChunk))
            start += size
        }

        return chunks
    }
}

extension ComplexDoubleArray {
    @inlinable
    public func elementsEqual(_ other: ComplexDoubleArray, by areEquivalent: (ComplexDouble, ComplexDouble) -> Bool)
        -> Bool {
        guard count == other.count else { return false }
        for i in 0 ..< count {
            if !areEquivalent(self[i], other[i]) {
                return false
            }
        }
        return true
    }
}
