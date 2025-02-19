//
//  RandomTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import XCTest
import VecLab

class RandomTests: XCTestCase {
    
    func testRand() throws {
        let realA: Real = rand()
        XCTAssert(realA >= -1.0 && realA <= 1.0, "rand failed")
    }

    // TODO: Some test
    func testRandn() throws {
        let _ : Real = randn()
        XCTAssert(true)
    }

    func testRandCount() throws {
        let realArrayA: [Real] = rand(count: 10)
        XCTAssert(realArrayA.count == 10, "rand failed")
        //print(realArrayA)
    }

    func testRandnCount() throws {
        let realArrayA: [Real] = randn(count: 10)
        XCTAssert(realArrayA.count == 10, "randn failed")
        //print(realArrayA)
    }

    // TODO: Some test
    func testRng() throws {
        let _ : UInt32 = rng()
        XCTAssert(true)
    }

    func testRngSeed() throws {
        let seed: UInt32 = 1234
        rng(seed: seed)
        let result = rng()
        XCTAssertEqual(result, seed, "rng failed")
    }
 /*
    func testRngNoGeneratorFound() throws {
        let seed: UInt32 = 1
        rng(seed: seed, generator: "None")
        let result = rng()
        XCTAssertEqual(result, seed, "rng failed")
    }
 */
    
    func testRandnStatsTest() throws {
        let length = 100_000
        let realArrayA: [Real] = randn(count: length)
        let m = mean(realArrayA)
        let v = variance(realArrayA)
        print(m)    // 0.0
        print(v)    // 1.0
        
        let accuracy: Real = 1e-1
        XCTAssertEqual(m, 0.0, accuracy: accuracy, "randn failed")
        XCTAssertEqual(v, 1.0, accuracy: accuracy, "randn failed")
    }
    
    func testRandStatsTest() throws {
        let length = 100_000
        let realArrayA: [Real] = rand(count: length)
        let m = mean(realArrayA)
        let v = variance(realArrayA)
        print(m)    // 0.5
        print(v)    // 0.083333333333333 (1/12)
        
        let accuracy: Real = 1e-1
        XCTAssertEqual(m, 0.5, accuracy: accuracy, "rand failed")
        XCTAssertEqual(v, 1.0/12.0, accuracy: accuracy, "rand failed")
    }
    
}
