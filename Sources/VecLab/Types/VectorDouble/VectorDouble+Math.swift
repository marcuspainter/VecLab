//
//  VectorDouble+Math.swift
//  VecLab
//
//  Created by Marcus Painter on 24/04/2025.
//

import Foundation
import Accelerate

extension VectorDouble: AdditiveArithmetic {
    public static var zero: VectorDouble {
        return VectorDouble(count: 0)
    }
    
    public static func zero(count: Int) -> VectorDouble {
        return VectorDouble(count: count)
    }
    
    public static func + (lhs: VectorDouble, rhs: VectorDouble) -> VectorDouble {
        precondition(lhs.count == rhs.count, "Vectors must have the same size")
        
        let result = VectorDouble(count: lhs.count)
        vDSP_vaddD(lhs.buffer.baseAddress!, 1,
                  rhs.buffer.baseAddress!, 1,
                  result.buffer.baseAddress!, 1,
                  vDSP_Length(lhs.count))
        
        return result
    }
    
    public static func - (lhs: VectorDouble, rhs: VectorDouble) -> VectorDouble {
        precondition(lhs.count == rhs.count, "Vectors must have the same size")
        
        let result = VectorDouble(count: lhs.count)
        vDSP_vsubD(rhs.buffer.baseAddress!, 1,
                  lhs.buffer.baseAddress!, 1,
                  result.buffer.baseAddress!, 1,
                  vDSP_Length(lhs.count))
        
        return result
    }
    
    public func add(_ other: VectorDouble) {
        precondition(count == other.count, "Vectors must have the same size")
        
        vDSP_vaddD(buffer.baseAddress!, 1,
                  other.buffer.baseAddress!, 1,
                  buffer.baseAddress!, 1,
                  vDSP_Length(count))
    }
    
    public func subtract(_ other: VectorDouble) {
        precondition(count == other.count, "Vectors must have the same size")
        
        vDSP_vsubD(other.buffer.baseAddress!, 1,
                  buffer.baseAddress!, 1,
                  buffer.baseAddress!, 1,
                  vDSP_Length(count))
    }
}
