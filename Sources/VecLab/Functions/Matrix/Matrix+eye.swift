//
//  Matrix+eye.swift
//  VecLab
//
//  Created by Marcus Painter on 09/09/2025.
//

public func eye(_ n: Int) -> Matrix {
    return Matrix(rows: n, cols: n, data: eyeMatrix(n))
}

private func eyeMatrix(_ n: Int) -> [Double] {
    var data = RealArray(count: n * n)
    for row in 0..<n {
        data[row * n + row] = 1
    }
    return data
}
