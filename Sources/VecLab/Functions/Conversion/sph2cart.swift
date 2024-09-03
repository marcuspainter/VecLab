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

/// Converts 3D spherical coordinates to Cartesian coordinates.
/// - Parameters:
///   - azimuth: The azimuthal angle, in radians.
///   - elevation: The elevation angle, in radians.
///   - r: The radial distance from the origin.
/// - Returns: A tuple containing arrays of  x, y, and z Cartesian coordinates.
public func sph2cart(_ azimuth: RealArray, _ elevation: RealArray, _ r: RealArray)
        -> (x: RealArray, y: RealArray, z: RealArray) {
    let n = azimuth.count
    assert(elevation.count == n && r.count == n,
           "Arrays must be the same size, azimuth: \(azimuth.count), elevation: \(elevation.count), r: \(r.count) ")
    var x = [Real](repeating: Real(0), count: n)
    var y = x  // Zeros
    var z = x  // Zeros

    for k in 0 ..< n {
        let coord = sph2cart(azimuth[k], elevation[k], r[k])
        x[k] = coord.0
        y[k] = coord.1
        z[k] = coord.2
    }
    return (x, y, z)
}
