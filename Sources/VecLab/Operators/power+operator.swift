//
//  File.swift
//  
//
//  Created by Marcus Painter on 04/09/2024.
//

import Foundation


precedencegroup PowerPrecedence {
    higherThan: MultiplicationPrecedence
    associativity: left // Matlab 2**3**4 = 4096
}

infix operator **: PowerPrecedence
