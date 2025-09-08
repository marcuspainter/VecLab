//
//  ComplexArray+Hashable.swift
//  VecLab
//
//  Created by Marcus Painter on 11/05/2025.
//

extension ComplexArray: Hashable {

    // MARK: - Hashable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(real)
        hasher.combine(imag)
    }
}
