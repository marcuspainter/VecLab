//
//  PerformanceTests.swift
//
//
//  Created by Marcus Painter on 25/08/2024.
//

import VecLab
import XCTest

final class PerformanceTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
/*
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testFFT() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
            let x = randn(count: Int(2 ** 14))
            let _ = fftr(x)
        }
    }

    func testFFTX() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
            let x = randn(count: Int(2 ** 14))
            let _ = fftx(x)
        }
    }

    func testMultiplyReal() throws {
        // This is an example of a performance test case.

        let a = randn(count: Int(2 ** 14))
        let b = randn(count: Int(2 ** 14))
        measure {
            // Put the code you want to measure the time of here.

            _ = a * b
        }
    }

    func testMultiplyRealMap() throws {
        // This is an example of a performance test case.

        let a = randn(count: Int(2 ** 14))
        let b = randn(count: Int(2 ** 14))
        measure {
            // Put the code you want to measure the time of here.

            _ = zip(a,b).map { $0 * $1 }
        }
    }
    
    func testMultiplyRealLoop() throws {
        // This is an example of a performance test case.

        let a = randn(count: Int(2 ** 14))
        let b = randn(count: Int(2 ** 14))
        var c = a
        measure {
            // Put the code you want to measure the time of here.
            
            for i in 0..<a.count {
                c[i] = a[i] * b [i]
            }
        }
    }
 */
    func testCat1() throws {
        let N = 100000
        let a = [Double](repeating: 1.0, count: N)
        measure {
            let result = cat(a, a, a)
        }
    }
    
    func testCat2() throws {
        let N = 100000
        let a = [Double](repeating: 1.0, count: N)
        measure {
            let result = cat2(a, a, a)
        }
    }
}


