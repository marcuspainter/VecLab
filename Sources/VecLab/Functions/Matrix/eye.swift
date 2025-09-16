//
//  eye.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

public func eye(_ n: Int) -> Matrix {
    let data = dataEye(n)
    return Matrix(data, n, n)
}

func dataEye(_ n: Int) -> RealArray {
    var data = RealArray(count: n * n)
    for row in 0..<n {
        data[row * n + row]  = 1
    }
    return data
}
