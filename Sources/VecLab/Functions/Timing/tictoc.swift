//
//  tictoc.swift
//  
//
//  Created by Marcus Painter on 11/09/2023.
//

import Foundation
import Darwin

/// Stopwatch.
private struct MachTimer {
    nonisolated(unsafe) private static var _startTime: UInt64 = 0
    nonisolated(unsafe) private static var _timebaseInfo: mach_timebase_info_data_t = {
        var info = mach_timebase_info_data_t()
        _ = withUnsafeMutablePointer(to: &info) { mach_timebase_info($0) }
        return info
    }()
    
    private static let lock = NSLock()

    static var startTime: UInt64 {
        get {
            lock.lock()
            defer { lock.unlock() }
            return _startTime
        }
        set {
            lock.lock()
            _startTime = newValue
            lock.unlock()
        }
    }

    static var timebaseInfo: mach_timebase_info_data_t {
        lock.lock()
        defer { lock.unlock() }
        return _timebaseInfo
    }
}

/// Start stopwatch timer.
///
/// ``tic()`` works with the ``toc()`` function to measure elapsed time.
public func tic() {
    MachTimer.startTime = mach_absolute_time()
}

/// Read elapsed time from stopwatch timer.
///
/// ``toc()`` reads the elapsed time since the stopwatch timer started by the ``tic()`` function.
public func toc() {
    let endTime = mach_absolute_time()
    let elapsed = endTime - MachTimer.startTime
    let nanoseconds = elapsed * UInt64(MachTimer.timebaseInfo.numer) / UInt64(MachTimer.timebaseInfo.denom)
    let seconds = Double(nanoseconds) / 1_000_000_000.0  // Convert to seconds
    print("Elapsed time: \(seconds) seconds")
}

/*
// Example usage:
tic()
// ... some code that takes time ...
let elapsedTime = toc()
print("Elapsed time: \(elapsedTime) seconds")
*/
