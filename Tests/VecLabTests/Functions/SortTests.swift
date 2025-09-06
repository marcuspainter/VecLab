//
//  SortTests.swift
//  VecLab
//
//  Created by Marcus Painter on 06/09/2025.
//

import VecLab
import XCTest

class SortTests: XCTestCase {
    
    let accuracy: Real = 1e-6
    
    // MARK: hampel
    
    func testSort() throws {
        
        let a: RealArray = [1,3,7,4, 7,9,9,7,]
        print(a)
        let result1 = sort(a)
        //print(result1)
        
        let b: RealArray = [1,5,8,3, 9,4,6,8]
        let z = ComplexArray(a,b)
        let result2 = sort(z)
        print(abs(result2))
        
        var zz = ComplexArray()
        for k in vector(0...360, 30) {
            zz.append(Complex(cos(deg2rad(k)), sin(deg2rad(k))))
        }
        //disp(abs(zz))
        //disp(angle(zz))
        
        let s = matlabSort2(zz)
        disp(angle(s))
    }
}

fileprivate func matlabSort2(_ arr: ComplexArray) -> ComplexArray {
    return arr.sorted { a, b in
        let magA = sqrt(a.real * a.real + a.imag * a.imag)
        let magB = sqrt(b.real * b.real + b.imag * b.imag)
        //if magA != magB {
        //    return magA < magB
       // }
        // Tie-break by phase (atan2 returns (-π, π])
        let phaseA = wrapTo2Pi(angle(a))
        let phaseB = wrapTo2Pi(angle(b))
        return phaseA < phaseB
    }
}
