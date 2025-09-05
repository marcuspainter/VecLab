//
//  sort.swift
//  VecLab
//
//  Created by Marcus Painter on 05/09/2025.
//

import Foundation

public enum SortOder {
    case ascending
    case descending
}

/// Sort array.
/// - Parameters:
///   - x: Real array.
///   - order: Sort order.
/// - Returns: A sorted array.
public func sort(_ x: RealArray, order: SortOder = .ascending) -> RealArray {
    switch order {
    case .ascending:
        return x.sorted()
    case .descending:
        return x.sorted(by: >)
    }
}

/// Sort complex array.
/// - Parameters:
///   - x: Complex array.
///   - order: Sort order.
/// - Returns: A sorted complex array.
public func sort(_ x: ComplexArray, order: SortOder = .ascending) -> ComplexArray {
    switch order {
    case .ascending:
        return x.sorted { a, b in
            let magA = sqrt(a.real * a.real + a.imag * a.imag)
            let magB = sqrt(b.real * b.real + b.imag * b.imag)
            if magA != magB {
                return magA < magB
            }
            // Tie-break by phase (atan2 returns (-π, π])
            let phaseA = atan2(a.imag, a.real)
            let phaseB = atan2(b.imag, b.real)
            return phaseA < phaseB
        }

    case .descending:
        return x.sorted { a, b in
            let magA = sqrt(a.real * a.real + a.imag * a.imag)
            let magB = sqrt(b.real * b.real + b.imag * b.imag)
            if magA != magB {
                return magA > magB
            }
            // Tie-break by phase (atan2 returns (-π, π])
            let phaseA = atan2(a.imag, a.real)
            let phaseB = atan2(b.imag, b.real)
            return phaseA > phaseB
        }
    }
}

fileprivate func matlabSort2(_ arr: ComplexArray) -> ComplexArray {
    return arr.sorted { a, b in
        let magA = sqrt(a.real * a.real + a.imag * a.imag)
        let magB = sqrt(b.real * b.real + b.imag * b.imag)
        if magA != magB {
            return magA < magB
        }
        // Tie-break by phase (atan2 returns (-π, π])
        let phaseA = atan2(a.imag, a.real)
        let phaseB = atan2(b.imag, b.real)
        return phaseA < phaseB
    }
}
