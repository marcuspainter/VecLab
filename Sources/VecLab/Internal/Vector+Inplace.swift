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

func fillComplexArray(_ c: ([Double], [Double]), _ a: (Double, Double) ) {
    let n = c.0.count
    var aa0 = a.0
    var aa1 = a.1
    c.0.withUnsafeBufferPointer { cRealBuffer in
        c.1.withUnsafeBufferPointer { cImagBuffer in
            let C0 = UnsafeMutablePointer(mutating: cRealBuffer.baseAddress!)
            let C1 = UnsafeMutablePointer(mutating: cImagBuffer.baseAddress!)
            vDSP_vfillD(&aa0, C0, 1, vDSP_Length(n))
            vDSP_vfillD(&aa1, C1, 1, vDSP_Length(n))
        }
    }
}

func fillRealArray(_ c: [Float], _ a: Float) {
    let n = c.count
    var aa = a
    c.withUnsafeBufferPointer { cRealBuffer in
        let C = UnsafeMutablePointer(mutating: cRealBuffer.baseAddress!)
        vDSP_vfill(&aa, C, 1, vDSP_Length(n))
    }
}

func fillComplexArray(_ c: ([Float], [Float]), _ a: (Float, Float) ) {
    let n = c.0.count
    var aa0 = a.0
    var aa1 = a.1
    c.0.withUnsafeBufferPointer { cRealBuffer in
        c.1.withUnsafeBufferPointer { cImagBuffer in
            let C0 = UnsafeMutablePointer(mutating: cRealBuffer.baseAddress!)
            let C1 = UnsafeMutablePointer(mutating: cImagBuffer.baseAddress!)
            vDSP_vfill(&aa0, C0, 1, vDSP_Length(n))
            vDSP_vfill(&aa1, C1, 1, vDSP_Length(n))
        }
    }
}

// MARK: Clear

func vectorClearRealArray(_ c: [Double]) {
    let n = c.count
    c.withUnsafeBufferPointer { cRealBuffer in
        let C = UnsafeMutablePointer(mutating: cRealBuffer.baseAddress!)
        vDSP_vclrD(C, 1, vDSP_Length(n))
    }
}

func vectorClearComplexArray(_ c: ([Double], [Double])) {
    let n = c.0.count
    c.0.withUnsafeBufferPointer { cRealBuffer in
        c.1.withUnsafeBufferPointer { cImagBuffer in
            let C0 = UnsafeMutablePointer(mutating: cRealBuffer.baseAddress!)
            let C1 = UnsafeMutablePointer(mutating: cImagBuffer.baseAddress!)
            vDSP_vclrD(C0, 1, vDSP_Length(n))
            vDSP_vclrD(C1, 1, vDSP_Length(n))
        }
    }
}

func vectorClearRealArray(_ c: [Float]) {
    let n = c.count
    c.withUnsafeBufferPointer { cRealBuffer in
        let C = UnsafeMutablePointer(mutating: cRealBuffer.baseAddress!)
        vDSP_vclr(C, 1, vDSP_Length(n))
    }
}

func vectorClearComplexArray(_ c: ([Float], [Float])) {
    let n = c.0.count
    c.0.withUnsafeBufferPointer { cRealBuffer in
        c.1.withUnsafeBufferPointer { cImagBuffer in
            let C0 = UnsafeMutablePointer(mutating: cRealBuffer.baseAddress!)
            let C1 = UnsafeMutablePointer(mutating: cImagBuffer.baseAddress!)
            vDSP_vclr(C0, 1, vDSP_Length(n))
            vDSP_vclr(C1, 1, vDSP_Length(n))
        }
    }
}
