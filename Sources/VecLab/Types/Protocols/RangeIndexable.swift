//
//  RangeIndexable.swift
//  VecLab
//
//  Created by Marcus Painter on 20/04/2025.
//

extension Array: RangeIndexable where Element: BasicArithmetic {}

public protocol RangeIndexable {
    associatedtype Element
    
    // Required: Regular subscript that the default implementation will use
    subscript(index: Int) -> Element { get set }
    
    // Required: Need to know the count for bounds checking
    var count: Int { get }
    
    mutating func replaceSubrange<C>(_ subrange: Range<Int>, with newElements: C)
        where C : Collection, Self.Element == C.Element
    
    // The array-based subscript will be provided by the extension
}

