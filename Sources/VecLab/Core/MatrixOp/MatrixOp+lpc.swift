//
//  lpc.swift
//
//
//  Created by Marcus Painter on 14/09/2023.
//

import Accelerate
import Foundation
import simd

extension MatrixOp {

    // Roots of polynomial.
    /// - Parameter p: Polynomial coefficients.
    /// - Returns: The complex roots.
    static func roots(_ p: [Double]) -> ([Double], [Double]) {
        // Input; [1 x x x...]
        // Copy
        var p = p
        // Normalize
        if p[0] != 1.0 {
            // p = p / p[0]
            p = vDSP.divide(p, p[0])
        }
        let slice = p[1 ..< p.count]
        let e = Array(slice)
        let size = e.count
        let companion = MatrixOp.companionMatrix(x: e)
        let (wr, wi) = MatrixOp.eigenvaluesHessenberg(x: companion, size: size)
        return (wr, wi)
    }

}

public func dft(x: [Double], frequency f: Double, sampleRate fs: Double) -> (magnitude: Double, phase: Double) {

    guard f > 0.0 else {
        return (1e-9, 0.0)
    }

    let n = x.count
    let w = 2.0 * .pi * f / fs

    // var norm = 0.0

    let minf = fs / Double(x.count)
    if  minf > f {
        print("Warning: DFT frequency too low \(f) Hz, size \(n). Min is \(minf) Hz or buffer size \(Int((fs / f) + 0.5))")
         return (1e-9, 0.0)
    }

    var real = 0.0
    var imag = 0.0
    for i in 0..<n {
        let ii = Double(i)

        // let hamming = 0.54 + 0.46 * cos(2 * .pi * ii / Double(n-1))
        // let blackmanharris = 0.35875 - 0.48829 * cos(2 * .pi * ii / Double(n-1)) + 0.14128 * cos(4 * .pi * ii / Double(n-1)) - 0.01168 * cos(6 * .pi * ii / Double(n-1))
        // let rectangle = 1.0
        // let window = rectangle
        // norm = norm + window

        let xx = x[i]

        real = real + xx * cos(ii * w)
        imag = imag - xx * sin(ii * w)
    }

    let magnitude = sqrt(real*real + imag*imag)
    let phase = atan2(imag, real)

    return (magnitude, phase)
}

public func lpc(x: [Double], sampleRate fs: Double, order: Int) -> ([Double], [Double], [Double]) {
    let maxOrder = 2 * x.count / 3
    // print(maxOrder)
    assert(order <= maxOrder)

    // Filter coefficients
    let filter = armcov(x: x, p: order)

    // Roots
    let (wr, wi) = MatrixOp.roots(filter)

    // Stabilize
    // (wr, wi) = stabilizeFilter(wr:wr, wi:wi)

    // Rebuild filter
    // (filter, _) = poly(real:wr, imag:wi)

    let (freqs, bws) = getFrequency(wr: wr, wi: wi, sampleRate: fs)

    var mags = [Double](repeating: 0.0, count: freqs.count)
    for i in 0 ..< freqs.count {
        let (m, _) = dft(x: x, frequency: freqs[i], sampleRate: fs)
        mags[i] = 20 * log10(abs(m))
    }

    return (freqs, mags, bws)
}

public func lpc(x: [Float], sampleRate fs: Double, order: Int) -> ([Double], [Double], [Double]) {
    let n = x.count
    var d = [Double](repeating: 0.0, count: n)
    vDSP_vspdp(x, 1, &d, 1, UInt(n))

    return lpc(x: d, sampleRate: fs, order: order)
}

func zero(size: Int) -> [Double] {
    return [Double](repeating: 0.0, count: size)
}

func stabilizeFilter(wr: [Double], wi: [Double]) -> ([Double], [Double]) {
    let n = wr.count
    var a = [Double](repeating: 0.0, count: n)
    var b = [Double](repeating: 0.0, count: n)

    for i in 0 ..< n {
        (a[i], b[i]) = reflectPole(wr: wr[i], wi: wi[i])
    }
    return (a, b)
}

func reflectPole(wr: Double, wi: Double) -> (Double, Double) {
    // z = conj(z(k)).^(-1)
    // z = 1/conj(z)

    var r = wr
    var i = wi

    let denom = wr * wr + wi * wi

    // Outside unit circle
    if sqrt(denom) > 1.0 {
        r = wr / denom
        i = wi / denom // No minus. conj(b)
        print("Stabilized", sqrt(denom), sqrt(r * r + i * i))
    }

    return (r, i)
}

func getFrequency(wr: [Double], wi: [Double], sampleRate fs: Double) -> (f: [Double], bw: [Double]) {
    let n = wr.count

    var frequency = [Double]()
    var bandwidth = [Double]()

    for i in 0 ..< n {
        if wi[i] < 0.0 {
            continue
        }

        let r2 = wr[i] * wr[i]
        let i2 = wi[i] * wi[i]
        let m = sqrt(r2 + i2)

        let p = atan2(wi[i], wr[i])
        let freq = p * (fs / (2.0 * Double.pi))
        let bw = -0.5 * (fs / (2.0 * Double.pi)) * log(m)
        frequency.append(freq)
        bandwidth.append(bw)
    }

    return (frequency, bandwidth)
}

func armcov(x: [Double], p: Int) -> [Double] {
    // Output: [1 x x x...]
    let (a, b, rows, columns) = MatrixOp.correlationMatrix(x: x, p: p)
    let result = MatrixOp.qrSolve(a: a, b: b, rows: rows, columns: columns)
    var filter: [Double] = [1.0]
    filter.append(contentsOf: result)
    return filter
}

/*
public func qrSolve(a: [Double], b: [Double], rows: Int, columns: Int) -> [Double] {
    let mn = min(rows, columns)
    let worksize = max(1, mn + max(mn, 1))
    var aa: [Double] = a
    var bb: [Double] = b

    var trans: Int8 = 0x4E // 'N'
    var m: Int = Int(rows)
    var n: Int = Int(columns)
    var nrhs: Int = 1
    // a
    var lda: Int = Int(rows)
    // b
    var ldb: Int = Int(rows)
    var work: [Double] = [0.0]
    var lwork: Int = Int(worksize)
    var info: Int = 0

    lwork = -1
    dgels_(&trans, &m, &n, &nrhs, nil, &lda, nil, &ldb, &work, &lwork, &info)
    if info == 0 {
        lwork = Int(work[0])
        assert(lwork >= worksize)

        work = [Double](repeating: 0.0, count: Int(lwork))
        dgels_(&trans, &m, &n, &nrhs, &aa, &lda, &bb, &ldb, &work, &lwork, &info)
    }
    let slice = bb[0 ... columns - 1]
    return Array(slice)
}
*/

func poly(real zr: [Double], imag zi: [Double]) -> ([Double], [Double]) {
    /*
      The algorithm is

      z = eig(A);
      p = zeros(n+1,1);
      p(1) = 1;
      for j = 1:n
         p(2:j+1) = p(2:j+1) -z(j) * p(1:j);
       end

      for j = 1:n

         for l = 1:j
              zp(l) = -z(j) * p(l);
         end

         for k = 2:j+1
              p(k) = p(k) + zp(k-1);
         end
     end
     */
    assert(zr.count == zi.count)

    let n = zr.count
    var pr = [Double](repeating: 0.0, count: n + 1)
    var pi = [Double](repeating: 0.0, count: n + 1)
    var zpi = [Double](repeating: 0.0, count: n + 1)
    var zpr = [Double](repeating: 0.0, count: n + 1)
    pr[0] = 1.0
    pi[0] = 0.0

    for j in 0 ..< n {
        for l in 0 ..< j {
            // Complex multiply
            let ac = zr[j] * pr[l]
            let bd = zi[j] * pi[l]
            let ad = zr[j] * pi[l]
            let bc = zi[j] * pr[l]

            zpr[l] = ac - bd
            zpi[l] = ad + bc

            // (zpr[l],zpi[l]) = complexMultiply(zr[j], zi[j], pr[l], pi[l])
        }

        for k in 1 ..< j + 1 {
            pr[k] = pr[k] - zpr[k - 1]
            pi[k] = pi[k] - zpi[k - 1]

            // (pr[k],pi[k]) = complexSubract(pr[k],pi[k],zpr[k-1],zpi[k-1])
        }
    }

    return (pr, pi)
}

func complexMultiply(a: Double, b: Double, c: Double, d: Double) -> (Double, Double) {
    // http://mathworld.wolfram.com/ComplexMultiplication.html

    let ac = a * c
    let bd = b * d
    let ad = a * d
    let bc = b * c

    let r = ac - bd
    let i = ad + bc

    // Less multiplies
    // let r = ac - bd
    // let i = (a + b) * (c + d) - ac - bd

    return (r, i)
}

func complexDivide(a: Double, b: Double, c: Double, d: Double) -> (Double, Double) {
    // http://mathworld.wolfram.com/ComplexDivision.html

    let ac = a * c
    let bd = b * d
    let ad = a * d
    let bc = b * c
    let denom = c * c + d * d

    let r = (ac + bd) / denom
    let i = (bc - ad) / denom

    return (r, i)
}

func complexRecipricol(a: Double, b: Double, c: Double, d: Double) -> (Double, Double) {
    // http://mathworld.wolfram.com/Reciprocal.html

    let denom = a * a + b * b
    let r = a / denom
    let i = -b / denom // Note minus

    return (r, i)
}

func complexScalarMultiply(a: Double, b: Double, x: Double) -> (Double, Double) {
    // http://mathworld.wolfram.com/ComplexMultiplication.html

    let r = a * x
    let i = b * x

    return (r, i)
}

func complexAdd(a: Double, b: Double, c: Double, d: Double) -> (Double, Double) {
    // http://mathworld.wolfram.com/ComplexAddition.html

    let r = a + c
    let i = b + d

    return (r, i)
}

func complexSubract(a: Double, b: Double, c: Double, d: Double) -> (Double, Double) {
    // http://mathworld.wolfram.com/ComplexSubtraction.html

    let r = a - c
    let i = b - d

    return (r, i)
}

func complexCongjugate(a: Double, b: Double) -> (Double, Double) {
    // http://mathworld.wolfram.com/ComplexConjugate.html

    let r = a
    let i = -b

    return (r, i)
}

/*
 DGELS Example Program Data

 6      4                   :Values of M and N

 -0.57  -1.28  -0.39   0.25
 -1.93   1.08  -0.31  -2.14
 2.30   0.24   0.40  -0.35
 -1.93   0.64  -0.66   0.08
 0.15   0.30   0.15  -2.13
 -0.02   1.03  -1.43   0.50  :End of matrix A

 -2.67
 -0.55
 3.34
 -0.77
 0.48
 4.10                       :End of vector b

 DGELS Example Program Results

 Least squares solution
 1.5339     1.8707    -1.5241     0.0392

 Square root of the residual sum of squares
 2.22E-02

 */
