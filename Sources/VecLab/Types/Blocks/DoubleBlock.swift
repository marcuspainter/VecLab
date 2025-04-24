//
//  Blocks.swift
//  VecLab
//
//  Created by Marcus Painter on 24/04/2025.
//

import Accelerate

final public class DoubleBlock {
    
    var count: Int
    var buffer: UnsafeMutableBufferPointer<Double>!
 
    public init(count: Int) {
        self.count = count
        self.buffer = UnsafeMutableBufferPointer.allocate(capacity: count)
        self.buffer.initialize(repeating: 0.0)
    }
    
    public init(_ values: [Double]) {
        self.count = values.count
        self.buffer = UnsafeMutableBufferPointer.allocate(capacity: count)
        _ = self.buffer.initialize(from: values)
    }
    
    deinit {
        self.buffer.deallocate()
    }
    
    public var asArray: [Double] {
        return Array(self.buffer)
    }

    @discardableResult
    public func add (_ rhs: DoubleBlock) -> DoubleBlock {
        if self === rhs {
            print("NOOOOO!!!!")
        }
        
        let lhs = self
        vDSP_vaddD(lhs.buffer.baseAddress!, 1,
                  rhs.buffer.baseAddress!, 1,
                  lhs.buffer.baseAddress!, 1,
                  vDSP_Length(lhs.count))
        
        return self
    }
    
    @discardableResult
    public func mul (_ rhs: DoubleBlock) -> DoubleBlock {
        let lhs = self
        vDSP_vmulD(lhs.buffer.baseAddress!, 1,
                  rhs.buffer.baseAddress!, 1,
                  lhs.buffer.baseAddress!, 1,
                  vDSP_Length(lhs.count))
        
        return self
    }
}
