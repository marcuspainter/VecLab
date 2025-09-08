//
//  ComplexArray+Map.swift
//  VecLab
//
//  Created by Marcus Painter on 23/04/2025.
//

/*
 - Return type is ComplexArray or scalar where appropriate
 - Avoids [Complex]
 - Uses preallocation only when the size is known
 - Uses .append() when necessary
 - Any function that would normally involve [Complex] must return or use ComplexArray instead.
 */

import Foundation

extension ComplexArray {
    /// Returns a new `ComplexArray` containing the results of mapping the given transform.
    /// over this array’s elements.
    /// - Parameter transform: Transform closure.
    /// - Returns: A transformed array.
    public func map(_ transform: (Complex) -> Complex) -> ComplexArray {
        var result = ComplexArray(count: count)

        for i in 0..<count {
            let z = self[i]
            let mapped = transform(z)
            result[i] = mapped
        }
        return result
    }

    /// Returns a new `ComplexArray` containing the elements of this array
    /// that satisfy the given predicate.
    /// - Parameter isIncluded: Filter closure.
    /// - Returns: A filtered array.
    public func filter(_ isIncluded: (Complex) -> Bool) -> ComplexArray {
        var result = ComplexArray()

        for i in 0..<count {
            let z = self[i]
            if isIncluded(z) {
                result.append(z)
            }
        }
        return result
    }

    /// Returns a new `ComplexArray` containing the non-nil results of
    /// mapping the given transform over this array’s elements.
    /// - Parameter transform: Transform closure.
    /// - Returns: A transformed array.
    public func compactMap(_ transform: (Complex) -> Complex?) -> ComplexArray {
        var result = ComplexArray()

        for index in 0..<count {
            let z = self[index]
            if let mapped = transform(z) {
                result.append(mapped)
            }
        }
        return result
    }
}

extension ComplexArray {

    /// Returns a new `ComplexArray` containing the elements up to the first that does not satisfy the predicate.
    /// - Parameter predicate: Predicate closure.
    /// - Returns: A new array.
    public func prefix(while predicate: (Complex) -> Bool) -> ComplexArray {
        var result = ComplexArray()

        for i in 0..<count {
            let z = self[i]
            if !predicate(z) { break }
            result.append(z)
        }

        return result
    }

    /// Returns a new `ComplexArray` containing the elements from the first that fails the predicate.
    /// - Parameter predicate: Predicate closure.
    /// - Returns: A new array.
    public func drop(while predicate: (Complex) -> Bool) -> ComplexArray {
        var result = ComplexArray()
        var shouldDrop = true

        for i in 0..<count {
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

    /// Returns a new `ComplexArray` containing the first `n` elements.
    /// - Parameter maxLength: Maximum length.
    /// - Returns: A new array.
    public func prefix(_ maxLength: Int) -> ComplexArray {
        let n = Swift.min(maxLength, count)
        var result = ComplexArray(count: n)

        for i in 0..<n {
            result[i] = self[i]
        }

        return result
    }

    /// Returns a new `ComplexArray` containing the last `n` elements.
    /// - Parameter maxLength: Maximum length.
    /// - Returns: A new array.
    public func suffix(_ maxLength: Int) -> ComplexArray {
        let n = Swift.min(maxLength, count)
        let start = count - n
        var result = ComplexArray(count: n)

        for i in 0..<n {
            result[i] = self[start + i]
        }

        return result
    }

    /// Flattens and maps elements. Only non-nil results are included.
    /// - Parameter transform: Transform closure.
    /// - Returns: A new array.
    public func flatMap(_ transform: (Complex) -> ComplexArray) -> ComplexArray {
        var result = ComplexArray()

        for i in 0..<count {
            let subArray = transform(self[i])
            result.append(contentsOf: subArray)
        }

        return result
    }

    /// Returns a reversed `ComplexArray`.
    /// - Returns: An new array.
    public func reversed() -> ComplexArray {
        var result = ComplexArray(count: count)

        for i in 0..<count {
            result[i] = self[count - 1 - i]
        }

        return result
    }
}

extension ComplexArray {

    /// Splits the array into subsequences separated by elements matching the predicate.
    /// - Parameter isSeparator: Separator closure.
    /// - Returns: An array of arrays.
    public func split(whereSeparator isSeparator: (Complex) -> Bool) -> [ComplexArray] {
        var result: [ComplexArray] = []
        var current = ComplexArray()

        for i in 0..<count {
            let z = self[i]
            if isSeparator(z) {
                if !current.isEmpty {
                    result.append(current)
                    current = ComplexArray()
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
    public func chunked(size chunkSize: Int) -> [ComplexArray] {
        precondition(chunkSize > 0, "Chunk size must be greater than zero.")
        var result: [ComplexArray] = []
        var i = 0

        while i < count {
            let end = Swift.min(i + chunkSize, count)
            var chunk = ComplexArray(count: end - i)

            for j in i..<end {
                chunk[j - i] = self[j]
            }

            result.append(chunk)
            i += chunkSize
        }

        return result
    }

    /// Combines all values into a single `Complex` using the given closure.
    /// - Parameters:
    ///   - initialResult: Initial result.
    ///   - nextPartialResult: New partial result closure.
    /// - Returns: A new array.
    public func reduce(
        _ initialResult: Complex,
        _ nextPartialResult: (Complex, Complex) -> Complex
    ) -> Complex {
        var accumulator = initialResult

        for i in 0..<count {
            accumulator = nextPartialResult(accumulator, self[i])
        }

        return accumulator
    }

    /// Calls the given closure on each element in order.
    /// - Parameter body: Closure.
    public func forEach(_ body: (Complex) -> Void) {
        for i in 0..<count {
            body(self[i])
        }
    }
}

extension ComplexArray {
    /// Returns true if any element satisfies the given predicate.
    /// - Parameter predicate: Predicate closure.
    /// - Returns: A new array.
    public func contains(where predicate: (Complex) -> Bool) -> Bool {
        for i in 0..<count {
            if predicate(self[i]) {
                return true
            }
        }
        return false
    }

    /// Returns true if all elements satisfy the given predicate.
    /// - Parameter predicate: Predicate closure
    /// - Returns: A new array.
    public func allSatisfy(_ predicate: (Complex) -> Bool) -> Bool {
        for i in 0..<count {
            if !predicate(self[i]) {
                return false
            }
        }
        return true
    }

    /// Returns the first element that satisfies the given predicate, or nil if none.
    /// - Parameter predicate: Predicate closure.
    /// - Returns: The first element.
    public func first(where predicate: (Complex) -> Bool) -> Complex? {
        for i in 0..<count {
            let z = self[i]
            if predicate(z) {
                return z
            }
        }
        return nil
    }

    /// Returns a sorted `ComplexArray`, using the provided comparator.
    /// - Parameter areInIncreasingOrder: Sorting closure.
    /// - Returns: A new array.
    public func sorted(by areInIncreasingOrder: (Complex, Complex) -> Bool) -> ComplexArray {
        let sortedIndices = (0..<count).sorted { i, j in
            areInIncreasingOrder(self[i], self[j])
        }

        var result = ComplexArray(count: count)
        for (newIndex, sourceIndex) in sortedIndices.enumerated() {
            result[newIndex] = self[sourceIndex]
        }
        return result
    }
}

/*
 // Not needed
 extension ComplexArray {

     /// Returns a new `ComplexArray` by combining each element of `self` with the
     // corresponding element of `other`
     /// using the given transform.
     public func zip(
         with other: ComplexArray,
         _ transform: (Complex, Complex) -> Complex
     ) -> ComplexArray {
         let n = Swift.min(self.count, other.count)
         var result = ComplexArray(count: n)

         for i in 0..<n {
             let lhs = self[i]
             let rhs = other[i]
             result[i] = transform(lhs, rhs)
         }

         return result
     }
 }
 */

extension ComplexArray {

    /// Returns the minimum element using the given comparator.
    /// - Parameter areInIncreasingOrder: Comparator closure.
    /// - Returns: The minimum element.
    public func min(by areInIncreasingOrder: (Complex, Complex) -> Bool) -> Complex? {
        guard !isEmpty else { return nil }
        var best = self[0]
        for i in 1..<count {
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
    public func max(by areInIncreasingOrder: (Complex, Complex) -> Bool) -> Complex? {
        guard !isEmpty else { return nil }
        var best = self[0]
        for i in 1..<count {
            let candidate = self[i]
            if areInIncreasingOrder(best, candidate) {
                best = candidate
            }
        }
        return best
    }
}

extension ComplexArray {

    /// Returns a shuffled copy of the array.
    /// - Returns: A shuffled array.
    public func shuffled() -> ComplexArray {
        var indices = [Int](0..<count)
        indices.shuffle()

        var result = ComplexArray(count: count)
        for (i, originalIndex) in indices.enumerated() {
            result[i] = self[originalIndex]
        }

        return result
    }
}

extension ComplexArray {
    /// Partitions the array into two groups: those matching the predicate, and those that do not.
    /// Returns a new array with elements rearranged and the pivot index.
    /// - Parameter belongsInSecondPartition: Predicate closure.
    /// - Returns: A new array.
    public func partitioned(by belongsInSecondPartition: (Complex) -> Bool)
        -> (array: ComplexArray, pivot: Int)
    {
        var matching = ComplexArray()
        var nonMatching = ComplexArray()

        for i in 0..<count {
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

extension ComplexArray {

    /// Returns a new `ComplexArray` with duplicates removed, preserving order.
    /// - Returns: A new array.
    public func unique() -> ComplexArray {
        var seen = Set<Complex>()
        var result = ComplexArray()

        for i in 0..<count {
            let z = self[i]
            if seen.insert(z).inserted {
                result.append(z)
            }
        }

        return result
    }
}

extension ComplexArray {

    /// Removes duplicate elements in-place, preserving the original order.
    public mutating func removeDuplicates() {
        var seen = Set<Complex>()
        var newItems = ComplexArray()

        for i in 0..<count {
            let z = self[i]
            if seen.insert(z).inserted {
                newItems.append(z)
            }
        }

        // Mutating, assign value to self
        setValue(to: newItems)
    }
}

extension ComplexArray {

    /// Returns a sorted array by applying a key transform to each element.
    /// - Parameter key: Key.
    /// - Returns: A new array.
    public func sorted<T: Comparable>(by key: (Complex) -> T) -> ComplexArray {
        let sortedIndices = (0..<count).sorted { i, j in
            key(self[i]) < key(self[j])
        }

        var result = ComplexArray(count: count)
        for (newIndex, sourceIndex) in sortedIndices.enumerated() {
            result[newIndex] = self[sourceIndex]
        }

        return result
    }
}

extension ComplexArray {

    /// Drop elements.
    /// - Parameter n: Number.
    /// - Returns: A new array.
    public func dropFirst(_ n: Int = 1) -> ComplexArray {
        let n = Swift.min(n, count)
        let newCount = count - n
        var result = ComplexArray(count: newCount)
        for i in 0..<newCount {
            result[i] = self[i + n]
        }
        return result
    }

    /// Dtop last element.
    /// - Parameter n: Number.
    /// - Returns: A new array.
    public func dropLast(_ n: Int = 1) -> ComplexArray {
        let newCount = Swift.max(0, count - n)
        var result = ComplexArray(count: newCount)
        for i in 0..<newCount {
            result[i] = self[i]
        }
        return result
    }

    /// Join arrays
    /// - Parameter arrays: Array of arrays.
    /// - Returns: An array of joined arrays..
    public static func joined(_ arrays: [ComplexArray]) -> ComplexArray {
        let totalCount = arrays.reduce(0) { $0 + $1.count }
        var result = ComplexArray(count: totalCount)

        var index = 0
        for array in arrays {
            for i in 0..<array.count {
                result[index] = array[i]
                index += 1
            }
        }

        return result
    }

    /// Intersperse elements.
    /// - Parameter element: A complex number.
    /// - Returns: A new array.
    public func interspersed(with element: Complex) -> ComplexArray {
        guard count > 1 else { return self }

        let newCount = count * 2 - 1
        var result = ComplexArray(count: newCount)

        for i in 0..<count {
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
    public func cycled(count repeatCount: Int) -> ComplexArray {
        precondition(repeatCount >= 0, "Repeat count must be non-negative.")
        let totalCount = count * repeatCount
        var result = ComplexArray(count: totalCount)

        for i in 0..<repeatCount {
            for j in 0..<count {
                result[i * count + j] = self[j]
            }
        }

        return result
    }
}

extension ComplexArray {

    /// Returns a `ComplexArray` sorted by the magnitude of its elements.
    /// - Returns: A new array.
    public func sorted() -> ComplexArray {
        let sortedIndices = (0..<count).sorted { lhs, rhs in
            self[lhs].magnitude < self[rhs].magnitude
        }

        var result = ComplexArray(count: count)
        for (i, j) in sortedIndices.enumerated() {
            result[i] = self[j]
        }

        return result
    }
}

extension ComplexArray {

    /// Randomly shuffles an array.
    /// - Parameter generator: Random number generator.
    /// - Returns: A new array.
    public func shuffled<T: RandomNumberGenerator>(using generator: inout T) -> ComplexArray {
        var indices = [Int](0..<count)
        indices.shuffle(using: &generator)

        var result = ComplexArray(count: count)
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
    ) -> ComplexArray where C.Compared == Complex {
        let sortedIndices = (0..<count).sorted {
            comparator.compare(self[$0], self[$1]) == .orderedAscending
        }

        var result = ComplexArray(count: count)
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
    ) -> ComplexArray where S.Element == C, C.Compared == Complex {
        let sortedIndices = (0..<count).sorted {
            for comparator in comparators {
                let result = comparator.compare(self[$0], self[$1])
                if result != .orderedSame {
                    return result == .orderedAscending
                }
            }
            return false
        }

        var result = ComplexArray(count: count)
        for (i, j) in sortedIndices.enumerated() {
            result[i] = self[j]
        }

        return result
    }
}
