//
//  timeit.swift
//  
//
//  Created by Marcus Painter on 14/09/2023.
//

import Foundation

/// Measure the time required to run a closure.
/// - Parameter closure: Closure to time.
public func timeit(_ closure: () -> Void) {
    tic()
    closure()
    toc()
}
