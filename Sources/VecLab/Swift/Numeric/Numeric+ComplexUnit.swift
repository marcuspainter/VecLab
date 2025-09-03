//
//  Numeric+ComplexUnit.swift
//
//
//  Created by Marcus Painter on 28/09/2023.
//

import Foundation

// MARK: i

extension Real {
    /// The complex imaginary unit i, where i = sqrt(-1).
    public static var i: Complex { Complex(0, 1) }
}

extension Float {
    /// The complex imaginary unit i, where i = sqrt(-1).
    public var i: Complex { Complex(Real(0), Real(self)) }
}

extension Double {
    /// The complex imaginary unit i, where i = sqrt(-1).
    public var i: Complex { Complex(Real(0), Real(self)) }
}

extension Int {
    /// The complex imaginary unit i, where i = sqrt(-1).
    public var i: Complex { Complex(Real(0), Real(self)) }
}

// MARK: j

extension Real {
    /// The complex imaginary unit j, where j = sqrt(-1).
    public static var j: Complex { Complex(Real(0), Real(1)) }
}

extension Float {
    /// The complex imaginary unit j, where j = sqrt(-1).
    public var j: Complex { Complex(Real(0), Real(self)) }
}

extension Double {
    /// The complex imaginary unit j, where j = sqrt(-1).
    public var j: Complex { Complex(Real(0), Real(self)) }
}

extension Int {
    /// The complex imaginary unit j, where j = sqrt(-1).
    public var j: Complex { Complex(Real(0), Real(self)) }
}
