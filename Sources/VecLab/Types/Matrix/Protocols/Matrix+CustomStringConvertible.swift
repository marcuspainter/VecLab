//
//  Matrix+CustomStringConvertible.swift
//  VecLab
//
//  Created by Marcus Painter on 08/09/2025.
//

extension Matrix: CustomStringConvertible {

    /// String of Matrix value.
    public var description: String {

        var text = ""
        for row in 0..<rows {
            for col in 0..<cols {
                text += matlabFormat(self[row, col])
            }
            if row < rows - 1 {
                text += "\n"
            }
        }
        return text
    }
}

private func matlabFormat(_ value: Double) -> String {
    let tolerance = 1e-10
    if abs(value.truncatingRemainder(dividingBy: 1)) < tolerance {
        return  String(format: " % 12.f", value)
     } else {
        return String(format: " % 12.8f", value)
     }

}
