//
//  File.swift
//  
//
//  Created by Marcus Painter on 26/08/2024.
//

import Foundation

public func freqz(_ b: RealArray, _ a: RealArray, N: Int = 512) -> ComplexArray {
    
    let bb = paddata(b, N*2)
    let aa = paddata(a, N*2)
    let H = fftr(bb)  / fftr(aa)
    let HH = slice(H, 0..<N)
    return HH
}

public func freqz2(_ b: RealArray, _ a: RealArray, N: Int = 512) -> ComplexArray {
    
    // Define the frequency range
    let w = linspace(0, .pi, N) // 512 points between 0 and pi
    
    // Initialize the frequency response
    var H = complex(count: N)
    
    // Compute the frequency response H(e^jw)
    for i in 0 ..< length(w) {
        // Evaluate the numerator and denominator polynomials at e^(-j*w[i])
        var numerator = complex()
        var denominator = complex()
        for k in 0 ..< length(b) {
            numerator = numerator + b[k] * exp(-Real.i * w[i] * Real(k))
        }
        for k in 0 ..< length(a) {
            denominator = denominator + a[k] * exp(-Real.i * w[i] * Real(k))
        }
        let HH = numerator / denominator;
        H.0[i] = HH.0
        H.1[i] = HH.1
    }
    return H
    

}



