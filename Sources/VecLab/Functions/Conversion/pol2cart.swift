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

/// Converts 3D polar coordinates to Cartesian.
/// - Parameters:
///   - theta: The azimuthal angle, in radians.
///   - phi: The polar or zenith angle, in radians.
///   - rho: The distance from the origin.
/// - Returns: A tuple containing the x, y, and z Cartesian coordinates.
public func pol2cart(_ theta: Real, _ phi: Real, _ rho: Real) -> (x: Real, y: Real, z: Real) {
    let x = rho * sin(phi) * cos(theta)
    let y = rho * sin(phi) * sin(theta)
    let z = rho * cos(phi)
    return (x, y, z)
}
