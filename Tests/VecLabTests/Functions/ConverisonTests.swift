//
//  File.swift
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
        let x = 1.0
        let y = 1.0
        let result = cart2pol(x, y)
        let expected = (0.785398163397448, 1.414213562373095)
        XCTAssertEqual(result, expected, accuracy: accuracy, "cart2pol failed")
    }

    func testCart2Pol3D() throws {
        let x = 1.0
        let y = 1.0
        let z = 1.0
        let result = cart2pol(x, y, z)
        let expected = (0.785398163397448, 1.414213562373095, 1.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "cart2pol failed")
    }

    func testCart2sph() throws {
        let x = 1.0
        let y = 1.0
        let z = 1.0
        let result = cart2sph(x, y, z)
        let expected = (0.785398163397448, 0.615479708670387, 1.732050807568877)
        XCTAssertEqual(result, expected, accuracy: accuracy, "cart2sph failed")
    }

    func testDb2mag() throws {
        let db = 0.0
        let result = db2mag(db)
        let expected = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "db2mag failed")
    }

    func testDb2magArray() throws {
        let db = [0.0, 0.0]
        let result = db2mag(db)
        let expected = [1.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "db2mag failed")
    }

    func testDb2pow() throws {
        let db = 1.0
        let result = db2pow(db)
        let expected = 1.258925411794167
        XCTAssertEqual(result, expected, accuracy: accuracy, "db2pow failed")
    }

    func testDb2powArray() throws {
        let db = [1.0, 1.0]
        let result = db2pow(db)
        let expected = [1.258925411794167, 1.258925411794167]
        XCTAssertEqual(result, expected, accuracy: accuracy, "db2pow failed")
    }

    func testDeg2rad() throws {
        let deg = 180.0
        let result = deg2rad(deg)
        let expected = Real.pi
        XCTAssertEqual(result, expected, accuracy: accuracy, "deg2rad failed")
    }

    func testDeg2radArray() throws {
        let deg = [180.0, 90.0]
        let result = deg2rad(deg)
        let expected = [Real.pi, Real.pi / 2]
        XCTAssertEqual(result, expected, accuracy: accuracy, "deg2rad failed")
    }

    func testMag2db() throws {
        let mag = 1.0
        let result = mag2db(mag)
        let expected = 0.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "deg2rad failed")
    }

    func testMag2dbArray() throws {
        let mag = [1.0, 1.0]
        let result = mag2db(mag)
        let expected = [0.0, 0.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "deg2rad failed")
    }

    func testPol2cart() throws {
        let theta = 0.785398163397448
        let rho = 1.414213562373095
        let result = pol2cart(theta, rho)
        let expected = (1.0, 1.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "pol2cart failed")
    }
    
    func testPol2cart3D() throws {
        let theta = 0.785398163397448
        let rho = 1.414213562373095
        let z = 1.0
        let result = pol2cart(theta, rho, z)
        let expected = (1.0, 1.0, 1.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "pol2cart failed")
    }

    func testPow2db() throws {
        let db = 1.258925411794167
        let result = pow2db(db)
        let expected = 1.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "pow2db failed")
    }

    func testPow2dbArray() throws {
        let db = [1.258925411794167, 1.258925411794167]
        let result = pow2db(db)
        let expected = [1.0, 1.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "pow2db failed")
    }

    func testRad2deg() throws {
        let rad = Real.pi
        let result = rad2deg(rad)
        let expected = 180.0
        XCTAssertEqual(result, expected, accuracy: accuracy, "rad2deg failed")
    }

    func testRad2degArray() throws {
        let rad = [Real.pi, Real.pi]
        let result = rad2deg(rad)
        let expected = [180.0, 180.0]
        XCTAssertEqual(result, expected, accuracy: accuracy, "rad2deg failed")
    }

    func testSph2cart() throws {
        let azimuth = 0.785398163397448
        let elevation = 0.615479708670387
        let r = 1.732050807568877

        let result = sph2cart(azimuth, elevation, r)
        let expected = (1.0, 1.0, 1.0)
        XCTAssertEqual(result, expected, accuracy: accuracy, "rad2deg failed")
    }
}
