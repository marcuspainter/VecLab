//
//  VectorCore+Functions.swift
//  VecLab
//
//  Created by Marcus Painter on 20/09/2025.
//

import Foundation
import simd

extension VectorCore {
    
    @inlinable
    public static func sin(_ a: [Double]) -> [Double] {
        return [Double](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i] = Darwin.sin(a[i])
            }
            initializedCount = a.count
        }
    }
}
