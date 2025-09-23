//
//  Matrix+trace.swift
//  VecLab
//
//  Created by Marcus Painter on 15/09/2025.
//

public func trace(_ a: Matrix) -> Real {
    let d = diag(a)
    let t = sum(d.data)
    return t
}
