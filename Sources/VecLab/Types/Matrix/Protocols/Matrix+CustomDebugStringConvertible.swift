//
//  Matrix+CustomDebugStringConvertible.swift
//  VecLab
//
//  Created by Marcus Painter on 15/09/2025.
//

extension Matrix: CustomDebugStringConvertible {
    public var debugDescription: String {
        var text = "\(type(of: self)): \(self.rows)x\(self.cols)\n"
        text += self.description + "\n"
        return text
    }

}
