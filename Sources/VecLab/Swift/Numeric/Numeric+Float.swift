//
//  Numeric+Float.swift
//
//
//  Created by Marcus Painter on 28/09/2023.
//

import Foundation

extension Double {
    /// Converts `Double` to `Float`.
    public var f: Float { Float(self) }
}

extension Float {
    /// Convert a `Float` to `Float`
    public var f: Float { self }
}

extension Int {
    /// Converts an `Int`  to `Float`.
    public var f: Float { Float(self) }
}
