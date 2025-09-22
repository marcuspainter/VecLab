//
//  Matrix+ExpressibleByStringLiteral.swift
//  VecLab
//
//  Created by Marcus Painter on 19/09/2025.
//

import Foundation

extension Matrix: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String

    public init(stringLiteral text: String) {
        if let grid = parseMatrix(text) {
            self = Self.init(grid)
            return
        }
        self = Self.init()
    }
}

func parseMatrixMatlab(_ matrixStr: String) -> [[Double]]? {
    // Must have brackets
    guard matrixStr.hasPrefix("[") && matrixStr.hasSuffix("]") else {
        return nil
    }

    let inner = String(matrixStr.dropFirst().dropLast())

    // Empty matrix is valid
    if inner.trimmingCharacters(in: .whitespaces).isEmpty {
        return []
    }

    let rows = inner.components(separatedBy: ";")
    var matrix: [[Double]] = []
    var columnCount: Int?

    for row in rows {
        let trimmed = row.trimmingCharacters(in: .whitespaces)

        // Empty rows are invalid
        if trimmed.isEmpty {
            return nil
        }

        // Split by both spaces and commas
        let tokens = trimmed.components(separatedBy: CharacterSet(charactersIn: " \t,"))
            .filter { !$0.isEmpty }

        let numbers = tokens.compactMap { Double($0) }

        // If any token failed to parse as Double, fail
        if numbers.count != tokens.count {
            print("Failed to parse")
            return nil
        }

        // All rows must have same number of columns
        if let expected = columnCount {
            if numbers.count != expected {
                print("Unequal column counts")
                return nil
            }
        } else {
            columnCount = numbers.count
        }

        matrix.append(numbers)
    }

    return matrix
}

func parseMatrix(_ matrixStr: String) -> [[Double]]? {
    let lines = matrixStr.components(separatedBy: .newlines)
        .map { $0.trimmingCharacters(in: .whitespaces) }
        .filter { !$0.isEmpty }

    guard !lines.isEmpty else { return [] }

    var matrix: [[Double]] = []
    var columnCount: Int?

    for line in lines {
        // Split by spaces, tabs, and commas
        let tokens = line.components(separatedBy: CharacterSet(charactersIn: " \t,"))
            .filter { !$0.isEmpty }

        let numbers = tokens.compactMap { Double($0) }

        // If any token failed to parse, fail
        if numbers.count != tokens.count {
            print("Failed to parse line: \(line)")
            return nil
        }

        // Check consistent column count
        if let expected = columnCount {
            if numbers.count != expected {
                print("Unequal column counts")
                return nil
            }
        } else {
            columnCount = numbers.count
        }

        matrix.append(numbers)
    }

    return matrix
}

/*

   1.0e+03 *

   9.9990 + 0.0010i   0.0020 + 0.0020i
  -0.0030 + 0.0030i  -0.0040 + 0.0040i
121234567890123456 121234567890123456
*/
