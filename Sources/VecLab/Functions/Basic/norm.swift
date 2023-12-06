//
//  norm.swift
//
//
//  Created by Marcus Painter on 18/09/2023.
//

import Accelerate
import Foundation

/// Euclidean norm of array.
///
/// This norm is also called the 2-norm, vector magnitude, or Euclidean length.
/// - Parameter x: Input array.
/// - Returns: The 2-norm or magnitude of the array.
public func norm(_ x: RealArray) -> Real {
    let sum = vDSP.sumOfSquares(x)
    return Darwin.sqrt(sum)
}

/*
 norm(v,1) = sum(abs(v))
 norm(v,2) = sum(abs(v).^2)^(1/2)
 norm(v,p) = sum(abs(v).^p)^(1/p)
 norm(v,inf) = max(abs(v))
 norm(v,-inf) = min(abs(v))
 */
