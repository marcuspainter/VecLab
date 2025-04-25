//
//  ComlexDoubleArray+Unsafe.swift
//  VecLab
//
//  Created by Marcus Painter on 25/04/2025.
//

import Accelerate

extension ComplexDoubleArray {
    
     public static func withUnsafeParameters(
        _ a: ComplexArray,
        _ b: ComplexArray,
        _ c: inout ComplexArray,
        _ body: (UnsafePointer<DSPDoubleSplitComplex>,
                 UnsafePointer<DSPDoubleSplitComplex>,
                 UnsafeMutablePointer<DSPDoubleSplitComplex>,
                 vDSP_Length) -> Void) {
        a.real.withUnsafeBufferPointer { aRealBuffer in
            a.imag.withUnsafeBufferPointer { aImagBuffer in
                b.real.withUnsafeBufferPointer { bRealBuffer in
                    b.imag.withUnsafeBufferPointer { bImagBuffer in
                        c.real.withUnsafeMutableBufferPointer { cRealBuffer in
                            c.imag.withUnsafeMutableBufferPointer { cImagBuffer in
                                var A = DSPDoubleSplitComplex(realp: UnsafeMutablePointer(mutating: aRealBuffer.baseAddress!),
                                                              imagp: UnsafeMutablePointer(mutating: aImagBuffer.baseAddress!))
                                var B = DSPDoubleSplitComplex(realp: UnsafeMutablePointer(mutating: bRealBuffer.baseAddress!),
                                                              imagp: UnsafeMutablePointer(mutating: bImagBuffer.baseAddress!))
                                var C = DSPDoubleSplitComplex(realp: cRealBuffer.baseAddress!,
                                                              imagp: cImagBuffer.baseAddress!)
                                let n = vDSP_Length(a.count)
                                body(&A, &B, &C, n)
                            }
                        }
                    }
                }
            }
        }
    }
    
    public static func withUnsafeParameters(
        _ a: ComplexArray,
        _ b: RealArray,
        _ c: inout ComplexArray,
        _ body: (UnsafePointer<DSPDoubleSplitComplex>,
                 UnsafePointer<Double>,
                 UnsafeMutablePointer<DSPDoubleSplitComplex>,
                 vDSP_Length) -> Void) {
        a.real.withUnsafeBufferPointer { aRealBuffer in
            a.imag.withUnsafeBufferPointer { aImagBuffer in
                b.withUnsafeBufferPointer { bRealBuffer in
                    c.real.withUnsafeMutableBufferPointer { cRealBuffer in
                        c.imag.withUnsafeMutableBufferPointer { cImagBuffer in

                            var A = DSPDoubleSplitComplex(realp: UnsafeMutablePointer(mutating: aRealBuffer.baseAddress!),
                                                          imagp: UnsafeMutablePointer(mutating: aImagBuffer.baseAddress!))

                            let B = bRealBuffer.baseAddress!

                            var C = DSPDoubleSplitComplex(realp: cRealBuffer.baseAddress!,
                                                          imagp: cImagBuffer.baseAddress!)

                            let n = vDSP_Length(a.count)
                            body(&A, B, &C, n)
                        }
                    }
                }
            }
        }
    }
    
    public static func withUnsafeParameters(
        _ a: ComplexArray,
        _ c: inout ComplexArray,
        _ body: (UnsafePointer<DSPDoubleSplitComplex>,
                 UnsafeMutablePointer<DSPDoubleSplitComplex>,
                 vDSP_Length) -> Void) {
        a.real.withUnsafeBufferPointer { aRealBuffer in
            a.imag.withUnsafeBufferPointer { aImagBuffer in
                c.real.withUnsafeMutableBufferPointer { cRealBuffer in
                    c.imag.withUnsafeMutableBufferPointer { cImagBuffer in
                        var A = DSPDoubleSplitComplex(realp: UnsafeMutablePointer(mutating: aRealBuffer.baseAddress!),
                                                      imagp: UnsafeMutablePointer(mutating: aImagBuffer.baseAddress!))
                        var C = DSPDoubleSplitComplex(realp: cRealBuffer.baseAddress!,
                                                      imagp: cImagBuffer.baseAddress!)
                        let n = vDSP_Length(a.count)
                        body(&A, &C, n)
                    }
                }
            }
        }
    }
    
    public static func withUnsafeParameters(
        _ a: ComplexArray,
        _ c: inout RealArray,
        _ body: (UnsafePointer<DSPDoubleSplitComplex>,
                 UnsafeMutablePointer<Double>,
                 vDSP_Length) -> Void) {
        a.real.withUnsafeBufferPointer { aRealBuffer in
            a.imag.withUnsafeBufferPointer { aImagBuffer in
                c.withUnsafeMutableBufferPointer { cRealBuffer in
                    var A = DSPDoubleSplitComplex(realp: UnsafeMutablePointer(mutating: aRealBuffer.baseAddress!),
                                                  imagp: UnsafeMutablePointer(mutating: aImagBuffer.baseAddress!))
                    let C = cRealBuffer.baseAddress!
                    let n = vDSP_Length(a.count)
                    body(&A, C, n)
                }
            }
        }
    }
}
