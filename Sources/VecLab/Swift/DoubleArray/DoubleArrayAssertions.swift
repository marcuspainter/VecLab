//
//  VectorAssertions.swift
//
//  Created by Marcus Painter on 06/09/2023.
//

import Foundation

@inlinable
public func validateSize( _ a: RealArray, _ b: RealArray,
    file: StaticString = #file,
    line: UInt = #line
) {
    assert(a.count == b.count,
        "Incompatible sizes \(a.count) \(b.count)",
        file: file,
        line: line
    )
}
