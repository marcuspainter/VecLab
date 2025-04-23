//
//  ComplexDouble+Formatted.swift
//  VecLab
//
//  Created by Marcus Painter on 23/04/2025.
//

import Foundation

extension ComplexDouble {
    /// Returns a formatted string representation of the complex number
    /// - Parameters:
    ///   - precision: Number of decimal places (default: 2)
    ///   - style: Display style (default: .standard)
    ///   - locale: The locale to use for formatting (default: current)
    /// - Returns: Formatted string representation
    public func formatted(
        precision: Int = 2,
        style: ComplexStyle = .standard,
        locale: Locale = .current
    ) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = precision
        formatter.locale = locale
        
        let realStr = formatter.string(from: NSNumber(value: real)) ?? "\(real)"
        let imagStr = formatter.string(from: NSNumber(value: abs(imag))) ?? "\(abs(imag))"
        
        switch style {
        case .standard:
            if imag == 0 {
                return realStr
            } else if real == 0 {
                return imag > 0 ? "\(imagStr)i" : "-\(imagStr)i"
            } else if imag > 0 {
                return "\(realStr) + \(imagStr)i"
            } else {
                return "\(realStr) - \(imagStr)i"
            }
        case .engineering:
            return "[\(realStr), \(imag >= 0 ? imagStr : "-\(imagStr)")]"
        }
    }
    
    /// Display styles for complex numbers
    public enum ComplexStyle {
        case standard    // a + bi format
        case engineering // [a, b] format
    }
}
