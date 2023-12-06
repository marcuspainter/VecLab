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

/// Converts 3D Cartesian coordinates to spherical coordinates.
/// - Parameters:
///   - x: The x-coordinate.
///   - y: The y-coordinate.
///   - z: The z-coordinate.
/// - Returns: A tuple containing the azimuthal angle theta, the polar or zenith angle phi (both in radians), and the distance rho from the origin.
public func cart2pol(_ x: Real, _ y: Real, _ z: Real) -> (theta: Real, phi: Real, rho: Real) {
    let rho = sqrt(x * x + y * y + z * z)
    let theta = atan2(y, x)
    let phi = acos(z/rho)
    return (theta, phi, rho)
}
