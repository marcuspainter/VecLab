//
//  File.swift
//  
//
//  Created by Marcus Painter on 22/06/2024.
//

import Foundation
import Accelerate


public extension Array where Element == Real {

    subscript(range: Range<Int>) -> Array {
        return []
    }
   
    subscript(range: [Real]) -> Array {
        return []
    }
}

func q() {
    let a = vector(count: 10)
    let n = vector(0..<10)
    let b = a[n]
    print(b)
}
