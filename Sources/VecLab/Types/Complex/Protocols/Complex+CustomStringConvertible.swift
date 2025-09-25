//
//  Complex+CustomStringConvertible.swift
//  VecLab
//
//  Created by Marcus Painter on 10/05/2025.
//

import Foundation

extension Complex: CustomStringConvertible {
    
    // 136.0000000000000
    // 0.080000000000000
    //   123456789012345

    /// String of complex value.
    public var description: String {
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        fmt.minimumSignificantDigits = 14 // optional depending on needs
        fmt.maximumSignificantDigits = 14
        
        let sr = self.real < 0 ? "-" : " "
        let si = self.imag < 0 ? "-" : "+"
        var r = fmt.string(for: abs(self.real))!
        var i = fmt.string(for: abs(self.imag))!
        r = String(r.prefix(15))
        i = String(i.prefix(15))

        return "\(sr)\(r) \(si) \(i)i"
    }
}
