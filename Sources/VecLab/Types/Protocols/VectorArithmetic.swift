//
//  ArrayMath.swift
//  VecLab
//
//  Created by Marcus Painter on 22/04/2025.
//

// Make Array conform to VectorMath for all BasicMath elements
//extension Array: VectorMath where Element: BasicMath {}

//public protocol VectorMath: RangeReplaceableCollection where Element: BasicMath {
//    subscript(index: Int) -> Element { get set }
//    var count: Int { get }
//}

// We need a protocol specifically for array math operations
public protocol VectorArithmetic {
    associatedtype Element: BasicArithmetic
    
    static func + (a: Self, b: Self) -> Self
    static func - (a: Self, b: Self) -> Self
    static func * (a: Self, b: Self) -> Self
    static func / (a: Self, b: Self) -> Self
    static prefix func - (a: Self) -> Self
    
    
    static func + (a: Self, b: Element) -> Self
    static func + (a: Element, b: Self) -> Self
    static func - (a: Self, b: Element) -> Self
    static func - (a: Element, b: Self) -> Self
    static func * (a: Self, b: Element) -> Self
    static func * (a: Element, b: Self) -> Self
    static func / (a: Self, b: Element) -> Self
    static func / (a: Element, b: Self) -> Self
}

public protocol VectorScalarArithmetic {
    associatedtype Element: BasicArithmetic
    
    static func + (a: Self, b: Element) -> Self
    static func + (a: Element, b: Self) -> Self
}
