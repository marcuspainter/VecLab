//
//  new.swift
//
//
//  Created by Marcus Painter on 30/08/2024.
//

import Accelerate
import Foundation

/*
public func circshift2(_ x: [Double], _ k: Int) -> [Double] {
    let n = x.count
    // Handle negative and > n shifts
    let shift = ((k % n) + n) % n
    if shift == 0 {
        return x
    }
    
    return Array(unsafeUninitializedCapacity: n) { buffer, initializedCount in
        // Part 1: Copy the last `shift` element s to the beginning of the result buffer
        x.withUnsafeBufferPointer { xBuffer in
            let X = UnsafeMutablePointer(mutating: xBuffer.baseAddress!)
            cblas_dcopy(__LAPACK_int(shift), X + n - shift, 1, buffer.baseAddress!, 1)
            
            // Part 2: Copy the first `n - shift` elements to the end of the result buffer
            cblas_dcopy(__LAPACK_int(Int32(n - shift)), X, 1, buffer.baseAddress! + shift, 1)
        }
        // Mark all elements as initialized
        initializedCount = n
    }
}

public func cat2(_ arrays: [Double]...) -> [Double] {
    // Calculate the total count of elements
    let totalCount = arrays.reduce(0) { $0 + length($1) }
    
    // Initialize the new array with the required capacity
    return Array<Double>(unsafeUninitializedCapacity: totalCount) { buffer, initializedCount in
        var offset = 0
        
        for array in arrays {
            // Copy the contents of each array into the buffer
            array.withUnsafeBufferPointer { srcPointer in
                cblas_dcopy(__LAPACK_int(array.count), srcPointer.baseAddress, 1, buffer.baseAddress! + offset, 1)
            }
            offset += array.count
        }
        
        // Set the initializedCount to totalCount to indicate how many elements have been initialized
        initializedCount = totalCount
    }
}
*/
