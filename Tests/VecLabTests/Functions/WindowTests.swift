//
//  WindowTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import XCTest
import VecLab

class WindowTests: XCTestCase {

    let accuracy: Real = 1e-6

    // MARK: blackman

    func testBlackmanSymmetric() throws {
        let L = 8
        let result: RealArray = blackman(L)
        let expected: RealArray = [
            0,
            0.090453424354128,
            0.459182957545964,
            0.920363618099908,
            0.920363618099908,
            0.459182957545964,
            0.090453424354128,
            0
            ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "blackman failed")
    }

    func testBlackmanPeriodic() throws {
        let L = 8
        let result: RealArray = blackman(L, type: .periodic)
        let expected: RealArray = [
            0,
            0.066446609406726,
            0.340000000000000,
            0.773553390593274,
            1.000000000000000,
            0.773553390593274,
            0.340000000000000,
            0.066446609406726
            ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "blackman failed")
    }

    func testBlackman0() throws {
        let L = 0
        let result: RealArray = blackman(L, type: .periodic)
        let expected: RealArray = []
        XCTAssertEqual(result, expected, accuracy: accuracy, "blackman failed")
    }

    // MARK: blackmanharris

    func testBlackmanharrisSymmetric() throws {
        let L = 8
        let result: RealArray = blackmanharris(L)
        let expected: RealArray = [
            0.000060000000000,
            0.033391723478151,
            0.332833504298565,
            0.889369772223284,
            0.889369772223284,
            0.332833504298565,
            0.033391723478151,
            0.000060000000000
            ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "blackmanharris failed")
    }

    func testBlackmanharrisPeriodic() throws {
        let L = 8
        let result: RealArray = blackmanharris(L, type: .periodic)
        let expected: RealArray = [
            0.000060000000000,
            0.021735837018680,
            0.217470000000000,
            0.695764162981320,
            1.000000000000000,
            0.695764162981320,
            0.217470000000000,
            0.021735837018680
            ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "blackmanharris failed")
    }

    func testBlackmanharris0() throws {
        let L = 0
        let result: RealArray = blackmanharris(L, type: .periodic)
        let expected: RealArray = []
        XCTAssertEqual(result, expected, accuracy: accuracy, "blackmanharris failed")
    }

    // MARK: flatopwin

    func testFlattopwinSymmetric() throws {
        let L = 8
        let result: RealArray = flattopwin(L)
        let expected: RealArray = [
            -0.000421051000000,
            -0.036840781154923,
             0.010703716716153,
             0.780873914938770,
             0.780873914938770,
             0.010703716716153,
            -0.036840781154923,
            -0.000421051000000
            ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "flattopwin failed")
    }

    func testFlattopwinPeriodic() throws {
        let L = 8
        let result: RealArray = flattopwin(L, type: .periodic)
        let expected: RealArray = [
            -0.000421051000000,
            -0.026872193286335,
            -0.054736840000000,
             0.444135357286334,
             1.000000003000000,
             0.444135357286334,
            -0.054736840000000,
            -0.026872193286335
            ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "flattopwin failed")
    }

    func testFlattopwin0() throws {
        let L = 0
        let result: RealArray = flattopwin(L, type: .periodic)
        let expected: RealArray = []
        XCTAssertEqual(result, expected, accuracy: accuracy, "flattopwin failed")
    }

    // MARK: gausswin

    func testGausswin() throws {
        let L = 8
        let result: RealArray = gausswin(L)
        let expected: RealArray = [
            0.043936933623407,
            0.203032796251138,
            0.563279350501654,
            0.938215595719108,
            0.938215595719108,
            0.563279350501654,
            0.203032796251138,
            0.043936933623407
            ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "gausswin failed")
    }

    func testGausswinAlpha() throws {
        let L = 8
        let result: RealArray = gausswin(L, alpha: 3.5)
        let expected: RealArray = [
            0.002187491118183,
            0.043936933623407,
            0.324652467358350,
            0.882496902584595,
            0.882496902584595,
            0.324652467358350,
            0.043936933623407,
            0.002187491118183
            ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "gausswin failed")
    }

    func testGausswin0() throws {
        let L = 0
        let result: RealArray = gausswin(L)
        let expected: RealArray = []
        XCTAssertEqual(result, expected, accuracy: accuracy, "gausswin failed")
    }

    // MARK: hamming

    func testHammingSymmetric() throws {
        let L = 8
        let result: RealArray = hamming(L)
        let expected: RealArray = [
            0.080000000000000,
            0.253194691144983,
            0.642359629619905,
            0.954445679235113,
            0.954445679235113,
            0.642359629619905,
            0.253194691144983,
            0.080000000000000
            ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "hamming failed")
    }

    func testHammingPeriodic() throws {
        let L = 8
        let result: RealArray = hamming(L, type: .periodic)
        let expected: RealArray = [
            0.080000000000000,
            0.214730880654188,
            0.540000000000000,
            0.865269119345812,
            1.000000000000000,
            0.865269119345812,
            0.540000000000000,
            0.214730880654188
            ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "hamming failed")
    }

    func testHamming0() throws {
        let L = 0
        let result: RealArray = hamming(L, type: .periodic)
        let expected: RealArray = []
        XCTAssertEqual(result, expected, accuracy: accuracy, "hamming failed")
    }

    // MARK: hann

    func testHannSymmetric() throws {
        let L = 8
        let result: RealArray = hann(L)
        let expected: RealArray = [
                            0,
            0.188255099070633,
            0.611260466978157,
            0.950484433951210,
            0.950484433951210,
            0.611260466978157,
            0.188255099070633,
                            0
            ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "hann failed")
    }

    func testHannPeriodic() throws {
        let L = 8
        let result: RealArray = hann(L, type: .periodic)
        let expected: RealArray = [
                            0,
            0.146446609406726,
            0.500000000000000,
            0.853553390593274,
            1.000000000000000,
            0.853553390593274,
            0.500000000000000,
            0.146446609406726
            ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "hann failed")
    }

    func testHann0() throws {
        let L = 0
        let result: RealArray = hann(L, type: .periodic)
        let expected: RealArray = []
        XCTAssertEqual(result, expected, accuracy: accuracy, "hann failed")
    }

    // MARK: kaiser

    func testKaiser() throws {
        let L = 8
        let result: RealArray = kaiser(L)
        let expected: RealArray = [
            0.940306193319157,
            0.969312119993129,
            0.988896402682529,
            0.998763147506096,
            0.998763147506096,
            0.988896402682529,
            0.969312119993129,
            0.940306193319157
            ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "kaiser failed")
    }

    func testKaiserBeta() throws {
        let L = 8
        let result: RealArray = kaiser(L, beta: 1.0)
        let expected: RealArray = [
            0.789848314825112,
            0.889565723956427,
            0.959454895441670,
            0.995450579301045,
            0.995450579301045,
            0.959454895441670,
            0.889565723956427,
            0.789848314825112

            ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "kaiser failed")
    }

    func testKaiser0() throws {
        let L = 0
        let result: RealArray = hann(L, type: .periodic)
        let expected: RealArray = []
        XCTAssertEqual(result, expected, accuracy: accuracy, "kaiser failed")
    }

    // MARK: rectwin

    func testRectwin() throws {
        let L = 8
        let result: RealArray = rectwin(L)
        let expected: RealArray = [
            1.0,
            1.0,
            1.0,
            1.0,
            1.0,
            1.0,
            1.0,
            1.0
            ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "rectwin failed")
    }

    func testRectwin0() throws {
        let L = 0
        let result: RealArray = rectwin(L)
        let expected: RealArray = []
        XCTAssertEqual(result, expected, accuracy: accuracy, "rectwin failed")
    }
}
