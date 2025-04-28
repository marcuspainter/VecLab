//
//  VecLab.swift
//  VecLab
//
//  Created by Marcus Painter on 19/04/2025.
//

import os.log

public final class VecLab: @unchecked Sendable {

}

public enum ErrorLevel {
    case info
    case warning
    case error
}

func logInfo(
    _ condition: @autoclosure () -> Bool,
    _ message: @autoclosure () -> String = String(),
    file: StaticString = #file,
    line: UInt = #line
) {
    print("Info: \(message())")
}

func logWarning(
    _ condition: @autoclosure () -> Bool,
    _ message: @autoclosure () -> String = String(),
    file: StaticString = #file,
    line: UInt = #line
) {
    print("Warning: \(message())")
}

func logError(
    _ condition: @autoclosure () -> Bool,
    _ message: @autoclosure () -> String = String(),
    file: StaticString = #file,
    line: UInt = #line
) {
    print("Error: \(message())")
}
