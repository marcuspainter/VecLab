//
//  SampleArray.swift
//  VecLab
//
//  Created by Marcus Painter on 20/04/2025.
//

public struct SampleArray {
    public var x: [Int]
    
    public init() {
        self.x = []
    }
    
    public init(x: [Int]) {
        self.x = x
    }
}

extension SampleArray: MutableCollection {
    public typealias Element = Int
    public typealias Index = Int
    public typealias Indices = Range<Index>
    
    public subscript(index: Index) -> Element {
        get {
            return x[index]
        }
        set {
            x[index] = newValue
        }
    }
    
    public func index(after i: Index) -> Index {
        return i + 1
    }
    
    public var startIndex: Index {
        return 0
    }
    
    public var endIndex: Index {
        return x.count
    }
    
    // Default implementations of count, isEmpty, forEach
}

extension SampleArray: RangeReplaceableCollection {
    
    public mutating func replaceSubrange<C: Collection>(_ subrange: Range<Int>, with newElements: C)
    where C.Element == Element {
        
        precondition(subrange.lowerBound >= 0 && subrange.upperBound <= count, "Range out of bounds")
        
        let newValues = newElements.map { $0 }
        
        x.replaceSubrange(subrange, with: newValues)
    }
    
    // Default implementations of append, insert, remove, etc.
    
    // Override these if you don't want the default append behaviour
    
    public static func + (lhs: SampleArray, rhs: SampleArray) -> SampleArray {
        return SampleArray(x: lhs.x + rhs.x)
    }
    
    public static func += (lhs: inout SampleArray, rhs: SampleArray)  {
        lhs.x =  lhs.x + rhs.x
    }
}

// Enables backward iteration (e.g., index(before:)).
extension SampleArray: BidirectionalCollection {
    
    public func index(before i: Index) -> Index {
        x.index(before: i)
    }
    
}

// No new requirements, but Swift now assumes that indexing is O(1):
extension SampleArray: RandomAccessCollection { }

// Compares two arrays for equality.
extension SampleArray: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.x == rhs.x
    }
}

// Allows use in sets and dictionaries.
extension SampleArray: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
    }
}

// Controls print() output.
extension SampleArray: CustomStringConvertible {
    public var description: String {
        return self.x.description
    }
}

// Supports JSON and binary encoding.
extension SampleArray: Codable {}

extension SampleArray: Sendable {}
