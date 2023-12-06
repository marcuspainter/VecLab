//
//  sph2cart.swift
//  
//
//  Created by Marcus Painter on 17/09/2023.
//

import Foundation

/// Converts 3D spherical coordinates to Cartesian coordinates.
/// - Parameters:
///   - azimuth: The azimuthal angle, in radians.
///   - elevation: The elevation angle, in radians.
///   - r: The radial distance from the origin.
/// - Returns: A tuple containing the x, y, and z Cartesian coordinates.
public func sph2cart(_ azimuth: Real, _ elevation: Real, _ r: Real) -> (x: Real, y: Real, z: Real) {
    let x = r * cos(elevation) * cos(azimuth)
    let y = r * cos(elevation) * sin(azimuth)
    let z = r * sin(elevation)
    return (x, y, z)
}
