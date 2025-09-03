//
//  pol2cart.swift
//
//
//  Created by Marcus Painter on 16/09/2023.
//

import Foundation

/// Converts polar or cylindrical coordinates to Cartesian
/// - Parameters:
///   - theta: The angle, in radians.
///   - rho: The radial distance from the origin.
/// - Returns: A tuple containing the x and y Cartesian coordinates.
public func pol2cart(_ theta: Real, _ rho: Real) -> (x: Real, y: Real) {
    let x = rho * cos(theta)
    let y = rho * sin(theta)
    return (x, y)
}

/// Converts polar or cylindrical coordinates to Cartesian
/// - Parameters:
///   - theta: The angle, in radians.
///   - rho: The radial distance from the origin.
/// - Returns: A tuple containing the an array x and y Cartesian coordinates.
public func pol2cart(_ theta: RealArray, _ rho: RealArray) -> (x: RealArray, y: RealArray) {
    validateSize(theta, rho)
    let n = theta.count
    var x = [Real](repeating: Real(0), count: n)
    var y = x  // Zeros

    for k in 0..<n {
        let xy = pol2cart(theta[k], rho[k])
        x[k] = xy.0
        y[k] = xy.1
    }
    return (x, y)
}

/// Converts 3D polar coordinates to Cartesian.
/// - Parameters:
///   - theta: The azimuthal angle, in radians.
///   - rho: The distance from the origin.
///   - z: Elevation coordinate.
/// - Returns: A tuple containing the x, y, and z Cartesian coordinates.
public func pol2cart(_ theta: Real, _ rho: Real, _ z: Real) -> (x: Real, y: Real, z: Real) {
    let x = rho * cos(theta)
    let y = rho * sin(theta)
    return (x, y, z)
}

/// Converts 3D polar coordinates to Cartesian.
/// - Parameters:
///   - theta: The azimuthal angle, in radians.
///   - rho: The distance from the origin.
///   - z: Elevation coordinate.
/// - Returns: A tuple containing arrays of  x, y, and z Cartesian coordinates.
public func pol2cart(_ theta: RealArray, _ rho: RealArray, _ z: RealArray)
    -> (x: RealArray, y: RealArray, z: RealArray)
{
    let n = theta.count
    assert(
        rho.count == n && z.count == n,
        "Arrays must be the same size, theta: \(theta.count), rho: \(rho.count), z: \(z.count) "
    )
    var x = [Real](repeating: Real(0), count: n)
    var y = x  // Zeros
    var zz = x  // Zeros

    for k in 0..<n {
        let coord = pol2cart(theta[k], rho[k], z[k])
        x[k] = coord.0
        y[k] = coord.1
        zz[k] = coord.2
    }
    return (x, y, zz)
}
