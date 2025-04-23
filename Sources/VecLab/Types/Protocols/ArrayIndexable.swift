//
//  ArrayIndexable.swift
//  VecLab
//
//  Created by Marcus Painter on 21/04/2025.
//

import Foundation

// Now extend Array to conform to ArrayIndexable
extension Array: ArrayIndexable where Element: BasicArithmetic {
}

public protocol ArrayIndexable {
    associatedtype Element
    
    // Required: Regular subscript that the default implementation will use
    subscript(index: Int) -> Element { get set }
    
    // Required: Need to know the count for bounds checking
    var count: Int { get }
    
    // The array-based subscript will be provided by the extension
}

