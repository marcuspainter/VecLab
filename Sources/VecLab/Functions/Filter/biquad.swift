//
//  File.swift
//  
//
//  Created by Marcus Painter on 25/08/2024.
//

import Foundation

/// Biquad filter type
public enum BiquadType {
    case lowpass
    case highpass
    case highshelf
    case lowshelf
    case peak
    case notch
    case bandpassQ
    case bandpass0
    case allPass
}

/// Filter coefficients for biquad filter.
/// - Parameters:
///   - f: Frequency (Hz).
///   - fs: Sample rate (Hz).
///   - Q: Quality factor.
///   - dbGain: Gain (dB).
///   - type: ``BiquadType``
/// - Returns: (b, a) coefficients as a tuple.
public func biquad(f: Double, fs: Double, Q: Double, dbGain: Double, ftype: BiquadType) -> (b: [Double], a: [Double]) {
    // Fs = 48000
    // f0 = 1000
    // Q = sqrt(2)/2
    // dbGain = 15
    // type = .notch
    
    var f0 = f
    
    var A = sqrt( pow(10, dbGain/20) )
    //A = 10^(dbGain/40)     // (for peaking and shelving EQ filters only)
    
    if ftype == .lowshelf {
        A = sqrt( pow(10, dbGain/40) )
        f0 = f0 / sqrt(A)
    } else if ftype == .highshelf {
        A = sqrt( pow(10, dbGain/40) )
        f0 = f0 * sqrt(A)
    } else if ftype == .peak {
        A = sqrt( pow(10, dbGain/40) )
    }

    let W0 = 2 * .pi * f0 / fs
    let cosW0 = cos(W0)
    let sinW0 = sin(W0)
    
    let alpha = sinW0/(2*Q)                                 // case Q
    //let alpha = sinW0*sinh( ln(2)/2 * BW * w0/sinW0 )     // case: BW
    //let alpha = sinW0/2 * sqrt( (A + 1/A)*(1/S - 1) + 2 ) // case: S
    
    var b0 = 0.0
    var b1 = 0.0
    var b2 = 0.0
    var a0 = 0.0
    var a1 = 0.0
    var a2 = 0.0
    
    switch ftype {
        case .lowpass:  // H(s) = 1 / (s^2 + s/Q + 1)
            
            b0 =  (1 - cosW0)/2
            b1 =   1 - cosW0
            b2 =  (1 - cosW0)/2
            a0 =   1 + alpha
            a1 =  -2*cosW0
            a2 =   1 - alpha
            
        case .highpass:  //H(s) = s^2 / (s^2 + s/Q + 1)
            
            b0 =  (1 + cosW0)/2
            b1 = -(1 + cosW0)
            b2 =  (1 + cosW0)/2
            a0 =   1 + alpha
            a1 =  -2*cosW0
            a2 =   1 - alpha
            
        case .bandpassQ:  // H(s) = s / (s^2 + s/Q + 1)  (constant skirt gain, peak gain = Q)
            
            b0 =   sinW0/2 // =   Q*alpha
            b1 =   0
            b2 =  -sinW0/2 // =  -Q*alpha
            a0 =   1 + alpha
            a1 =  -2*cosW0
            a2 =   1 - alpha
            
        case .bandpass0: //  H(s) = (s/Q) / (s^2 + s/Q + 1)      (constant 0 dB peak gain)
            
            b0 =   alpha
            b1 =   0
            b2 =  -alpha
            a0 =   1 + alpha
            a1 =  -2*cosW0
            a2 =   1 - alpha
            
        case .notch:    // H(s) = (s^2 + 1) / (s^2 + s/Q + 1)
            
            b0 =   1
            b1 =  -2*cosW0
            b2 =   1
            a0 =   1 + alpha
            a1 =  -2*cosW0
            a2 =   1 - alpha
            
        case .allPass: // H(s) = (s^2 - s/Q + 1) / (s^2 + s/Q + 1)
            
            b0 =   1 - alpha
            b1 =  -2*cosW0
            b2 =   1 + alpha
            a0 =   1 + alpha
            a1 =  -2*cosW0
            a2 =   1 - alpha
            
        case .peak:    // H(s) = (s^2 + s*(A/Q) + 1) / (s^2 + s/(A*Q) + 1)
            
            b0 =   1 + alpha*A
            b1 =  -2*cosW0
            b2 =   1 - alpha*A
            a0 =   1 + alpha/A
            a1 =  -2*cosW0
            a2 =   1 - alpha/A
     
        case .lowshelf:    // H(s) = A * (s^2 + (sqrt(A)/Q)*s + A)/(A*s^2 + (sqrt(A)/Q)*s + 1)
            
            let sqrtA2alpha = 2 * sqrt(A) * alpha
            b0 =    A*( (A+1) - (A-1)*cosW0 + sqrtA2alpha )
            b1 =  2*A*( (A-1) - (A+1)*cosW0               )
            b2 =    A*( (A+1) - (A-1)*cosW0 - sqrtA2alpha )
            a0 =        (A+1) + (A-1)*cosW0 + sqrtA2alpha
            a1 =   -2*( (A-1) + (A+1)*cosW0               )
            a2 =        (A+1) + (A-1)*cosW0 - sqrtA2alpha
            
        case .highshelf:    // H(s) = A * (A*s^2 + (sqrt(A)/Q)*s + 1)/(s^2 + (sqrt(A)/Q)*s + A)
            
            let sqrtA2alpha = 2 * sqrt(A) * alpha
            b0 =    A*( (A+1) + (A-1)*cosW0 + sqrtA2alpha )
            b1 = -2*A*( (A-1) + (A+1)*cosW0               )
            b2 =    A*( (A+1) + (A-1)*cosW0 - sqrtA2alpha )
            a0 =        (A+1) - (A-1)*cosW0 + sqrtA2alpha
            a1 =    2*( (A-1) - (A+1)*cosW0               )
            a2 =        (A+1) - (A-1)*cosW0 - sqrtA2alpha

    }
    
    // Normalize with a0
    let b = [b0/a0, b1/a0, b2/a0]
    let a = [1, a1/a0, a2/a0]
    
    return (b, a)
}
