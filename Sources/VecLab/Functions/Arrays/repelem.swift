//
//  repelem.swift
//
//
//  Created by Marcus Painter on 18/09/2023.
//

import Foundation

/// Repeat a real number.
/// - Parameters:
///   - x: A real number.
///   - n: Number of repetitions.
/// - Returns: Repeated array.
public func repelem(_ x: Real, _ n: Int) -> RealArray {
    let xarray = [x]
    guard n > 1 else {
        return xarray
    }

    var y = xarray
    for _ in 2 ... n {
        y.append(contentsOf: xarray)
    }
    return y
}

/// Repeat a real array.
/// - Parameters:
///   - x: A real array.
///   - n: Number of repetitions.
/// - Returns: Repeated array.
public func repelem(_ x: RealArray, _ n: Int) -> RealArray {
    guard n > 1 else {
        return x
    }
    var y = x
    for _ in 2 ... n {
        y.append(contentsOf: x)
    }
    return y
}

/// Repeat a complex number.
/// - Parameters:
///   - x:A complex number.
///   - n:Number of repetitions.
/// - Returns: Repeated array.
public func repelem(_ x: Complex, _ n: Int) -> ComplexArray {
    let xarray = ComplexArray([x.real], [x.imag])
    guard n > 1 else {
        return xarray
    }

    var y = xarray
    for _ in 2 ... n {
        y.real.append(contentsOf: xarray.real)
        y.imag.append(contentsOf: xarray.imag)
    }
    return y
}

/// Repeat a complex array.
/// - Parameters:
///   - x: A complex array.
///   - n:Number of repetitions.
/// - Returns: Repeated array.
public func repelem(_ x: ComplexArray, _ n: Int) -> ComplexArray {
    assertSameSize(x)
    guard n > 1 else {
        return x
    }
    var y = x
    for _ in 2 ... n {
        y.real.append(contentsOf: x.real)
        y.imag.append(contentsOf: x.imag)
    }
    return y
}
