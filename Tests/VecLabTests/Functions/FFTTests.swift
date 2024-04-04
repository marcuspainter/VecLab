//
//  FFTTests.swift
//
//
//  Created by Marcus Painter on 19/09/2023.
//

import VecLab
import XCTest

class FFTTests: XCTestCase {
    let accuracy: Real = 1e-5

    // MARK: FFT

    func testFFTComplex() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = fft(complexArrayA)
        let expected: ComplexArray = ([10.0, -4.0, -2.0, 0.0], [10.0, 0.0, -2.0, -4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fft failed")

        let xx = idft(complex(count: 10))
    }

    func testFFTReal() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: ComplexArray = fftr(realArrayA)
        let expected: ComplexArray = ([10.0, -2.0, -2.0, -2.0], [0.0, 2.0, 0.0, -2.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fft failed")
    }

    func testIFFTComplex() throws {
        let complexArrayA: ComplexArray = ([10.0, -4.0, -2.0, 0.0], [10.0, 0.0, -2.0, -4.0])
        let result: ComplexArray = ifft(complexArrayA)
        let expected: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifft failed")
    }

    func testIFFTReal() throws {
        let complexArrayA: ComplexArray = ([10.0, -2.0, -2.0, -2.0], [0.0, 2.0, 0.0, -2.0])
        let result: RealArray = ifftr(complexArrayA)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifft failed")
    }

    // MARK: FFT 3 and 5 radix

    func testFFTReal3() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0]
        let result: ComplexArray = fftr(realArrayA)
        let expected: ComplexArray = ([6.0, -1.5, -1.5],
                                      [
                                          0.0,
                                          0.866025403784439,
                                          -0.866025403784439,
                                      ])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fft failed")
    }

    func testFFTReal5() throws {
        let realArrayA: RealArray = vector(1 ... 5)
        let result: ComplexArray = fftr(realArrayA)
        let expected: ComplexArray = ([15.0, -2.5, -2.5, -2.5, -2.5],
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
        let realArrayA: RealArray = vector(1 ... 15)
        let result: ComplexArray = fftr(realArrayA)
        let expected: ComplexArray = ([1.2e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2,
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
        XCTAssertEqual(result, expected, accuracy: accuracy, "fft failed")
    }

    func testFFTReal33() throws {
        let realArrayA: RealArray = vector(1 ... 9)
        let result: ComplexArray = fftr(realArrayA)
        let expected: ComplexArray = ([45.0, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5],
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
        let complexArrayA: ComplexArray = ([6.0, -1.5, -1.5],
                                           [
                                               0.0,
                                               -0.866025403784439,
                                               0.866025403784439,
                                           ])
        let result: RealArray = ifftr(complexArrayA)
        let expected: RealArray = [1.0, 2.0, 3.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifft failed")
    }

    func testIFFTReal5() throws {
        let complexArrayA: ComplexArray = ([15.0, -2.5, -2.5, -2.5, -2.5],
                                           [
                                               0.0,
                                               -3.440954801177933,
                                               -0.812299240582266,
                                               0.812299240582266,
                                               3.440954801177933,
                                           ])
        let result: RealArray = ifftr(complexArrayA)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifft failed")
    }

    func testIFFTReal35() throws {
        let complexArrayA: ComplexArray = ([1.2e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2,
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
        let result: RealArray = ifftr(complexArrayA)
        let expected: RealArray = vector(1 ... 15)
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifft failed")
    }

    func testIFFTReal33() throws {
        let complexArrayA: ComplexArray = ([45.0, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5],
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
        let result: RealArray = ifftr(complexArrayA)
        let expected: RealArray = vector(1 ... 9)
        XCTAssertEqual(result, expected, accuracy: accuracy, "fft failed")
    }

    // MARK: DFT

    func testDFTComplex() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = dft(complexArrayA)
        let expected: ComplexArray = ([10.0, -4.0, -2.0, 0.0], [10.0, 0.0, -2.0, -4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "dft failed")
    }

    func testDFTReal() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0, 4.0]
        let result: ComplexArray = dftr(realArrayA)
        let expected: ComplexArray = ([10.0, -2.0, -2.0, -2.0], [0.0, 2.0, 0.0, -2.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "dftf failed")
    }

    func testIDFTComplex() throws {
        let complexArrayA: ComplexArray = ([10.0, -4.0, -2.0, 0.0], [10.0, 0.0, -2.0, -4.0])
        let result: ComplexArray = idft(complexArrayA)
        let expected: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "idft failed")
    }

    func testIDFTReal() throws {
        let complexArrayA: ComplexArray = ([10.0, -2.0, -2.0, -2.0], [0.0, 2.0, 0.0, -2.0])
        let result: RealArray = idftr(complexArrayA)
        let expected: RealArray = [1.0, 2.0, 3.0, 4.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "idftf failed")
    }

    // MARK: FFTX

    func testFFTXComplex() throws {
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = fftx(complexArrayA)
        let expected: ComplexArray = ([10.0, -4.0, -2.0, 0.0], [10.0, 0.0, -2.0, -4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fftx failed")
    }

    func testIFFTXComplex() throws {
        let complexArrayA: ComplexArray = ([10.0, -4.0, -2.0, 0.0], [10.0, 0.0, -2.0, -4.0])
        let result: ComplexArray = ifftx(complexArrayA)
        let expected: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifftx failed")
    }

    // MARK: DFT 3 and 5 radix

    func testDFTReal3() throws {
        let realArrayA: RealArray = [1.0, 2.0, 3.0]
        let result: ComplexArray = dftr(realArrayA)
        let expected: ComplexArray = ([6.0, -1.5, -1.5],
                                      [
                                          0.0,
                                          0.866025403784439,
                                          -0.866025403784439,
                                      ])
        XCTAssertEqual(result, expected, accuracy: accuracy, "dftr failed")
    }

    func testDFTReal5() throws {
        let realArrayA: RealArray = vector(1.0 ... 5.0)
        let result: ComplexArray = dftr(realArrayA)
        let expected: ComplexArray = ([15.0, -2.5, -2.5, -2.5, -2.5],
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
        let realArrayA: RealArray = vector(1.0 ... 15.0)
        let result: ComplexArray = dftr(realArrayA)
        let expected: ComplexArray = ([1.2e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2, -0.075e2,
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
        XCTAssertEqual(result, expected, accuracy: accuracy, "dftr failed")
    }

    func testDFTReal33() throws {
        let realArrayA: RealArray = vector(1 ... 9)
        let result: ComplexArray = dftr(realArrayA)
        let expected: ComplexArray = ([45.0, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5, -4.5],
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
}
