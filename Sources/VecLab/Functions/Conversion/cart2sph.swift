//
//  cart2sph.swift
//  
//
//  Created by Marcus Painter on 17/09/2023.
//

import Foundation

/// Converts 3D Cartesian coordinates to spherical coordinates.
/// - Parameters:
///   - x: The x-coordinate.
///   - y: The y-coordinate.
///   - z: The z-coordinate.
/// - Returns: A tuple containing the azimuthal angle (measured in the xy-plane from the positive x-axis),
/// the elevation angle (measured from the xy-plane), and the radial distance from the origin.
public func cart2sph(_ x: Real, _ y: Real, _ z: Real) -> (azimuth: Real, elevation: Real, r: Real) {
    let r = sqrt(x * x + y * y + z * z)
    let azimuth = atan2(y, x)
    let elevation = atan2(z, sqrt(x * x + y * y))
    return (azimuth, elevation, r)
}
