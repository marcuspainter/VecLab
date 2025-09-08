//
//  Array+Unary.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

extension Array where Element == Complex {
    
    static prefix func - (_ a: [Complex]) -> [Complex] {
        return a.map { -$0 }
    }
}
