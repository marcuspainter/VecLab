//
//  CoreArray+Functions.swift
//  VecLab
//
//  Created by Marcus Painter on 20/09/2025.
//

import Foundation

extension CoreArray {

    @inlinable
    static func sin(_ a: [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i] = Darwin.sin(a[i])
            }
            initializedCount = a.count
        }
    }

    @inlinable
    static func sin2(_ a: [Double]) -> [Double] {
        var c = [Double](repeating: 0.0, count: a.count)
        for i in 0..<a.count {
            c[i] = Darwin.sin(a[i])
        }
        return c
    }
}
