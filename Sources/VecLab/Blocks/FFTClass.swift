//
//  FFTClass.swift
//  VecLab
//
//  Created by Marcus Painter on 31/08/2025.
//

import Accelerate


/// Fast Fourier Transform.
public final class FFTClass {
    private var fft: vDSP.DiscreteFourierTransform<Double>
    private var ifft: vDSP.DiscreteFourierTransform<Double>
    private let zeros: [Double]
    private let length: Int
    
    /// Initialize FFT.
    /// - Parameter length: FFT length.
    public init(length: Int) throws {
        self.length = length
        zeros = [Double](repeating: 0.0, count: length)
        do {
            self.fft = try vDSP.DiscreteFourierTransform(previous: nil,
                                                    count: length,
                                                    direction: .forward,
                                                    transformType: .complexComplex,
                                                    ofType: Double.self)

            self.ifft = try vDSP.DiscreteFourierTransform(previous: nil,
                                                     count: length,
                                                     direction: .inverse,
                                                     transformType: .complexComplex,
                                                     ofType: Double.self)
        }
    }
    
    /// Forward FFT transform.
    /// - Parameter x: Real array.
    /// - Returns: Complex array.
    public func fftr(_ x: [Double]) -> ([Double], [Double]) {
        assert(x.count == self.length, "Wrong size")
        let splitComplexOutput = fft.transform(real: x, imaginary: zeros)
        return (splitComplexOutput.real, splitComplexOutput.imaginary)
    }
    
    /// Inverse FFT transform.
    /// - Parameter x: Complex array.
    /// - Returns: Real array.
    public func ifftr(_ x: ([Double], [Double])) -> [Double] {
        assert(x.0.count == x.1.count, "real imag mismatch" )
        assert(x.0.count == self.length, "Wrong size")
        var splitComplexOutput = ifft.transform(real: x.0, imaginary: x.1)
        splitComplexOutput.real = vDSP.divide(splitComplexOutput.real, Double(x.0.count))
        return splitComplexOutput.real
    }
    
    /// Forward FFT transform.
    /// - Parameter x: Complex array.
    /// - Returns: Complex array.
    public func fft(_ x: ([Double], [Double])) -> ([Double], [Double]) {
        assert(x.0.count == x.1.count, "real imag mismatch" )
        assert(x.0.count == self.length, "Wrong size")
        let splitComplexOutput = fft.transform(real: x.0, imaginary: x.1)
        return (splitComplexOutput.real, splitComplexOutput.imaginary)
    }

    /// Inverse FFT transform.
    /// - Parameter x: Complex array.
    /// - Returns: Complex array.
    public func ifft(_ x: ([Double], [Double])) -> ([Double], [Double]) {
        assert(x.0.count == x.1.count, "real imag mismatch" )
        assert(x.0.count == self.length, "Wrong size")
        var splitComplexOutput = ifft.transform(real: x.0, imaginary: x.1)
        splitComplexOutput.real = vDSP.divide(splitComplexOutput.real, Double(x.0.count))
        splitComplexOutput.imaginary = vDSP.divide(splitComplexOutput.imaginary, Double(x.0.count))
        return (splitComplexOutput.real, splitComplexOutput.imaginary)
    }
}
