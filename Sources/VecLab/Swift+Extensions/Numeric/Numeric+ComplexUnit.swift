//
//  Real+Complex.swift
//  
//
//  Created by Marcus Painter on 28/09/2023.
//

import Foundation

// MARK: i

public extension Real {
    /// The complex imaginary unit i, where i = sqrt(-1).
    static var i: Complex { Complex(0, 1) }
}

public extension Float {
    /// The complex imaginary unit i, where i = sqrt(-1).
    var i: Complex { Complex(Real(0), Real(self)) }
}

public extension Double {
    /// The complex imaginary unit i, where i = sqrt(-1).
    var i: Complex { Complex(Real(0), Real(self)) }
}

public extension Int {
    /// The complex imaginary unit i, where i = sqrt(-1).
    var i: Complex { Complex(Real(0), Real(self)) }
}

// MARK: j

public extension Real {
    /// The complex imaginary unit j, where j = sqrt(-1).
    static var j: Complex { Complex(Real(0), Real(1)) }
}

public extension Float {
    /// The complex imaginary unit j, where j = sqrt(-1).
    var j: Complex { Complex(Real(0), Real(self)) }
}

public extension Double {
    /// The complex imaginary unit j, where j = sqrt(-1).
    var j: Complex { Complex(Real(0), Real(self)) }
}

public extension Int {
    /// The complex imaginary unit j, where j = sqrt(-1).
    var j: Complex { Complex(Real(0), Real(self)) }
}
