//
//  RealTypealias.swift
//
//
//  Created by Marcus Painter on 04/09/2023.
//

import Foundation

/// Type alias for floating point numbers.
///
/// The library can set to use `Double` or  `Float` using this type alias.
///
/// Example:
///
/// ```
/// public typealias Real = Double
/// ```
/// ```
/// public typealias Real = Float
/// ```

/// Type alias for `Double` or `Float`
public typealias Real = Double

/// Type alias for an array of real numbers
public typealias RealArray = [Real]

/// Type alias for a complex number
public typealias Complex = ComplexDouble

/// Type alias for a complex array
public typealias ComplexArray = ComplexDoubleArray
