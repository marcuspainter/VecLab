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
    let azimuth = atan2(y, x)
    let elevation = atan2(z, sqrt(x * x + y * y))
    let r = sqrt(x * x + y * y + z * z)

    // let azimuth = atan2(y,x)
    // let elevation = atan2(z,sqrt(x.^2 + y.^2))
    // let r = sqrt(x.^2 + y.^2 + z.^2)

    return (azimuth, elevation, r)
}

/// Converts 3D Cartesian coordinates to spherical coordinates.
/// - Parameters:
///   - x: The x-coordinate.
///   - y: The y-coordinate.
///   - z: The z-coordinate.
/// - Returns: A tuple containing the arrays of azimuthal angle (measured in the xy-plane from the positive x-axis),
/// the elevation angle (measured from the xy-plane), and the radial distance from the origin.
public func cart2sph(_ x: RealArray, _ y: RealArray, _ z: RealArray)
    -> (azimuth: RealArray, elevation: RealArray, r: RealArray)
{
    let n = x.count
    assert(
        y.count == n && z.count == n,
        "Arrays must be the same size, x: \(x.count), y: \(y.count), z: \(z.count) "
    )
    var azimuth = [Real](repeating: Real(0), count: n)
    var elevation = azimuth  // Zeros
    var r = azimuth  // Zeros

    for k in 0..<n {
        let coord = cart2sph(azimuth[k], elevation[k], r[k])
        azimuth[k] = coord.0
        elevation[k] = coord.1
        r[k] = coord.2
    }
    return (azimuth, elevation, r)
}
