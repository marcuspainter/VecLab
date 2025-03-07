//
//  ConversionTests.swift
//
//
//  Created by Marcus Painter on 25/06/2024.
//

import Foundation

import Foundation
import VecLab
import XCTest

class ConversionTests: XCTestCase {
    let accuracy: Real = 1e-6

    func testCart2Pol() throws {
        let x: Real = 1.0
        let y: Real = 1.0
        let result = cart2pol(x, y)
        let expected: (Real, Real) = (0.785398163397448, 1.414213562373095)
        XCTAssertEqual(result, expected, accuracy: accuracy, "cart2pol failed")
    }

    func testCart2Pol3D() throws {
        let x: Real = 1.0
        let y: Real = 1.0
        let z: Real = 1.0
        let result: (Real, Real, Real) = cart2pol(x, y, z)
        let expected: (Real, Real, Real) = (0.785398163397448, 1.414213562373095, 1.0)
        
        XCTAssertEqual(result.0, expected.0, accuracy: accuracy, "cart2pol failed")
        XCTAssertEqual(result.1, expected.1, accuracy: accuracy, "cart2pol failed")
        XCTAssertEqual(result.2, expected.2, accuracy: accuracy, "cart2pol failed")
    }

    func testCart2sph() throws {
        let x: Real = 1.0
        let y: Real = 1.0
        let z: Real = 1.0
        let result: (Real, Real, Real) = cart2sph(x, y, z)
        let expected: (Real, Real, Real) = (0.785398163397448, 0.615479708670387, 1.732050807568877)
        XCTAssertEqual(result.0, expected.0, accuracy: accuracy, "cart2sph failed")
        XCTAssertEqual(result.1, expected.1, accuracy: accuracy, "cart2sph failed")
        XCTAssertEqual(result.2, expected.2, accuracy: accuracy, "cart2sph failed")
    }

    func testDb2mag() throws {
        let db: Real = -6.020599913279624
        let result: Real = db2mag(db)
        let expected: Real = 0.5
        XCTAssertEqual(result, expected, accuracy: accuracy, "db2mag failed")
    }

    func testDb2magArray() throws {
        let db: RealArray = [0.0, 1.0,  -6.020599913279624]
        let result: RealArray = db2mag(db)
        let expected: RealArray = [1.0,  1.122018454301963, 0.5]
        XCTAssertEqual(result, expected, accuracy: accuracy, "db2mag failed")
    }

    func testDb2pow() throws {
        let db: Real = 1.0
        let result: Real = db2pow(db)
        let expected: Real = 1.258925411794167
        XCTAssertEqual(result, expected, accuracy: accuracy, "db2pow failed")
    }

    func testDb2powArray() throws {
        let db: RealArray = [1.0, 1.0]
        let result: RealArray = db2pow(db)
        let expected: RealArray = [1.258925411794167, 1.258925411794167]
        XCTAssertEqual(result, expected, accuracy: accuracy, "db2pow failed")
    }

    func testDeg2rad() throws {
        let deg: Real = 180.0
        let result: Real = deg2rad(deg)
        let expected = Real.pi
        XCTAssertEqual(result, expected, accuracy: accuracy, "deg2rad failed")
    }

    func testDeg2radArray() throws {
        let deg: RealArray = [180.0, 90.0]
        let result: RealArray = deg2rad(deg)
        let expected: RealArray = [Real.pi, Real.pi / 2]
        XCTAssertEqual(result, expected, accuracy: accuracy, "deg2rad failed")
    }

    func testMag2db() throws {
        let mag: Real = 1.0
        let result: Real = mag2db(mag)
        let expected: Real = 0.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "deg2rad failed")
    }

    func testMag2dbArray() throws {
        let mag: RealArray = [1.0, 0.5]
        let result: RealArray = mag2db(mag)
        let expected: RealArray = [0.0, -6.020599913279624]
        XCTAssertEqual(result, expected, accuracy: accuracy, "deg2rad failed")
    }

    func testPol2cart() throws {
        let theta: Real = 0.785398163397448
        let rho: Real = 1.414213562373095
        let result: (Real, Real) = pol2cart(theta, rho)
        let expected: (Real, Real) = (1.0, 1.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "pol2cart failed")
    }
    
    func testPol2cart3D() throws {
        let theta: Real = 0.785398163397448
        let rho: Real = 1.414213562373095
        let z: Real = 1.0
        let result: (Real, Real, Real) = pol2cart(theta, rho, z)
        let expected: (Real, Real, Real) = (1.0, 1.0, 1.0)
        XCTAssertEqual(result.0, expected.0, accuracy: accuracy, "pol2cart failed")
        XCTAssertEqual(result.1, expected.1, accuracy: accuracy, "pol2cart failed")
        XCTAssertEqual(result.2, expected.2, accuracy: accuracy, "pol2cart failed")
    }

    func testPow2db() throws {
        let db: Real = 1.258925411794167
        let result: Real = pow2db(db)
        let expected: Real = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "pow2db failed")
    }

    func testPow2dbArray() throws {
        let db: RealArray = [1.258925411794167, 1.258925411794167]
        let result: RealArray = pow2db(db)
        let expected: RealArray = [1.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "pow2db failed")
    }

    func testRad2deg() throws {
        let rad: Real = Real.pi
        let result: Real = rad2deg(rad)
        let expected: Real = 180.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "rad2deg failed")
    }

    func testRad2degArray() throws {
        let rad: RealArray = [Real.pi, Real.pi]
        let result: RealArray = rad2deg(rad)
        let expected: RealArray = [180.0, 180.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "rad2deg failed")
    }

    func testSph2cart() throws {
        let azimuth: Real = 0.785398163397448
        let elevation: Real = 0.615479708670387
        let r: Real = 1.732050807568877

        let result: (Real, Real, Real) = sph2cart(azimuth, elevation, r)
        let expected: (Real, Real, Real) = (1.0, 1.0, 1.0)
        XCTAssertEqual(result.0, expected.0, accuracy: accuracy, "rad2deg failed")
        XCTAssertEqual(result.1, expected.1, accuracy: accuracy, "rad2deg failed")
        XCTAssertEqual(result.2, expected.2, accuracy: accuracy, "rad2deg failed")
    }
    
    func testFreq2bin() throws {
        let f: Real = 100.0
        let N: Int = 1024
        let fs: Real = 48000.0

        let result: Int = freq2bin(f: f, N: N, fs: fs)
        let expected: Real = 2.0
        XCTAssertEqual(Real(result), expected, accuracy: accuracy, "freq2bin failed")
    }
    
    func testBin2freq() throws {
        let bin: Int = 2
        let N: Int = 1024
        let fs: Real = 48000.0

        let result: Real = bin2freq(bin: bin, N: N, fs: fs)
        let expected: Real = 93.75
        XCTAssertEqual(result, expected, accuracy: accuracy, "bin2freq failed")
    }
}
