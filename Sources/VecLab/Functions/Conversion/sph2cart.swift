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
public func sph2cart(_ azimuth: RealDouble, _ elevation: RealDouble, _ r: RealDouble) -> (x: RealDouble, y: RealDouble, z: RealDouble) {
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
public func sph2cart(_ azimuth: RealDoubleArray, _ elevation: RealDoubleArray, _ r: RealDoubleArray)
        -> (x: RealDoubleArray, y: RealDoubleArray, z: RealDoubleArray) {
    let n = azimuth.count
    assert(elevation.count == n && r.count == n,
           "Arrays must be the same size, azimuth: \(azimuth.count), elevation: \(elevation.count), r: \(r.count) ")
            var x = [Double](repeating: 0.0, count: n)
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
