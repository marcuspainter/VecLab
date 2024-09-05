//
//  fminsearch.swift
//  
//
//  Created by Marcus Painter on 18/09/2023.
//

import Foundation

/// Find minimum of unconstrained multivariable function using derivative-free method.
public func fminsearch(fun: @escaping (RealDoubleArray) -> RealDouble, x0: RealDoubleArray) -> (x: RealDoubleArray, y: RealDouble) {
    let n = x0.count
    let alpha: Double = 1
    let gamma: Double = 2
    let rho: Double = -0.5
    let sigma: Double = 0.5
    let maxIter: Int = 1000
    let tolerance: Double = 1e-6

    var vertices: [RealDoubleArray] = [x0]
    for i in 0..<n {
        var x = x0
        x[i] = x[i] + 1  // Simple initialization
        vertices.append(x)
    }

    var iteration = 0
    while iteration < maxIter {
        vertices.sort(by: { fun($0) < fun($1) })

        let xLow = vertices.first!
        let xHigh = vertices.last!

        var centroid = RealDoubleArray(repeating: 0.0, count: n)
        for i in 0..<n {
            for j in 0..<n {
                centroid[j] += vertices[i][j]
            }
        }

        for i in 0..<n {
            centroid[i] /= Double(n)
        }

        let xReflected = centroid + alpha * (centroid - xHigh)
        if fun(xReflected) < fun(xLow) {
            let xExpanded = centroid + gamma * (xReflected - centroid)
            if fun(xExpanded) < fun(xLow) {
                vertices[n] = xExpanded
            } else {
                vertices[n] = xReflected
            }
        } else {
            var shouldContract = false
            for i in 0..<n {
                if fun(xReflected) < fun(vertices[i]) {
                    vertices[n] = xReflected
                    shouldContract = true
                    break
                }
            }

            if !shouldContract {
                if fun(xReflected) < fun(xHigh) {
                    let xContracted = centroid + rho * (xReflected - centroid)
                    if fun(xContracted) < fun(xHigh) {
                        vertices[n] = xContracted
                    }
                } else {
                    let xContracted = centroid + sigma * (xHigh - centroid)
                    if fun(xContracted) < fun(xHigh) {
                        vertices[n] = xContracted
                    }
                }
            }
        }

        if norm(vertices.last! - vertices.first!) < tolerance {
            break
        }

        iteration += 1
    }

    // Get the function value at the result
    let val = fun(vertices.first!)

    // Return both the result and its function value
    return (vertices.first!, val)
}


// MARK: Float


/// Find minimum of unconstrained multivariable function using derivative-free method.
public func fminsearch(fun: @escaping (RealFloatArray) -> RealFloat, x0: RealFloatArray) -> (x: RealFloatArray, y: RealFloat) {
    let n = x0.count
    let alpha: Float = 1
    let gamma: Float = 2
    let rho: Float = -0.5
    let sigma: Float = 0.5
    let maxIter: Int = 1000
    let tolerance: Float = 1e-6

    var vertices: [RealFloatArray] = [x0]
    for i in 0..<n {
        var x = x0
        x[i] = x[i] + 1  // Simple initialization
        vertices.append(x)
    }

    var iteration = 0
    while iteration < maxIter {
        vertices.sort(by: { fun($0) < fun($1) })

        let xLow = vertices.first!
        let xHigh = vertices.last!

        var centroid = RealArray(repeating: 0.0, count: n)
        for i in 0..<n {
            for j in 0..<n {
                centroid[j] += vertices[i][j]
            }
        }

        for i in 0..<n {
            centroid[i] /= Real(n)
        }

        let xReflected = centroid + alpha * (centroid - xHigh)
        if fun(xReflected) < fun(xLow) {
            let xExpanded = centroid + gamma * (xReflected - centroid)
            if fun(xExpanded) < fun(xLow) {
                vertices[n] = xExpanded
            } else {
                vertices[n] = xReflected
            }
        } else {
            var shouldContract = false
            for i in 0..<n {
                if fun(xReflected) < fun(vertices[i]) {
                    vertices[n] = xReflected
                    shouldContract = true
                    break
                }
            }

            if !shouldContract {
                if fun(xReflected) < fun(xHigh) {
                    let xContracted = centroid + rho * (xReflected - centroid)
                    if fun(xContracted) < fun(xHigh) {
                        vertices[n] = xContracted
                    }
                } else {
                    let xContracted = centroid + sigma * (xHigh - centroid)
                    if fun(xContracted) < fun(xHigh) {
                        vertices[n] = xContracted
                    }
                }
            }
        }

        if norm(vertices.last! - vertices.first!) < tolerance {
            break
        }

        iteration += 1
    }

    // Get the function value at the result
    let val = fun(vertices.first!)

    // Return both the result and its function value
    return (vertices.first!, val)
}

