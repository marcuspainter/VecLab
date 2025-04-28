//
//  ComplexDoubleArray+More.swift
//  VecLab
//
//  Created by Marcus Painter on 24/04/2025.
//

/*
extension ComplexDoubleArray {

    /// Returns a sorted array of the elements, using the given key path to compare values.
    @inlinable
    public func sorted<T: Comparable>(by key: (ComplexDouble) -> T) -> ComplexDoubleArray {
        let indices = self.indices.sorted { key(self[$0]) < key(self[$1]) }
        return ComplexDoubleArray(indices.map { self[$0] })
    }

    /// Returns the first `k` elements.
    @inlinable
    public func prefix(_ maxLength: Int) -> ComplexDoubleArray {
        ComplexDoubleArray(Array(self.prefix(maxLength)))
    }

    /// Returns the last `k` elements.
    @inlinable
    public func suffix(_ maxLength: Int) -> ComplexDoubleArray {
        ComplexDoubleArray(Array(self.suffix(maxLength)))
    }

    /// Returns the array without the first `k` elements.
    @inlinable
    public func dropFirst(_ k: Int) -> ComplexDoubleArray {
        ComplexDoubleArray(Array(self.dropFirst(k)))
    }

    /// Returns the array without the last `k` elements.
    @inlinable
    public func dropLast(_ k: Int) -> ComplexDoubleArray {
        ComplexDoubleArray(Array(self.dropLast(k)))
    }
}
 */

extension ComplexDoubleArray {
/*
    /// Returns the longest prefix satisfying the predicate.
    @inlinable
    public func prefix(while predicate: (ComplexDouble) -> Bool) -> ComplexDoubleArray {
        ComplexDoubleArray(Array(self.prefix(while: predicate)))
    }

    /// Returns a subsequence by skipping elements while the predicate returns true.
    @inlinable
    public func drop(while predicate: (ComplexDouble) -> Bool) -> ComplexDoubleArray {
        ComplexDoubleArray(Array(self.drop(while: predicate)))
    }
*/
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
/*
    /// Returns the first element matching the predicate.
    @inlinable
    public func first(where predicate: (ComplexDouble) -> Bool) -> ComplexDouble? {
        for element in self {
            if predicate(element) {
                return element
            }
        }
        return nil
    }
*/
    /// Returns the last element matching the predicate.
    @inlinable
    public func last(where predicate: (ComplexDouble) -> Bool) -> ComplexDouble? {
        for element in self.reversed() {
            if predicate(element) {
                return element
            }
        }
        return nil
    }
/*
    /// Returns true if any element matches the predicate.
    @inlinable
    public func contains(where predicate: (ComplexDouble) -> Bool) -> Bool {
        for element in self {
            if predicate(element) {
                return true
            }
        }
        return false
    }

    /// Returns true if all elements match the predicate.
    @inlinable
    public func allSatisfy(_ predicate: (ComplexDouble) -> Bool) -> Bool {
        for element in self {
            if !predicate(element) {
                return false
            }
        }
        return true
    }
*/
   
    
    /// Returns the index of the first element matching the predicate.
    @inlinable
    public func firstIndex(where predicate: (ComplexDouble) -> Bool) -> Int? {
        for (index, element) in self.enumerated() {
            if predicate(element) {
                return index
            }
        }
        return nil
    }

    /// Returns the index of the last element matching the predicate.
    @inlinable
    public func lastIndex(where predicate: (ComplexDouble) -> Bool) -> Int? {
        for (index, element) in self.enumerated().reversed() {
            if predicate(element) {
                return index
            }
        }
        return nil
    }
}

/*
extension ComplexDoubleArray {

    @inlinable
    public func min(by areInIncreasingOrder: (ComplexDouble, ComplexDouble) -> Bool) -> ComplexDouble? {
        guard !isEmpty else { return nil }
        var result = self[0]
        for element in dropFirst() {
            if areInIncreasingOrder(element, result) {
                result = element
            }
        }
        return result
    }

    @inlinable
    public func max(by areInIncreasingOrder: (ComplexDouble, ComplexDouble) -> Bool) -> ComplexDouble? {
        guard !isEmpty else { return nil }
        var result = self[0]
        for element in dropFirst() {
            if areInIncreasingOrder(result, element) {
                result = element
            }
        }
        return result
    }
}
*/

extension ComplexDoubleArray {

    @inlinable
    public func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, ComplexDouble) -> Result) -> Result {
        var result = initialResult
        for element in self {
            result = nextPartialResult(result, element)
        }
        return result
    }
}

/*
extension ComplexDoubleArray {

    @inlinable
    public func sorted(by areInIncreasingOrder: (ComplexDouble, ComplexDouble) -> Bool) -> ComplexDoubleArray {
        let sortedIndices = self.indices.sorted { areInIncreasingOrder(self[$0], self[$1]) }
        var realSorted = [Real]()
        var imagSorted = [Real]()
        realSorted.reserveCapacity(count)
        imagSorted.reserveCapacity(count)
        for i in sortedIndices {
            realSorted.append(real[i])
            imagSorted.append(imag[i])
        }
        return ComplexDoubleArray(realSorted, imagSorted)
    }
}
*/

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
    public func split(whereSeparator isSeparator: (ComplexDouble) -> Bool, omittingEmptySubsequences: Bool = true) -> [[ComplexDouble]] {
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
    public func splitToArrays(whereSeparator isSeparator: (ComplexDouble) -> Bool, omittingEmptySubsequences: Bool = true) -> [ComplexDoubleArray] {
        let grouped: [[ComplexDouble]] = self.split(whereSeparator: isSeparator, omittingEmptySubsequences: omittingEmptySubsequences)
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
            let realChunk = Array(real[start..<end])
            let imagChunk = Array(imag[start..<end])
            chunks.append(ComplexDoubleArray(realChunk, imagChunk))
            start += size
        }

        return chunks
    }
}

/*
extension ComplexDoubleArray {

    @inlinable
    public func drop(while predicate: (ComplexDouble) -> Bool) -> ComplexDoubleArray {
        var index = startIndex
        while index < endIndex && predicate(self[index]) {
            index += 1
        }
        return ComplexDoubleArray(real: Array(real[index...]), imag: Array(imag[index...]))
    }

    @inlinable
    public func prefix(while predicate: (ComplexDouble) -> Bool) -> ComplexDoubleArray {
        var index = startIndex
        while index < endIndex && predicate(self[index]) {
            index += 1
        }
        return ComplexDoubleArray(real: Array(real[..<index]), imag: Array(imag[..<index]))
    }

    @inlinable
    public func suffix(while predicate: (ComplexDouble) -> Bool) -> ComplexDoubleArray {
        var index = endIndex
        while index > startIndex && predicate(self[index - 1]) {
            index -= 1
        }
        return ComplexDoubleArray(real: Array(real[index...]), imag: Array(imag[index...]))
    }
}
*/


extension ComplexDoubleArray {

    @inlinable
    public func elementsEqual(_ other: ComplexDoubleArray, by areEquivalent: (ComplexDouble, ComplexDouble) -> Bool) -> Bool {
        guard self.count == other.count else { return false }
        for i in 0..<count {
            if !areEquivalent(self[i], other[i]) {
                return false
            }
        }
        return true
    }
}
