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
public typealias Real = Float

/// Type alias for an array of real numbers
public typealias RealArray = [Real]

/// Type alias for a complex number as a tuple of two real numbers
public typealias Complex = (Real, Real)

/// Type alias for a complex array as a tuple of two real arrays
public typealias ComplexArray = (RealArray, RealArray)
