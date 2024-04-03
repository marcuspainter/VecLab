//
//  FFTTests.swift
//  
//
//  Created by Marcus Painter on 19/09/2023.
//

import XCTest
import VecLab

class FFTTests: XCTestCase {
    
    let accuracy: Real = 1e-5
    
    // MARK: FFT

    func testFFTComplex() throws {
        
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = fft(complexArrayA)
        let expected: ComplexArray = ([10.0, -4.0, -2.0, 0.0], [10.0, 0.0, -2.0, -4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fft failed")
    }
    
    func testFFTReal() throws {
        
        let realArrayA: RealArray = ([1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = fftr(realArrayA)
        let expected: ComplexArray =  ([10.0, -2.0, -2.0, -2.0], [0.0, 2.0, 0.0, -2.0])
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
        let expected: RealArray =  ([1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifft failed")
    }
    
    // MARK: DFT
    
    func testDFTComplex() throws {
        
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = dft(complexArrayA)
        let expected: ComplexArray = ([10.0, -4.0, -2.0, 0.0], [10.0, 0.0, -2.0, -4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fft failed")
    }
    
    func testDFTReal() throws {
        
        let realArrayA: RealArray = ([1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = dft(realArrayA)
        let expected: ComplexArray =  ([10.0, -2.0, -2.0, -2.0], [0.0, 2.0, 0.0, -2.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fft failed")
    }
    
    func testIDFTComplex() throws {
        
        let complexArrayA: ComplexArray = ([10.0, -4.0, -2.0, 0.0], [10.0, 0.0, -2.0, -4.0])
        let result: ComplexArray = idft(complexArrayA)
        let expected: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifft failed")
    }
    
    func testIDFTReal() throws {
        
        let complexArrayA: ComplexArray = ([10.0, -2.0, -2.0, -2.0], [0.0, 2.0, 0.0, -2.0])
        let result: RealArray = idft(complexArrayA)
        let expected: RealArray =  ([1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifft failed")
    }
    
    func testFFTXComplex() throws {
        
        let complexArrayA: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        let result: ComplexArray = fftx(complexArrayA)
        let expected: ComplexArray = ([10.0, -4.0, -2.0, 0.0], [10.0, 0.0, -2.0, -4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "fft failed")
    }
    
    func testIFFTXComplex() throws {
        
        let complexArrayA: ComplexArray = ([10.0, -4.0, -2.0, 0.0], [10.0, 0.0, -2.0, -4.0])
        let result: ComplexArray = ifftx(complexArrayA)
        let expected: ComplexArray = ([1.0, 2.0, 3.0, 4.0], [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(result, expected, accuracy: accuracy, "ifft failed")
    }

}
