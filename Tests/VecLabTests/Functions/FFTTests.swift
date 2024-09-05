//
//  FFTTests.swift
//
//
//  Created by Marcus Painter on 19/09/2023.
//

import VecLab
import XCTest

class FFTTests: XCTestCase {
    let accuracy: RealDouble = 1e-3
    
    // MARK: FFT
    
    func testFFTComplex() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDoubleArray = fft(complexArrayA)
        let expected: ComplexDoubleArray = ([10.0, -4.0, -2.0, 0.0], [10.0, 0.0, -2.0, -4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fft failed")
        
        _ = idft(complex(count: 10))
    }
    
    func testFFTComplex7() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0],
                                           [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0])
        let result: ComplexDoubleArray = fft(complexArrayA)
        let expected: ComplexDoubleArray = ([.nan, .nan, .nan, .nan, .nan, .nan, .nan],
                                      [.nan, .nan, .nan, .nan, .nan, .nan, .nan])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fft failed")
        
        _ = idft(complex(count: 10))
    }
    
    func testFFTReal() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: ComplexDoubleArray = fftr(realArrayA)
        let expected: ComplexDoubleArray = ([10.0, -2.0, -2.0, -2.0], [0.0, 2.0, 0.0, -2.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fftr failed")
    }
    
    func testIFFTComplex() throws {
        let complexArrayA: ComplexDoubleArray = ([10.0, -4.0, -2.0, 0.0], [10.0, 0.0, -2.0, -4.0])
        let result: ComplexDoubleArray = ifft(complexArrayA)
        let expected: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifft failed")
    }
    
    func testIFFTComplex7() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0],
                                           [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0])
        let result: ComplexDoubleArray = ifft(complexArrayA)
        let expected: ComplexDoubleArray = ([.nan, .nan, .nan, .nan, .nan, .nan, .nan],
                                      [.nan, .nan, .nan, .nan, .nan, .nan, .nan])
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifft failed")
        
        _ = idft(complex(count: 10))
    }
    
    func testIFFTReal() throws {
        let complexArrayA: ComplexDoubleArray = ([10.0, -2.0, -2.0, -2.0], [0.0, 2.0, 0.0, -2.0])
        let result: RealDoubleArray = ifftr(complexArrayA)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifft failed")
    }
    
    // MARK: FFT 3 and 5 radix
    
    func testFFTReal3() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0]
        let result: ComplexDoubleArray = fftr(realArrayA)
        let expected: ComplexDoubleArray = ([6.0, -1.5, -1.5],
                                      [
                                        0.0,
                                        0.866025403784439,
                                        -0.866025403784439,
                                      ])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fft failed")
    }
    
    func testFFTReal5() throws {
        let realArrayA: RealDoubleArray = vector(1 ... 5)
        let result: ComplexDoubleArray = fftr(realArrayA)
        let expected: ComplexDoubleArray = ([15.0, -2.5, -2.5, -2.5, -2.5],
                                      [
                                        0.0,
                                        -3.440954801177933,
                                        -0.812299240582266,
                                        0.812299240582266,
                                        3.440954801177933,
                                      ])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fft failed")
    }
    
    func testFFTReal35() throws {
        let realArrayA: RealDoubleArray = vector(1 ... 15)
        let result: ComplexDoubleArray = fftr(realArrayA)
        let expected: ComplexDoubleArray = ([1.2e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2,
                                       -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2],
                                      [
                                        0.0,
                                        35.284725821088408,
                                        16.845275804281620,
                                        10.322864403533801,
                                        6.753030332233800,
                                        4.330127018922193,
                                        2.436897721746798,
                                        0.788281764492574,
                                        -0.788281764492574,
                                        -2.436897721746798,
                                        -4.330127018922193,
                                        -6.753030332233800,
                                        -10.322864403533801,
                                        -16.845275804281620,
                                        -35.284725821088408,
                                      ])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fft failed")
    }
    
    func testFFTReal33() throws {
        let realArrayA: RealDoubleArray = vector(1 ... 9)
        let result: ComplexDoubleArray = fftr(realArrayA)
        let expected: ComplexDoubleArray = ([45.0, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5],
                                      [
                                        0.0,
                                        12.363648387545801,
                                        5.362891166673945,
                                        2.598076211353316,
                                        0.793471413188091,
                                        -0.793471413188091,
                                        -2.598076211353316,
                                        -5.362891166673945,
                                        -12.363648387545801,
                                      ])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fft failed")
    }
    
    // MARK: IFFT 3 and 5 radix
    
    func testIFFTReal3() throws {
        let complexArrayA: ComplexDoubleArray = ([6.0, -1.5, -1.5],
                                           [
                                            0.0,
                                            -0.866025403784439,
                                            0.866025403784439,
                                           ])
        let result: RealDoubleArray = ifftr(complexArrayA)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifft failed")
    }
    
    func testIFFTReal5() throws {
        let complexArrayA: ComplexDoubleArray = ([15.0, -2.5, -2.5, -2.5, -2.5],
                                           [
                                            0.0,
                                            -3.440954801177933,
                                            -0.812299240582266,
                                            0.812299240582266,
                                            3.440954801177933,
                                           ])
        let result: RealDoubleArray = ifftr(complexArrayA)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0, 4.0, 5.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifft failed")
    }
    
    func testIFFTReal35() throws {
        let complexArrayA: ComplexDoubleArray = ([1.2e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2,
                                            -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2],
                                           [
                                            0.0,
                                            35.284725821088408,
                                            16.845275804281620,
                                            10.322864403533801,
                                            6.753030332233800,
                                            4.330127018922193,
                                            2.436897721746798,
                                            0.788281764492574,
                                            -0.788281764492574,
                                            -2.436897721746798,
                                            -4.330127018922193,
                                            -6.753030332233800,
                                            -10.322864403533801,
                                            -16.845275804281620,
                                            -35.284725821088408,
                                           ])
        let result: RealDoubleArray = ifftr(complexArrayA)
        let expected: RealDoubleArray = vector(1 ... 14)
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifft failed")
    }
    
    func testIFFTReal33() throws {
        let complexArrayA: ComplexDoubleArray = ([45.0, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5],
                                           [
                                            0.0,
                                            12.363648387545801,
                                            5.362891166673945,
                                            2.598076211353316,
                                            0.793471413188091,
                                            -0.793471413188091,
                                            -2.598076211353316,
                                            -5.362891166673945,
                                            -12.363648387545801,
                                           ])
        let result: RealDoubleArray = ifftr(complexArrayA)
        let expected: RealDoubleArray = vector(1 ... 9)
        XCTAssertEqual(result, expected, accuracy: accuracy, "fft failed")
    }
    
    // MARK: DFT
    
    func testDFTComple1x() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0], [0.0])
        let result: ComplexDoubleArray = dft(complexArrayA)
        let expected: ComplexDoubleArray = ([1.0], [0.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "dft failed")
    }
    
    func testDFTComplex() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDoubleArray = dft(complexArrayA)
        let expected: ComplexDoubleArray = ([10.0, -4.0, -2.0, 0.0], [10.0, 0.0, -2.0, -4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "dft failed")
    }
    
    func testDFTReal() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: ComplexDoubleArray = dftr(realArrayA)
        let expected: ComplexDoubleArray = ([10.0, -2.0, -2.0, -2.0], [0.0, 2.0, 0.0, -2.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "dftf failed")
    }
    
    func testIDFTComplex1() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0], [0.0])
        let result: ComplexDoubleArray = idft(complexArrayA)
        let expected: ComplexDoubleArray = ([1.0], [0.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "idft failed")
    }
    
    func testIDFTComplex() throws {
        let complexArrayA: ComplexDoubleArray = ([10.0, -4.0, -2.0, 0.0], [10.0, 0.0, -2.0, -4.0])
        let result: ComplexDoubleArray = idft(complexArrayA)
        let expected: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "idft failed")
    }
    
    func testIDFTReal1() throws {
        let complexArrayA: ComplexDoubleArray = ([2.0], [0.0])
        let result: RealDoubleArray = idftr(complexArrayA)
        let expected: RealDoubleArray = [2.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "idftf failed")
    }
    
    func testIDFTReal() throws {
        let complexArrayA: ComplexDoubleArray = ([10.0, -2.0, -2.0, -2.0], [0.0, 2.0, 0.0, -2.0])
        let result: RealDoubleArray = idftr(complexArrayA)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "idftf failed")
    }
    
    // MARK: FFTX
    
    func testFFTXReal() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0]
        let result: ComplexDoubleArray = fftx(realArrayA)
        let expected: ComplexDoubleArray = ([10.0, -2.0, -2.0, -2.0], [0.0, 2.0, 0.0, -2.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fftx failed")
    }
    
    func testFFTXComplex() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDoubleArray = fftx(complexArrayA)
        let expected: ComplexDoubleArray = ([10.0, -4.0, -2.0, 0.0], [10.0, 0.0, -2.0, -4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fftx failed")
    }
    
    func testIFFTXComplex() throws {
        let complexArrayA: ComplexDoubleArray = ([10.0, -4.0, -2.0, 0.0], [10.0, 0.0, -2.0, -4.0])
        let result: ComplexDoubleArray = ifftx(complexArrayA)
        let expected: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifftx failed")
    }
    
    // MARK: DFT 3 and 5 radix
    
    func testDFTReal1() throws {
        let realArrayA: RealDoubleArray = [1.0]
        let result: ComplexDoubleArray = dftr(realArrayA)
        let expected: ComplexDoubleArray = ([1.0],
                                      [0.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "dftr failed")
    }
    
    func testDFTReal3() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0]
        let result: ComplexDoubleArray = dftr(realArrayA)
        let expected: ComplexDoubleArray = ([6.0, -1.5, -1.5],
                                      [
                                        0.0,
                                        0.866025403784439,
                                        -0.866025403784439,
                                      ])
        XCTAssertEqual(result, expected, accuracy: accuracy, "dftr failed")
    }
    
    func testDFTReal5() throws {
        let realArrayA: RealDoubleArray = vector(1.0 ... 5.0)
        let result: ComplexDoubleArray = dftr(realArrayA)
        let expected: ComplexDoubleArray = ([15.0, -2.5, -2.5, -2.5, -2.5],
                                      [
                                        0.0,
                                        3.440954801177933,
                                        0.812299240582266,
                                        -0.812299240582266,
                                        -3.440954801177933,
                                      ])
        XCTAssertEqual(result, expected, accuracy: accuracy, "dftr failed")
    }
    
    func testDFTReal35() throws {
        let realArrayA: RealDoubleArray = vector(1.0 ... 15.0)
        let result: ComplexDoubleArray = dftr(realArrayA)
        let expected: ComplexDoubleArray = ([1.2e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2,
                                       -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2],
                                      [
                                        0.0,
                                        35.284725821088408,
                                        16.845275804281620,
                                        10.322864403533801,
                                        6.753030332233800,
                                        4.330127018922193,
                                        2.436897721746798,
                                        0.788281764492574,
                                        -0.788281764492574,
                                        -2.436897721746798,
                                        -4.330127018922193,
                                        -6.753030332233800,
                                        -10.322864403533801,
                                        -16.845275804281620,
                                        -35.284725821088408,
                                      ])
        XCTAssertEqual(result, expected, accuracy: accuracy, "dftr failed")
    }
    
    func testDFTReal33() throws {
        let realArrayA: RealDoubleArray = vector(1 ... 9)
        let result: ComplexDoubleArray = dftr(realArrayA)
        let expected: ComplexDoubleArray = ([45.0, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5],
                                      [
                                        0.0,
                                        12.363648387545801,
                                        5.362891166673945,
                                        2.598076211353316,
                                        0.793471413188091,
                                        -0.793471413188091,
                                        -2.598076211353316,
                                        -5.362891166673945,
                                        -12.363648387545801,
                                      ])
        XCTAssertEqual(result, expected, accuracy: accuracy, "dftr failed")
    }
    
    func testFFTShiftForwardBackwardEven() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexDoubleArray = ifftshift(fftshift(complexArrayA))
        let expected: ComplexDoubleArray = complexArrayA
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifftshift(fftshift) failed")
    }
    
    func testFFTShiftForwardBackwardOdd() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0, 5.0], [1.0, 2.0, 3.0, 4.0, 5.0])
        let result: ComplexDoubleArray = ifftshift(fftshift(complexArrayA))
        let expected: ComplexDoubleArray = complexArrayA
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifftshift(fftshift) failed")
    }
    
    func testFFTShiftEven() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], [1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
        let result: ComplexDoubleArray = fftshift(complexArrayA)
        let expected: ComplexDoubleArray = ([4.0, 5.0, 6.0, 1.0, 2.0, 3.0], [4.0, 5.0, 6.0, 1.0, 2.0, 3.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fftshift failed")
    }
    
    func testFFTShiftOdd() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0, 5.0], [1.0, 2.0, 3.0, 4.0, 5.0])
        let result: ComplexDoubleArray = fftshift(complexArrayA)
        let expected: ComplexDoubleArray = ([4.0, 5.0, 1.0, 2.0, 3.0], [4.0, 5.0, 1.0, 2.0, 3.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fftshift failed")
    }
    
    func testIFFTShiftEven() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], [1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
        let result: ComplexDoubleArray = ifftshift(complexArrayA)
        let expected: ComplexDoubleArray = ([4.0, 5.0, 6.0, 1.0, 2.0, 3.0], [4.0, 5.0, 6.0, 1.0, 2.0, 3.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fftshift failed")
    }
    
    func testIFFTShiftOdd() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0, 5.0], [1.0, 2.0, 3.0, 4.0, 5.0])
        let result: ComplexDoubleArray = ifftshift(complexArrayA)
        let expected: ComplexDoubleArray = ([3.0, 4.0, 5.0, 1.0, 2.0], [3.0, 4.0, 5.0, 1.0, 2.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fftshift failed")
    }
    
    func testFFTShiftOdd2() throws {
        let complexArrayA: ComplexDoubleArray = ([1.0, 2.0, 3.0, 4.0, 5.0], [1.0, 2.0, 3.0, 4.0, 5.0])
        let result: ComplexDoubleArray = fftshift(complexArrayA)
        let expected: ComplexDoubleArray = ([4.0, 5.0, 1.0, 2.0, 3.0], [4.0, 5.0, 1.0, 2.0, 3.0])
        XCTAssertEqual(result.0, expected.0, accuracy: 1e-6, "fftshift failed for real part")
        XCTAssertEqual(result.1, expected.1, accuracy: 1e-6, "fftshift failed for imaginary part")
    }
    
    func testFFTShifRealEven() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
        let result: RealDoubleArray = fftshift(realArrayA)
        let expected: RealDoubleArray = ([5.0, 6.0, 7.0, 8.0, 1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, accuracy: 1e-6, "fftshift failed part")
    }
    
    func testFFTShifRealOdd() throws {
        let realArrayA: RealDoubleArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0]
        let result: RealDoubleArray = fftshift(realArrayA)
        let expected: RealDoubleArray = [5.0, 6.0, 7.0, 1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, accuracy: 1e-6, "fftshift failed part")
    }
    
    func testIFFTShifRealEven() throws {
        let realArrayA: RealDoubleArray = [5.0, 6.0, 7.0, 8.0, 1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = ifftshift(realArrayA)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
        XCTAssertEqual(result, expected, accuracy: 1e-6, "fftshift failed part")
    }
    
    func testIFFTShifRealOdd() throws {
        let realArrayA: RealDoubleArray = [5.0, 6.0, 7.0, 1.0, 2.0, 3.0, 4.0]
        let result: RealDoubleArray = ifftshift(realArrayA)
        let expected: RealDoubleArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0]
        XCTAssertEqual(result, expected, accuracy: 1e-6, "fftshift failed part")
    }
}
