//
//  Vector+Inplace.swift
//
//
//  Created by Marcus Painter on 28/08/2024.
//

import Accelerate
import Foundation

// MARK: Fill

func fillRealArray(_ c: [Double], _ a: Double) {
    let n = c.count
    var aa = a
    c.withUnsafeBufferPointer { cRealBuffer in
        let C = UnsafeMutablePointer(mutating: cRealBuffer.baseAddress!)
        vDSP_vfillD(&aa, C, 1, vDSP_Length(n))
    }
}

func fillComplexArray(_ c: ComplexArray, _ a: Complex) {
    let n = c.count
    var aa0 = a.real
    var aa1 = a.imag
    c.real.withUnsafeBufferPointer { cRealBuffer in
        c.imag.withUnsafeBufferPointer { cImagBuffer in
            let C0 = UnsafeMutablePointer(mutating: cRealBuffer.baseAddress!)
            let C1 = UnsafeMutablePointer(mutating: cImagBuffer.baseAddress!)
            vDSP_vfillD(&aa0, C0, 1, vDSP_Length(n))
            vDSP_vfillD(&aa1, C1, 1, vDSP_Length(n))
        }
    }
}

// MARK: Clear

func vectorClearRealArray(_ c: RealArray) {
    let n = c.count
    c.withUnsafeBufferPointer { cRealBuffer in
        let C = UnsafeMutablePointer(mutating: cRealBuffer.baseAddress!)
        vDSP_vclrD(C, 1, vDSP_Length(n))
    }
}

func vectorClearComplexArray(_ c: ComplexArray) {
    let n = c.count
    c.real.withUnsafeBufferPointer { cRealBuffer in
        c.imag.withUnsafeBufferPointer { cImagBuffer in
            let C0 = UnsafeMutablePointer(mutating: cRealBuffer.baseAddress!)
            let C1 = UnsafeMutablePointer(mutating: cImagBuffer.baseAddress!)
            vDSP_vclrD(C0, 1, vDSP_Length(n))
            vDSP_vclrD(C1, 1, vDSP_Length(n))
        }
    }
}
