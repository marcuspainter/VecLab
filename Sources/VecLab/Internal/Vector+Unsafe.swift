//
//  Vector+Unsafe.swift
//
//
//  Created by Marcus Painter on 08/09/2023.
//

import Accelerate
import Foundation

func withUnsafeParameters(
    _ a: ([Double], [Double]),
    _ b: ([Double], [Double]),
    _ c: inout ([Double], [Double]),
    _ body: ( UnsafePointer<DSPDoubleSplitComplex>,
          UnsafePointer<DSPDoubleSplitComplex>,
          UnsafeMutablePointer<DSPDoubleSplitComplex>,
             vDSP_Length) -> Void) {

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
    _ body: (UnsafePointer<DSPSplitComplex>,
             UnsafePointer<DSPSplitComplex>,
             UnsafeMutablePointer<DSPSplitComplex>,
             vDSP_Length) -> Void) {

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
    _ b: [Double],
    _ c: inout ([Double], [Double]),
    _ body: ( UnsafePointer<DSPDoubleSplitComplex>,
              UnsafePointer<Double>,
              UnsafeMutablePointer<DSPDoubleSplitComplex>,
              vDSP_Length) -> Void) {

        a.0.withUnsafeBufferPointer { aRealBuffer in
            a.1.withUnsafeBufferPointer { aImagBuffer in
                b.withUnsafeBufferPointer { bRealBuffer in
                    c.0.withUnsafeMutableBufferPointer { cRealBuffer in
                        c.1.withUnsafeMutableBufferPointer { cImagBuffer in

                            var A = DSPDoubleSplitComplex(realp: UnsafeMutablePointer(mutating: aRealBuffer.baseAddress!),
                                                          imagp: UnsafeMutablePointer(mutating: aImagBuffer.baseAddress!))

                            let B = bRealBuffer.baseAddress!

                            var C = DSPDoubleSplitComplex(realp: cRealBuffer.baseAddress!,
                                                          imagp: cImagBuffer.baseAddress!)

                            let n = vDSP_Length(a.0.count)
                            body(&A, B, &C, n)
                        }
                    }
                }
            }
        }
}

func withUnsafeParameters(
    _ a: ([Float], [Float]),
    _ b: [Float],
    _ c: inout ([Float], [Float]),
    _ body: ( UnsafePointer<DSPSplitComplex>,
              UnsafePointer<Float>,
              UnsafeMutablePointer<DSPSplitComplex>,
              vDSP_Length) -> Void) {
        a.0.withUnsafeBufferPointer { aRealBuffer in
            a.1.withUnsafeBufferPointer { aImagBuffer in
                b.withUnsafeBufferPointer { bRealBuffer in
                    c.0.withUnsafeMutableBufferPointer { cRealBuffer in
                        c.1.withUnsafeMutableBufferPointer { cImagBuffer in

                            var A = DSPSplitComplex(realp: UnsafeMutablePointer(mutating: aRealBuffer.baseAddress!),
                                                          imagp: UnsafeMutablePointer(mutating: aImagBuffer.baseAddress!))

                            let B = bRealBuffer.baseAddress!

                            var C = DSPSplitComplex(realp: cRealBuffer.baseAddress!,
                                                          imagp: cImagBuffer.baseAddress!)

                            let n = vDSP_Length(a.0.count)
                            body(&A, B, &C, n)
                        }
                    }
                }
            }
        }
}

func withUnsafeParameters(
    _ a: ([Double], [Double]),
    _ c: inout ([Double], [Double]),
    _ body: (UnsafePointer<DSPDoubleSplitComplex>,
             UnsafeMutablePointer<DSPDoubleSplitComplex>,
             vDSP_Length) -> Void) {

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
    _ body: (UnsafePointer<DSPSplitComplex>,
             UnsafeMutablePointer<DSPSplitComplex>,
             vDSP_Length) -> Void) {

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
    _ body: (UnsafePointer<DSPDoubleSplitComplex>,
             UnsafeMutablePointer<Double>,
             vDSP_Length) -> Void) {

    a.0.withUnsafeBufferPointer { aRealBuffer in
        a.1.withUnsafeBufferPointer { aImagBuffer in
            c.withUnsafeMutableBufferPointer { cRealBuffer in
                var A = DSPDoubleSplitComplex(realp: UnsafeMutablePointer(mutating: aRealBuffer.baseAddress!),
                                              imagp: UnsafeMutablePointer(mutating: aImagBuffer.baseAddress!))
                let C = cRealBuffer.baseAddress!
                let n = vDSP_Length(a.0.count)
                body(&A, C, n)
            }
        }
    }
}

func withUnsafeParameters(
    _ a: ([Float], [Float]),
    _ c: inout [Float],
    _ body: (UnsafePointer<DSPSplitComplex>,
             UnsafeMutablePointer<Float>,
             vDSP_Length) -> Void) {

    a.0.withUnsafeBufferPointer { aRealBuffer in
        a.1.withUnsafeBufferPointer { aImagBuffer in
            c.withUnsafeMutableBufferPointer { cRealBuffer in
                var A = DSPSplitComplex(realp: UnsafeMutablePointer(mutating: aRealBuffer.baseAddress!),
                                        imagp: UnsafeMutablePointer(mutating: aImagBuffer.baseAddress!))
                let C = cRealBuffer.baseAddress!
                let n = vDSP_Length(a.0.count)
                body(&A, C, n)
            }
        }
    }
}

func withUnsafeParameters(
    _ a: (Double, Double),
    _ c: inout ([Double], [Double]),
    _ body: ( UnsafePointer<DSPDoubleSplitComplex>,
          UnsafeMutablePointer<DSPDoubleSplitComplex>,
          vDSP_Length) -> Void) {

    let n = vDSP_Length(c.0.count)
    withUnsafePointer(to: a.0) { aRealPointer in
        withUnsafePointer(to: a.1) { aImagPointer in

            c.0.withUnsafeMutableBufferPointer { cRealBuffer in
                c.1.withUnsafeMutableBufferPointer { cImagBuffer in

                    var A = DSPDoubleSplitComplex(realp: UnsafeMutablePointer(mutating: aRealPointer),
                                                  imagp: UnsafeMutablePointer(mutating: aImagPointer))

                    var C = DSPDoubleSplitComplex(realp: cRealBuffer.baseAddress!,
                                                  imagp: cImagBuffer.baseAddress!)

                    body(&A, &C, n)
                }
            }
        }
    }
}

func withUnsafeParameters(
    _ a: (Float, Float),
    _ c: inout ([Float], [Float]),
    _ body: ( UnsafePointer<DSPSplitComplex>,
          UnsafeMutablePointer<DSPSplitComplex>,
          vDSP_Length) -> Void) {

    let n = vDSP_Length(c.0.count)
    withUnsafePointer(to: a.0) { aRealPointer in
        withUnsafePointer(to: a.1) { aImagPointer in

            c.0.withUnsafeMutableBufferPointer { cRealBuffer in
                c.1.withUnsafeMutableBufferPointer { cImagBuffer in

                    var A = DSPSplitComplex(realp: UnsafeMutablePointer(mutating: aRealPointer),
                                                  imagp: UnsafeMutablePointer(mutating: aImagPointer))

                    var C = DSPSplitComplex(realp: cRealBuffer.baseAddress!,
                                                  imagp: cImagBuffer.baseAddress!)

                    body(&A, &C, n)
                }
            }
        }
    }
}
