//
//  DelayBlock.swift
//  VecLab
//
//  Created by Marcus Painter on 17/09/2025.
//

public final class DelayBlock {
    var delayLength: Int = 0
    var delayIndex: Int = 0
    var delayBuffer: [Double] = []
    
    public init(length delayLength: Int) {
        self.delayLength = delayLength
        self.delayBuffer = [Double](repeating: 0.0, count: delayLength)
    }
    
    public func process(_ input: Double) -> Double {
        let z = delayBuffer[self.delayIndex]
        self.delayBuffer[self.delayIndex] = input
        self.delayIndex = self.delayIndex < self.delayLength - 1 ? (self.delayIndex + 1) : 0
        return z
    }
    
    public func reset() {
        self.delayIndex = 0
        self.delayBuffer = [Double](repeating: 0.0, count: self.delayLength)
    }
}
