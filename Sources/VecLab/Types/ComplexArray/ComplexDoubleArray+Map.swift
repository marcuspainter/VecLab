//
//  ComplexDoubleArray+Map.swift
//  VecLab
//
//  Created by Marcus Painter on 23/04/2025.
//

/*
 - Return type is ComplexDoubleArray or scalar where appropriate
 - Avoids [ComplexDouble]
 - Uses preallocation only when the size is known
 - Uses .append() when necessary
 - Any function that would normally involve [ComplexDouble] must return or use ComplexDoubleArray instead.
 */

import Foundation

extension ComplexDoubleArray {
    /// Returns a new `ComplexDoubleArray` containing the results of mapping the given transform.
    /// over this array’s elements.
    /// - Parameter transform: Transform closure.
    /// - Returns: A transformed array.
    public func map(_ transform: (ComplexDouble) -> ComplexDouble) -> ComplexDoubleArray {
        var result = ComplexDoubleArray(count: count)

        for i in 0 ..< count {
            let z = self[i]
            let mapped = transform(z)
            result[i] = mapped
        }
        return result
    }

    /// Returns a new `ComplexDoubleArray` containing the elements of this array
    /// that satisfy the given predicate.
    /// - Parameter isIncluded: Filter closure.
    /// - Returns: A filtered array.
    public func filter(_ isIncluded: (ComplexDouble) -> Bool) -> ComplexDoubleArray {
        var result = ComplexDoubleArray()

        for i in 0 ..< count {
            let z = self[i]
            if isIncluded(z) {
                result.append(z)
            }
        }
        return result
    }

    /// Returns a new `ComplexDoubleArray` containing the non-nil results of
    /// mapping the given transform over this array’s elements.
    /// - Parameter transform: Transform closure.
    /// - Returns: A transformed array.
    public func compactMap(_ transform: (ComplexDouble) -> ComplexDouble?) -> ComplexDoubleArray {
        var result = ComplexDoubleArray()

        for index in 0 ..< count {
            let z = self[index]
            if let mapped = transform(z) {
                result.append(mapped)
            }
        }
        return result
    }
}

extension ComplexDoubleArray {

    /// Returns a new `ComplexDoubleArray` containing the elements up to the first that does not satisfy the predicate.
    /// - Parameter predicate: Predicate closure.
    /// - Returns: A new array.
    public func prefix(while predicate: (ComplexDouble) -> Bool) -> ComplexDoubleArray {
        var result = ComplexDoubleArray()

        for i in 0 ..< count {
            let z = self[i]
            if !predicate(z) { break }
            result.append(z)
        }

        return result
    }

    /// Returns a new `ComplexDoubleArray` containing the elements from the first that fails the predicate.
    /// - Parameter predicate: Predicate closure.
    /// - Returns: A new array.
    public func drop(while predicate: (ComplexDouble) -> Bool) -> ComplexDoubleArray {
        var result = ComplexDoubleArray()
        var shouldDrop = true

        for i in 0 ..< count {
            let z = self[i]
            if shouldDrop {
                if predicate(z) {
                    continue
                } else {
                    shouldDrop = false
                }
            }
            result.append(z)
        }

        return result
    }

    /// Returns a new `ComplexDoubleArray` containing the first `n` elements.
    /// - Parameter maxLength: Maximum length.
    /// - Returns: A new array.
    public func prefix(_ maxLength: Int) -> ComplexDoubleArray {
        let n = Swift.min(maxLength, count)
        var result = ComplexDoubleArray(count: n)

        for i in 0 ..< n {
            result[i] = self[i]
        }

        return result
    }

    /// Returns a new `ComplexDoubleArray` containing the last `n` elements.
    /// - Parameter maxLength: Maximum length.
    /// - Returns: A new array.
    public func suffix(_ maxLength: Int) -> ComplexDoubleArray {
        let n = Swift.min(maxLength, count)
        let start = count - n
        var result = ComplexDoubleArray(count: n)

        for i in 0 ..< n {
            result[i] = self[start + i]
        }

        return result
    }

    /// Flattens and maps elements. Only non-nil results are included.
    /// - Parameter transform: Transform closure.
    /// - Returns: A new array.
    public func flatMap(_ transform: (ComplexDouble) -> ComplexDoubleArray) -> ComplexDoubleArray {
        var result = ComplexDoubleArray()

        for i in 0 ..< count {
            let subArray = transform(self[i])
            result.append(contentsOf: subArray)
        }

        return result
    }

    /// Returns a reversed `ComplexDoubleArray`.
    /// - Returns: An new array.
    public func reversed() -> ComplexDoubleArray {
        var result = ComplexDoubleArray(count: count)

        for i in 0 ..< count {
            result[i] = self[count - 1 - i]
        }

        return result
    }
}

extension ComplexDoubleArray {

    /// Splits the array into subsequences separated by elements matching the predicate.
    /// - Parameter isSeparator: Separator closure.
    /// - Returns: An array of arrays.
    public func split(whereSeparator isSeparator: (ComplexDouble) -> Bool) -> [ComplexDoubleArray] {
        var result: [ComplexDoubleArray] = []
        var current = ComplexDoubleArray()

        for i in 0 ..< count {
            let z = self[i]
            if isSeparator(z) {
                if !current.isEmpty {
                    result.append(current)
                    current = ComplexDoubleArray()
                }
            } else {
                current.append(z)
            }
        }

        if !current.isEmpty {
            result.append(current)
        }

        return result
    }

    /// Splits the array into equally-sized chunks.
    /// - Parameter chunkSize: Chunk size.
    /// - Returns: A an array of arrays
    public func chunked(size chunkSize: Int) -> [ComplexDoubleArray] {
        precondition(chunkSize > 0, "Chunk size must be greater than zero.")
        var result: [ComplexDoubleArray] = []
        var i = 0

        while i < count {
            let end = Swift.min(i + chunkSize, count)
            var chunk = ComplexDoubleArray(count: end - i)

            for j in i ..< end {
                chunk[j - i] = self[j]
            }

            result.append(chunk)
            i += chunkSize
        }

        return result
    }

    /// Combines all values into a single `ComplexDouble` using the given closure.
    /// - Parameters:
    ///   - initialResult: Initial result.
    ///   - nextPartialResult: New partial result closure.
    /// - Returns: A new array.
    public func reduce(
        _ initialResult: ComplexDouble,
        _ nextPartialResult: (ComplexDouble, ComplexDouble) -> ComplexDouble
    ) -> ComplexDouble {
        var accumulator = initialResult

        for i in 0 ..< count {
            accumulator = nextPartialResult(accumulator, self[i])
        }

        return accumulator
    }

    /// Calls the given closure on each element in order.
    /// - Parameter body: Closure.
    public func forEach(_ body: (ComplexDouble) -> Void) {
        for i in 0 ..< count {
            body(self[i])
        }
    }
}

extension ComplexDoubleArray {
    /// Returns true if any element satisfies the given predicate.
    /// - Parameter predicate: Predicate closure.
    /// - Returns: A new array.
    public func contains(where predicate: (ComplexDouble) -> Bool) -> Bool {
        for i in 0 ..< count {
            if predicate(self[i]) {
                return true
            }
        }
        return false
    }

    /// Returns true if all elements satisfy the given predicate.
    /// - Parameter predicate: Predicate closure
    /// - Returns: A new array.
    public func allSatisfy(_ predicate: (ComplexDouble) -> Bool) -> Bool {
        for i in 0 ..< count {
            if !predicate(self[i]) {
                return false
            }
        }
        return true
    }

    /// Returns the first element that satisfies the given predicate, or nil if none.
    /// - Parameter predicate: Predicate closure.
    /// - Returns: The first element.
    public func first(where predicate: (ComplexDouble) -> Bool) -> ComplexDouble? {
        for i in 0 ..< count {
            let z = self[i]
            if predicate(z) {
                return z
            }
        }
        return nil
    }

    /// Returns a sorted `ComplexDoubleArray`, using the provided comparator.
    /// - Parameter areInIncreasingOrder: Sorting closure.
    /// - Returns: A new array.
    public func sorted(by areInIncreasingOrder: (ComplexDouble, ComplexDouble) -> Bool) -> ComplexDoubleArray {
        let sortedIndices = (0 ..< count).sorted { i, j in
            areInIncreasingOrder(self[i], self[j])
        }

        var result = ComplexDoubleArray(count: count)
        for (newIndex, sourceIndex) in sortedIndices.enumerated() {
            result[newIndex] = self[sourceIndex]
        }
        return result
    }
}

/*
 // Not needed
 extension ComplexDoubleArray {

     /// Returns a new `ComplexDoubleArray` by combining each element of `self` with the corresponding element of `other`
     /// using the given transform.
     public func zip(
         with other: ComplexDoubleArray,
         _ transform: (ComplexDouble, ComplexDouble) -> ComplexDouble
     ) -> ComplexDoubleArray {
         let n = Swift.min(self.count, other.count)
         var result = ComplexDoubleArray(count: n)

         for i in 0..<n {
             let lhs = self[i]
             let rhs = other[i]
             result[i] = transform(lhs, rhs)
         }

         return result
     }
 }
 */

extension ComplexDoubleArray {

    /// Returns the minimum element using the given comparator.
    /// - Parameter areInIncreasingOrder: Comparator closure.
    /// - Returns: The minimum element.
    public func min(by areInIncreasingOrder: (ComplexDouble, ComplexDouble) -> Bool) -> ComplexDouble? {
        guard !isEmpty else { return nil }
        var best = self[0]
        for i in 1 ..< count {
            let candidate = self[i]
            if areInIncreasingOrder(candidate, best) {
                best = candidate
            }
        }
        return best
    }

    /// Returns the maximum element using the given comparator.
    /// - Parameter areInIncreasingOrder: Comparator closure.
    /// - Returns: The maximum element.
    public func max(by areInIncreasingOrder: (ComplexDouble, ComplexDouble) -> Bool) -> ComplexDouble? {
        guard !isEmpty else { return nil }
        var best = self[0]
        for i in 1 ..< count {
            let candidate = self[i]
            if areInIncreasingOrder(best, candidate) {
                best = candidate
            }
        }
        return best
    }
}

extension ComplexDoubleArray {

    /// Returns a shuffled copy of the array.
    /// - Returns: A shuffled array.
    public func shuffled() -> ComplexDoubleArray {
        var indices = [Int](0 ..< count)
        indices.shuffle()

        var result = ComplexDoubleArray(count: count)
        for (i, originalIndex) in indices.enumerated() {
            result[i] = self[originalIndex]
        }

        return result
    }
}

extension ComplexDoubleArray {
    /// Partitions the array into two groups: those matching the predicate, and those that do not.
    /// Returns a new array with elements rearranged and the pivot index.
    /// - Parameter belongsInSecondPartition: Predicate closure.
    /// - Returns: A new array.
    public func partitioned(by belongsInSecondPartition: (ComplexDouble) -> Bool) -> (array: ComplexDoubleArray, pivot: Int) {
        var matching = ComplexDoubleArray()
        var nonMatching = ComplexDoubleArray()

        for i in 0 ..< count {
            let z = self[i]
            if belongsInSecondPartition(z) {
                nonMatching.append(z)
            } else {
                matching.append(z)
            }
        }

        let pivot = matching.count
        // Now append non-matching array
        matching.append(contentsOf: nonMatching)

        return (matching, pivot)
    }
}

extension ComplexDoubleArray {

    /// Returns a new `ComplexDoubleArray` with duplicates removed, preserving order.
    /// - Returns: A new array.
    public func unique() -> ComplexDoubleArray {
        var seen = Set<ComplexDouble>()
        var result = ComplexDoubleArray()

        for i in 0 ..< count {
            let z = self[i]
            if seen.insert(z).inserted {
                result.append(z)
            }
        }

        return result
    }
}

extension ComplexDoubleArray {

    /// Removes duplicate elements in-place, preserving the original order.
    public mutating func removeDuplicates() {
        var seen = Set<ComplexDouble>()
        var newItems = ComplexDoubleArray()

        for i in 0 ..< count {
            let z = self[i]
            if seen.insert(z).inserted {
                newItems.append(z)
            }
        }

        // Mutating, assign value to self
        setValue(to: newItems)
    }
}

extension ComplexDoubleArray {

    /// Returns a sorted array by applying a key transform to each element.
    /// - Parameter key: Key.
    /// - Returns: A new array.
    public func sorted<T: Comparable>(by key: (ComplexDouble) -> T) -> ComplexDoubleArray {
        let sortedIndices = (0 ..< count).sorted { i, j in
            key(self[i]) < key(self[j])
        }

        var result = ComplexDoubleArray(count: count)
        for (newIndex, sourceIndex) in sortedIndices.enumerated() {
            result[newIndex] = self[sourceIndex]
        }

        return result
    }
}

extension ComplexDoubleArray {

    /// Drop elements.
    /// - Parameter n: Number.
    /// - Returns: A new array.
    public func dropFirst(_ n: Int = 1) -> ComplexDoubleArray {
        let n = Swift.min(n, count)
        let newCount = count - n
        var result = ComplexDoubleArray(count: newCount)
        for i in 0 ..< newCount {
            result[i] = self[i + n]
        }
        return result
    }

    /// Dtop last element.
    /// - Parameter n: Number.
    /// - Returns: A new array.
    public func dropLast(_ n: Int = 1) -> ComplexDoubleArray {
        let newCount = Swift.max(0, count - n)
        var result = ComplexDoubleArray(count: newCount)
        for i in 0 ..< newCount {
            result[i] = self[i]
        }
        return result
    }

    /// Join arrays
    /// - Parameter arrays: Array of arrays.
    /// - Returns: An array of joined arrays..
    public static func joined(_ arrays: [ComplexDoubleArray]) -> ComplexDoubleArray {
        let totalCount = arrays.reduce(0) { $0 + $1.count }
        var result = ComplexDoubleArray(count: totalCount)

        var index = 0
        for array in arrays {
            for i in 0 ..< array.count {
                result[index] = array[i]
                index += 1
            }
        }

        return result
    }

    /// Intersperse elements.
    /// - Parameter element: A complex number.
    /// - Returns: A new array.
    public func interspersed(with element: ComplexDouble) -> ComplexDoubleArray {
        guard count > 1 else { return self }

        let newCount = count * 2 - 1
        var result = ComplexDoubleArray(count: newCount)

        for i in 0 ..< count {
            result[i * 2] = self[i]
            if i < count - 1 {
                result[i * 2 + 1] = element
            }
        }

        return result
    }

    /// Cycle array.
    /// - Parameter repeatCount: Reapeat count.
    /// - Returns: A new array.
    public func cycled(count repeatCount: Int) -> ComplexDoubleArray {
        precondition(repeatCount >= 0, "Repeat count must be non-negative.")
        let totalCount = count * repeatCount
        var result = ComplexDoubleArray(count: totalCount)

        for i in 0 ..< repeatCount {
            for j in 0 ..< count {
                result[i * count + j] = self[j]
            }
        }

        return result
    }
}

extension ComplexDoubleArray {

    /// Returns a `ComplexDoubleArray` sorted by the magnitude of its elements.
    /// - Returns: A new array.
    public func sorted() -> ComplexDoubleArray {
        let sortedIndices = (0 ..< count).sorted { lhs, rhs in
            self[lhs].magnitude < self[rhs].magnitude
        }

        var result = ComplexDoubleArray(count: count)
        for (i, j) in sortedIndices.enumerated() {
            result[i] = self[j]
        }

        return result
    }
}

extension ComplexDoubleArray {

    /// Randomly shuffles an array.
    /// - Parameter generator: Random number generator.
    /// - Returns: A new array.
    public func shuffled<T: RandomNumberGenerator>(using generator: inout T) -> ComplexDoubleArray {
        var indices = [Int](0 ..< count)
        indices.shuffle(using: &generator)

        var result = ComplexDoubleArray(count: count)
        for (i, j) in indices.enumerated() {
            result[i] = self[j]
        }

        return result
    }

    /// Sort with comparator.
    /// - Parameter comparator: Sort comparator.
    /// - Returns: A new array.
    @available(macOS 13.0, iOS 16.0, *)
    public func sorted<C: SortComparator>(
        using comparator: C
    ) -> ComplexDoubleArray where C.Compared == ComplexDouble {
        let sortedIndices = (0 ..< count).sorted {
            comparator.compare(self[$0], self[$1]) == .orderedAscending
        }

        var result = ComplexDoubleArray(count: count)
        for (i, j) in sortedIndices.enumerated() {
            result[i] = self[j]
        }

        return result
    }

    /// Sort
    /// - Parameter comparators: Comparators.
    /// - Returns: A new array.
    @available(macOS 13.0, iOS 16.0, *)
    public func sorted<S: Sequence, C: SortComparator>(
        using comparators: S
    ) -> ComplexDoubleArray where S.Element == C, C.Compared == ComplexDouble {
        let sortedIndices = (0 ..< count).sorted {
            for comparator in comparators {
                let result = comparator.compare(self[$0], self[$1])
                if result != .orderedSame {
                    return result == .orderedAscending
                }
            }
            return false
        }

        var result = ComplexDoubleArray(count: count)
        for (i, j) in sortedIndices.enumerated() {
            result[i] = self[j]
        }

        return result
    }
}
