//
//  ComplexVectorCore+Functions.swift
//  VecLab
//
//  Created by Marcus Painter on 20/09/2025.
//
import Foundation

extension ComplexVectorCore {
    
    public static func sin(_ a: [Complex]) -> [Complex] {
        return [Complex](unsafeUninitializedCapacity: a.count) { c, initializedCount in
            for i in 0..<a.count {
                c[i] = ComplexCore.sin(a[i])
            }
            initializedCount = a.count
        }
    }
}

