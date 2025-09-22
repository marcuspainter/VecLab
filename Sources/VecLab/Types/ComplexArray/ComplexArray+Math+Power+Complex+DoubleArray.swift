//
//  ComplexArray+Power+Complex+DoubleArray.swift
//  VecLab
//
//  Created by Marcus Painter on 22/09/2025.
//

// Result is a [Complex]

extension Array where Element == Complex {
    
    public static func ** (_ a: Complex, _ b: [Double]) -> [Complex] {
        return b.map { a ** $0 }
    }
    
    public static func ** (_ a: [Double], _ b: Complex) -> [Complex] {
        return a.map { $0 ** b}
    }
}
