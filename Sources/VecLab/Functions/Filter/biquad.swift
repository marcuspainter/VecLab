//
//  biquad.swift
//
//
//  Created by Marcus Painter on 25/08/2024.
//

import Foundation

/// Biquad filter type
public enum BiquadType {
    /// Low pass.
    case lowpass
    /// High pass.
    case highpass
    /// High shelf.
    case highshelf
    /// Low shelf.
    case lowshelf
    /// Peak.
    case peak
    /// Notch.
    case notch
    /// Band pass Q.
    case bandpassQ
    /// Band pass 0.
    case bandpass0
    /// All pass.
    case allpass
}

/// Filter coefficients for biquad filter.
/// - Parameters:
///   - f: Frequency (Hz).
///   - fs: Sample rate (Hz).
///   - Q: Quality factor.
///   - dbGain: Gain (dB).
///   - ftype: Filter type.
/// - Returns: (b, a) coefficients as a tuple.
public func biquad(f: Real, fs: Real, Q: Real, dbGain: Real, ftype: BiquadType) -> (b: [Real], a: [Real]) {
    // Fs = 48000
    // f0 = 1000
    // Q = sqrt(2)/2
    // dbGain = 15
    // type = .notch

    var f0 = f

    var A = sqrt( pow(10, dbGain/20) )

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
    // let alpha = sinW0*sinh( ln(2)/2 * BW * w0/sinW0 )     // case: BW
    // let alpha = sinW0/2 * sqrt( (A + 1/A)*(1/S - 1) + 2 ) // case: S

    var b0 = Real(0.0)
    var b1 = Real(0.0)
    var b2 = Real(0.0)
    var a0 = Real(0.0)
    var a1 = Real(0.0)
    var a2 = Real(0.0)

    switch ftype {
        case .lowpass:  // H(s) = 1 / (s^2 + s/Q + 1)
            
            b0 =  (1 - cosW0)/2
            b1 =   1 - cosW0
            b2 =  (1 - cosW0)/2
            a0 =   1 + alpha
            a1 =  -2*cosW0
            a2 =   1 - alpha

        case .highpass:  // H(s) = s^2 / (s^2 + s/Q + 1)

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

        case .allpass: // H(s) = (s^2 - s/Q + 1) / (s^2 + s/Q + 1)

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
// https://www.musicdsp.org/en/latest/_downloads/2a80aec3df7303b2245e13650e70457b/biquad.c
// https://github.com/libaudioverse/libaudioverse/blob/master/audio%20eq%20cookbook.txt

/*
 
 /* Simple implementation of Biquad filters -- Tom St Denis
  *
  * Based on the work

 Cookbook formulae for audio EQ biquad filter coefficients
 ---------------------------------------------------------
 by Robert Bristow-Johnson, pbjrbj@viconet.com  a.k.a. robert@audioheads.com

  * Available on the web at

 http://www.smartelectronix.com/musicdsp/text/filters005.txt

  * Enjoy.
  *
  * This work is hereby placed in the public domain for all purposes, whether
  * commercial, free [as in speech] or educational, etc.  Use the code and please
  * give me credit if you wish.
  *
  * Tom St Denis -- http://tomstdenis.home.dhs.org
 */

 /* this would be biquad.h */
 #include <math.h>
 #include <stdlib.h>

 #ifndef M_LN2
 #define M_LN2       0.69314718055994530942
 #endif

 #ifndef M_PI
 #define M_PI        3.14159265358979323846
 #endif

 /* whatever sample type you want */
 typedef double smp_type;

 /* this holds the data required to update samples thru a filter */
 typedef struct {
     smp_type a0, a1, a2, a3, a4;
     smp_type x1, x2, y1, y2;
 }
 biquad;

 extern smp_type BiQuad(smp_type sample, biquad * b);
 extern biquad *BiQuad_new(int type, smp_type dbGain, /* gain of filter */
                           smp_type freq,             /* center frequency */
                           smp_type srate,            /* sampling rate */
                           smp_type bandwidth);       /* bandwidth in octaves */

 /* filter types */
 enum {
     LPF, /* low pass filter */
     HPF, /* High pass filter */
     BPF, /* band pass filter */
     NOTCH, /* Notch Filter */
     PEQ, /* Peaking band EQ filter */
     LSH, /* Low shelf filter */
     HSH /* High shelf filter */
 };

 /* Below this would be biquad.c */
 /* Computes a BiQuad filter on a sample */
 smp_type BiQuad(smp_type sample, biquad * b)
 {
     smp_type result;

     /* compute result */
     result = b->a0 * sample + b->a1 * b->x1 + b->a2 * b->x2 -
         b->a3 * b->y1 - b->a4 * b->y2;

     /* shift x1 to x2, sample to x1 */
     b->x2 = b->x1;
     b->x1 = sample;

     /* shift y1 to y2, result to y1 */
     b->y2 = b->y1;
     b->y1 = result;

     return result;
 }

 /* sets up a BiQuad Filter */
 biquad *BiQuad_new(int type, smp_type dbGain, smp_type freq,
 smp_type srate, smp_type bandwidth)
 {
     biquad *b;
     smp_type A, omega, sn, cs, alpha, beta;
     smp_type a0, a1, a2, b0, b1, b2;

     b = malloc(sizeof(biquad));
     if (b == NULL)
         return NULL;

     /* setup variables */
     A = pow(10, dbGain /40);
     omega = 2 * M_PI * freq /srate;
     sn = sin(omega);
     cs = cos(omega);
     alpha = sn * sinh(M_LN2 /2 * bandwidth * omega /sn);
     beta = sqrt(A + A);

     switch (type) {
     case LPF:
         b0 = (1 - cs) /2;
         b1 = 1 - cs;
         b2 = (1 - cs) /2;
         a0 = 1 + alpha;
         a1 = -2 * cs;
         a2 = 1 - alpha;
         break;
     case HPF:
         b0 = (1 + cs) /2;
         b1 = -(1 + cs);
         b2 = (1 + cs) /2;
         a0 = 1 + alpha;
         a1 = -2 * cs;
         a2 = 1 - alpha;
         break;
     case BPF:
         b0 = alpha;
         b1 = 0;
         b2 = -alpha;
         a0 = 1 + alpha;
         a1 = -2 * cs;
         a2 = 1 - alpha;
         break;
     case NOTCH:
         b0 = 1;
         b1 = -2 * cs;
         b2 = 1;
         a0 = 1 + alpha;
         a1 = -2 * cs;
         a2 = 1 - alpha;
         break;
     case PEQ:
         b0 = 1 + (alpha * A);
         b1 = -2 * cs;
         b2 = 1 - (alpha * A);
         a0 = 1 + (alpha /A);
         a1 = -2 * cs;
         a2 = 1 - (alpha /A);
         break;
     case LSH:
         b0 = A * ((A + 1) - (A - 1) * cs + beta * sn);
         b1 = 2 * A * ((A - 1) - (A + 1) * cs);
         b2 = A * ((A + 1) - (A - 1) * cs - beta * sn);
         a0 = (A + 1) + (A - 1) * cs + beta * sn;
         a1 = -2 * ((A - 1) + (A + 1) * cs);
         a2 = (A + 1) + (A - 1) * cs - beta * sn;
         break;
     case HSH:
         b0 = A * ((A + 1) + (A - 1) * cs + beta * sn);
         b1 = -2 * A * ((A - 1) + (A + 1) * cs);
         b2 = A * ((A + 1) + (A - 1) * cs - beta * sn);
         a0 = (A + 1) - (A - 1) * cs + beta * sn;
         a1 = 2 * ((A - 1) - (A + 1) * cs);
         a2 = (A + 1) - (A - 1) * cs - beta * sn;
         break;
     default:
         free(b);
         return NULL;
     }

     /* precompute the coefficients */
     b->a0 = b0 /a0;
     b->a1 = b1 /a0;
     b->a2 = b2 /a0;
     b->a3 = a1 /a0;
     b->a4 = a2 /a0;

     /* zero initial samples */
     b->x1 = b->x2 = 0;
     b->y1 = b->y2 = 0;

     return b;
 }
 /* crc==3062280887, version==4, Sat Jul  7 00:03:23 2001 */

 
 */
