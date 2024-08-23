//
//  cart2pol.swift
//  
//
//  Created by Marcus Painter on 17/09/2023.
//

import Foundation

/// Converts Cartesian coordinates to polar or cylindrical.
/// - Parameters:
///   - x: The x-coordinate.
///   - y: The y-coordinate.
/// - Returns: A tuple containing the angle theta in radians and the radial distance rho from the origin.
public func cart2pol(_ x: Real, _ y: Real) -> (theta: Real, rho: Real) {
    let theta = atan2(y, x)
    let rho = sqrt(x * x + y * y)
    return (theta, rho)
}

/// Converts Cartesian coordinates to polar or cylindrical.
/// - Parameters:
///   - x: The x-coordinate.
///   - y: The y-coordinate.
/// - Returns: A tuple containing the arrays angle theta in radians and the radial distance rho from the origin.
public func cart2pol(_ x: RealArray, _ y: RealArray, _ z: RealArray) -> (theta: RealArray, rho: RealArray) {
    let n = x.count
    assert(y.count == n && z.count == n,
           "Arrays must be the same size, x: \(x.count), y: \(y.count), z: \(z.count) ")
    var theta = [Real](repeating: Real(0), count: n)
    var rho = theta // Zeros

    for k in 0 ..< n {
        let coord = cart2pol(x[k], y[k], z[k])
        theta[k] = coord.0
        rho[k] = coord.1
    }
    return (theta, rho)
}

/// Converts Cartesian coordinates to polar cylindrical.
/// - Parameters:
///   - x: The x-coordinate.
///   - y: The y-coordinate.
///   - z: The z-coordinate.
/// - Returns: A tuple containing the angle theta in radians and the radial distance rho from the origin and the radial height.
public func cart2pol(_ x: Real, _ y: Real, _ z: Real) -> (theta: Real, rho: Real, z: Real) {
    let theta = atan2(y, x)
    let rho = sqrt(x * x + y * y)
    return (theta, rho, z)
}

/// Converts Cartesian coordinates to polar cylindrical.
/// - Parameters:
///   - x: The x-coordinate.
///   - y: The y-coordinate.
///   - z: The z-coordinate.
/// - Returns: A tuple containing an array of the angle theta in radians and the radial distance rho from the origin and the radial height.
public func cart2pol(_ x: RealArray, _ y: RealArray, _ z: RealArray) -> (theta: RealArray, rho: RealArray, z: RealArray) {
    let n = x.count
    assert(y.count == n && z.count == n,
           "Arrays must be the same size, x: \(x.count), y: \(y.count), z: \(z.count) ")
    var theta = [Real](repeating: Real(0), count: n)
    var rho = theta // Zeros
    var zz = theta  // Zeros

    for k in 0 ..< n {
        let coord = cart2pol(x[k], y[k], z[k])
        theta[k] = coord.0
        rho[k] = coord.1
        zz[k] = coord.2
    }
    return (theta, rho, zz)
}
