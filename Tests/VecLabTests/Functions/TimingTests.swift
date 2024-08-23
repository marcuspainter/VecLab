//
//  TimingTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import XCTest
import VecLab

class TimingTests: XCTestCase {

    func testTicToc() throws {

        tic()
        usleep(100)
        toc()
    }
    
    func testTimeti() throws {

        timeit {
            usleep(100)
        }
    }

}
