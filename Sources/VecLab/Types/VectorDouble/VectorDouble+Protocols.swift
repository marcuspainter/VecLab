//
//  Vectordouble+Protocols.swift
//  VecLab
//
//  Created by Marcus Painter on 23/04/2025.
//

import Foundation

// MARK: - Equatable & Hashable Conformance

extension VectorDouble: Equatable {
    public static func == (lhs: VectorDouble, rhs: VectorDouble) -> Bool {
        guard lhs.count == rhs.count else { return false }
        
        return lhs.withUnsafeBufferPointer { lhsPtr in
            rhs.withUnsafeBufferPointer { rhsPtr in
                for i in 0..<lhs.count {
                    if lhsPtr[i] != rhsPtr[i] {
                        return false
                    }
                }
                return true
            }
        }
    }
}

extension VectorDouble: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(count)
        withUnsafeBufferPointer { buffer in
            for element in buffer {
                hasher.combine(element)
            }
        }
    }
}

// MARK: - Codable Conformance

extension VectorDouble: Codable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(asArray())
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let values = try container.decode([Double].self)
        self.init(values: values)
    }
}

// MARK: - Sendable Conformance
//extension VectorDouble: Sendable {}

// MARK: - CustomStringConvertible Conformance

extension VectorDouble: CustomStringConvertible {
    public var description: String {
        let maxDisplayCount = 10
        let elementsToShow = prefix(maxDisplayCount).map { String(describing: $0) }.joined(separator: ", ")
        
        if count > maxDisplayCount {
            return "VectorDouble[\(count)] [\(elementsToShow), ...]"
        } else {
            return "VectorDouble[\(count)] [\(elementsToShow)]"
        }
    }
}

// MARK: - ExpressibleByArrayLiteral Conformance

extension VectorDouble: ExpressibleByArrayLiteral {
    public convenience init(arrayLiteral elements: Double...) {
        self.init(values: elements)
    }
}
