//
//  Real+Complex.swift
//  
//
//  Created by Marcus Painter on 28/09/2023.
//

import Foundation

// MARK: i

public extension Double {
    /// The complex imaginary unit i, where i = sqrt(-1).
    static var i: ComplexDouble { (Double(0), Double(1)) }
}

public extension Float {
    /// The complex imaginary unit i, where i = sqrt(-1).
    static var i: ComplexFloat{ (Float(0), Float(1)) }
}

public extension Double {
    /// The complex imaginary unit i, where i = sqrt(-1).
    var i: ComplexDouble { (Double(0), self) }
}

public extension Float {
    /// The complex imaginary unit i, where i = sqrt(-1).
    var i: ComplexFloat { (Float(0), self) }
}

public extension Int {
    /// The complex imaginary unit i, where i = sqrt(-1).
    var i: ComplexDouble { (Double(0), Double(self)) }
}

