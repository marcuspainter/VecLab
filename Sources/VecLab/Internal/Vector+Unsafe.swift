//
//  Vector+Unsafe.swift
//
//
//  Created by Marcus Painter on 08/09/2023.
//

import Foundation
import Accelerate

func withUnsafeParameters(
    _ a: ([Double], [Double]),
    _ b: ([Double], [Double]),
    _ c: inout ([Double], [Double]),
    _ body: (inout DSPDoubleSplitComplex, inout DSPDoubleSplitComplex, inout DSPDoubleSplitComplex, vDSP_Length) -> Void
) {
    a.0.withUnsafeBufferPointer { aRealBuffer in
        a.1.withUnsafeBufferPointer { aImagBuffer in
            b.0.withUnsafeBufferPointer { bRealBuffer in
                b.1.withUnsafeBufferPointer { bImagBuffer in
                    c.0.withUnsafeMutableBufferPointer { cRealBuffer in
                        c.1.withUnsafeMutableBufferPointer { cImagBuffer in
                            var A = DSPDoubleSplitComplex(realp: UnsafeMutablePointer(mutating: aRealBuffer.baseAddress!),
                                                          imagp: UnsafeMutablePointer(mutating: aImagBuffer.baseAddress!))
                            var B = DSPDoubleSplitComplex(realp: UnsafeMutablePointer(mutating: bRealBuffer.baseAddress!),
                                                          imagp: UnsafeMutablePointer(mutating: bImagBuffer.baseAddress!))
                            var C = DSPDoubleSplitComplex(realp: cRealBuffer.baseAddress!,
                                                          imagp: cImagBuffer.baseAddress!)
                            let n = vDSP_Length(a.0.count)
                            body(&A, &B, &C, n)
                        }
                    }
                }
            }
        }
    }
}

func withUnsafeParameters(
    _ a: ([Float], [Float]),
    _ b: ([Float], [Float]),
    _ c: inout ([Float], [Float]),
    _ body: (inout DSPSplitComplex, inout DSPSplitComplex, inout DSPSplitComplex, vDSP_Length) -> Void
) {
    a.0.withUnsafeBufferPointer { aRealBuffer in
        a.1.withUnsafeBufferPointer { aImagBuffer in
            b.0.withUnsafeBufferPointer { bRealBuffer in
                b.1.withUnsafeBufferPointer { bImagBuffer in
                    c.0.withUnsafeMutableBufferPointer { cRealBuffer in
                        c.1.withUnsafeMutableBufferPointer { cImagBuffer in
                            var A = DSPSplitComplex(realp: UnsafeMutablePointer(mutating: aRealBuffer.baseAddress!),
                                                          imagp: UnsafeMutablePointer(mutating: aImagBuffer.baseAddress!))
                            var B = DSPSplitComplex(realp: UnsafeMutablePointer(mutating: bRealBuffer.baseAddress!),
                                                          imagp: UnsafeMutablePointer(mutating: bImagBuffer.baseAddress!))
                            var C = DSPSplitComplex(realp: cRealBuffer.baseAddress!,
                                                          imagp: cImagBuffer.baseAddress!)
                            let n = vDSP_Length(a.0.count)
                            body(&A, &B, &C, n)
                        }
                    }
                }
            }
        }
    }
}

func withUnsafeParameters(
    _ a: ([Double], [Double]),
    _ c: inout ([Double], [Double]),
    _ body: (inout DSPDoubleSplitComplex, inout DSPDoubleSplitComplex, vDSP_Length) -> Void
) {
    a.0.withUnsafeBufferPointer { aRealBuffer in
        a.1.withUnsafeBufferPointer { aImagBuffer in
                c.0.withUnsafeMutableBufferPointer { cRealBuffer in
                    c.1.withUnsafeMutableBufferPointer { cImagBuffer in
                        var A = DSPDoubleSplitComplex(realp: UnsafeMutablePointer(mutating: aRealBuffer.baseAddress!),
                                                      imagp: UnsafeMutablePointer(mutating: aImagBuffer.baseAddress!))
                        var C = DSPDoubleSplitComplex(realp: cRealBuffer.baseAddress!,
                                                      imagp: cImagBuffer.baseAddress!)
                        let n = vDSP_Length(a.0.count)
                        body(&A, &C, n)
                    }
                }
            }
    }
}

func withUnsafeParameters(
    _ a: ([Float], [Float]),
    _ c: inout ([Float], [Float]),
    _ body: (inout DSPSplitComplex, inout DSPSplitComplex, vDSP_Length) -> Void
) {
    a.0.withUnsafeBufferPointer { aRealBuffer in
        a.1.withUnsafeBufferPointer { aImagBuffer in
                c.0.withUnsafeMutableBufferPointer { cRealBuffer in
                    c.1.withUnsafeMutableBufferPointer { cImagBuffer in
                        var A = DSPSplitComplex(realp: UnsafeMutablePointer(mutating: aRealBuffer.baseAddress!),
                                                      imagp: UnsafeMutablePointer(mutating: aImagBuffer.baseAddress!))
                        var C = DSPSplitComplex(realp: cRealBuffer.baseAddress!,
                                                      imagp: cImagBuffer.baseAddress!)
                        let n = vDSP_Length(a.0.count)
                        body(&A, &C, n)
                    }
                }
            }
    }
}

func withUnsafeParameters(
    _ a: ([Double], [Double]),
    _ c: inout [Double],
    _ body: (inout DSPDoubleSplitComplex, inout [Double], vDSP_Length) -> Void
) {
    a.0.withUnsafeBufferPointer { aRealBuffer in
        a.1.withUnsafeBufferPointer { aImagBuffer in
                var A = DSPDoubleSplitComplex(realp: UnsafeMutablePointer(mutating: aRealBuffer.baseAddress!),
                                              imagp: UnsafeMutablePointer(mutating: aImagBuffer.baseAddress!))
                let n = vDSP_Length(a.0.count)
                body(&A, &c, n)
            }

    }
}

func withUnsafeParameters(
    _ a: ([Float], [Float]),
    _ c: inout [Float],
    _ body: (inout DSPSplitComplex, inout [Float], vDSP_Length) -> Void
) {
    a.0.withUnsafeBufferPointer { aRealBuffer in
        a.1.withUnsafeBufferPointer { aImagBuffer in
                var A = DSPSplitComplex(realp: UnsafeMutablePointer(mutating: aRealBuffer.baseAddress!),
                                              imagp: UnsafeMutablePointer(mutating: aImagBuffer.baseAddress!))
                let n = vDSP_Length(a.0.count)
                body(&A, &c, n)
            }

    }
}
