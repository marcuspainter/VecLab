//
//  Numeric+Float.swift
//
//
//  Created by Marcus Painter on 28/09/2023.
//

import Foundation

public extension Double {
    /// Converts `Double` to `Float`.
    var f: Float { Float(self) }
}

public extension Float {
    /// Convert a `Float` to `Float`
    var f: Float { self }
}

public extension Int {
    /// Converts an `Int`  to `Float`.
    var f: Float { Float(self) }
}
