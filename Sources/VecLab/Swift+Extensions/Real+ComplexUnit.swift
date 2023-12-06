//
//  Real+Complex.swift
//  
//
//  Created by Marcus Painter on 28/09/2023.
//

import Foundation

public extension Real {
    /// The complex imaginary unit i, where i = sqrt(-1).
    static var i: Complex { (Real(0), Real(1)) }
}
