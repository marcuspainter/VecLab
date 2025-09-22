//
//  SortTests.swift
//  VecLab
//
//  Created by Marcus Painter on 06/09/2025.
//

import VecLab
import XCTest
import Accelerate

class SortTests: XCTestCase {
    
    let accuracy: Real = 1e-6
    
    // MARK: hampel
    
    func testSort() throws {
        
        let a: RealArray = [1,3,7,4, 7,9,9,7,]
        print(a)
        let result1 = sort(a)
        //print(result1)
        
        let b: RealArray = [1,5,8,3, 9,4,6,8]
        let z = SplitComplexArray(a,b)
        let result2 = sort(z)
        print(abs(result2))
        
        var zz = SplitComplexArray()
        for k in vector(0...360, 30) {
            zz.append(Complex(cos(deg2rad(k)), sin(deg2rad(k))))
        }
        //disp(abs(zz))
        //disp(angle(zz))
        
        let s = matlabSort2(zz)
        disp(angle(s))
    }
}

fileprivate func matlabSort2(_ array: SplitComplexArray) -> SplitComplexArray {
    return array.sorted { a, b in
        let magA = Darwin.hypot(a.real, a.imag)
        let magB = Darwin.hypot(b.real, b.imag)
        if magA != magB {
            return magA < magB
        }
        // Tie-break by phase (atan2 returns (-π, π])
        let phaseA = wrapTo2Pi(angle(a))
        let phaseB = wrapTo2Pi(angle(b))
        return phaseA < phaseB
    }
}
