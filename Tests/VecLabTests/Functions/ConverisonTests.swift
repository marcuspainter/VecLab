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
    let accuracy: RealDouble = 1e-6

    func testCart2Pol() throws {
        let x: RealDouble = 1.0
        let y: RealDouble = 1.0
        let result = cart2pol(x, y)
        let expected: (Double, Double) = (0.785398163397448, 1.414213562373095)
        XCTAssertEqual(result, expected, accuracy: accuracy, "cart2pol failed")
    }

    func testCart2Pol3D() throws {
        let x: RealDouble = 1.0
        let y: RealDouble = 1.0
        let z: RealDouble = 1.0
        let result: (Double, Double, Double) = cart2pol(x, y, z)
        let expected: (Double, Double, Double) = (0.785398163397448, 1.414213562373095, 1.0)
        
        XCTAssertEqual(result.0, expected.0, accuracy: accuracy, "cart2pol failed")
        XCTAssertEqual(result.1, expected.1, accuracy: accuracy, "cart2pol failed")
        XCTAssertEqual(result.2, expected.2, accuracy: accuracy, "cart2pol failed")
    }

    func testCart2sph() throws {
        let x: RealDouble = 1.0
        let y: RealDouble = 1.0
        let z: RealDouble = 1.0
        let result: (Double, Double, Double) = cart2sph(x, y, z)
        let expected: (Double, Double, Double) = (0.785398163397448, 0.615479708670387, 1.732050807568877)
        XCTAssertEqual(result.0, expected.0, accuracy: accuracy, "cart2sph failed")
        XCTAssertEqual(result.1, expected.1, accuracy: accuracy, "cart2sph failed")
        XCTAssertEqual(result.2, expected.2, accuracy: accuracy, "cart2sph failed")
    }

    func testDb2mag() throws {
        let db: RealDouble = -6.020599913279624
        let result: RealDouble = db2mag(db)
        let expected: RealDouble = 0.5
        XCTAssertEqual(result, expected, accuracy: accuracy, "db2mag failed")
    }

    func testDb2magArray() throws {
        let db: RealDoubleArray = [0.0, 1.0,  -6.020599913279624]
        let result: RealDoubleArray = db2mag(db)
        let expected: RealDoubleArray = [1.0,  1.122018454301963, 0.5]
        XCTAssertEqual(result, expected, accuracy: accuracy, "db2mag failed")
    }

    func testDb2pow() throws {
        let db: RealDouble = 1.0
        let result: RealDouble = db2pow(db)
        let expected: RealDouble = 1.258925411794167
        XCTAssertEqual(result, expected, accuracy: accuracy, "db2pow failed")
    }

    func testDb2powArray() throws {
        let db: RealDoubleArray = [1.0, 1.0]
        let result: RealDoubleArray = db2pow(db)
        let expected: RealDoubleArray = [1.258925411794167, 1.258925411794167]
        XCTAssertEqual(result, expected, accuracy: accuracy, "db2pow failed")
    }

    func testDeg2rad() throws {
        let deg: RealDouble = 180.0
        let result: RealDouble = deg2rad(deg)
        let expected = Double.pi
        XCTAssertEqual(result, expected, accuracy: accuracy, "deg2rad failed")
    }

    func testDeg2radArray() throws {
        let deg: RealDoubleArray = [180.0, 90.0]
        let result: RealDoubleArray = deg2rad(deg)
        let expected: RealDoubleArray = [Double.pi, Double.pi / 2]
        XCTAssertEqual(result, expected, accuracy: accuracy, "deg2rad failed")
    }

    func testMag2db() throws {
        let mag: RealDouble = 1.0
        let result: RealDouble = mag2db(mag)
        let expected: RealDouble = 0.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "deg2rad failed")
    }

    func testMag2dbArray() throws {
        let mag: RealDoubleArray = [1.0, 0.5]
        let result: RealDoubleArray = mag2db(mag)
        let expected: RealDoubleArray = [0.0, -6.020599913279624]
        XCTAssertEqual(result, expected, accuracy: accuracy, "deg2rad failed")
    }

    func testPol2cart() throws {
        let theta: RealDouble = 0.785398163397448
        let rho: RealDouble = 1.414213562373095
        let result: (Double, Double) = pol2cart(theta, rho)
        let expected: (Double, Double) = (1.0, 1.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "pol2cart failed")
    }
    
    func testPol2cart3D() throws {
        let theta: RealDouble = 0.785398163397448
        let rho: RealDouble = 1.414213562373095
        let z: RealDouble = 1.0
        let result: (Double, Double, Double) = pol2cart(theta, rho, z)
        let expected: (Double, Double, Double) = (1.0, 1.0, 1.0)
        XCTAssertEqual(result.0, expected.0, accuracy: accuracy, "pol2cart failed")
        XCTAssertEqual(result.1, expected.1, accuracy: accuracy, "pol2cart failed")
        XCTAssertEqual(result.2, expected.2, accuracy: accuracy, "pol2cart failed")
    }

    func testPow2db() throws {
        let db: RealDouble = 1.258925411794167
        let result: RealDouble = pow2db(db)
        let expected: RealDouble = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "pow2db failed")
    }

    func testPow2dbArray() throws {
        let db: RealDoubleArray = [1.258925411794167, 1.258925411794167]
        let result: RealDoubleArray = pow2db(db)
        let expected: RealDoubleArray = [1.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "pow2db failed")
    }

    func testRad2deg() throws {
        let rad: RealDouble = Double.pi
        let result: RealDouble = rad2deg(rad)
        let expected: RealDouble = 180.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "rad2deg failed")
    }

    func testRad2degArray() throws {
        let rad: RealDoubleArray = [Double.pi, Double.pi]
        let result: RealDoubleArray = rad2deg(rad)
        let expected: RealDoubleArray = [180.0, 180.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "rad2deg failed")
    }

    func testSph2cart() throws {
        let azimuth: RealDouble = 0.785398163397448
        let elevation: RealDouble = 0.615479708670387
        let r: RealDouble = 1.732050807568877

        let result: (Double, Double, Double) = sph2cart(azimuth, elevation, r)
        let expected: (Double, Double, Double) = (1.0, 1.0, 1.0)
        XCTAssertEqual(result.0, expected.0, accuracy: accuracy, "rad2deg failed")
        XCTAssertEqual(result.1, expected.1, accuracy: accuracy, "rad2deg failed")
        XCTAssertEqual(result.2, expected.2, accuracy: accuracy, "rad2deg failed")
    }
}
