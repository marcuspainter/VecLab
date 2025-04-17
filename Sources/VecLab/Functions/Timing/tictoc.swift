//
//  tictoc.swift
//
//
//  Created by Marcus Painter on 11/09/2023.
//

import Foundation

/// Start stopwatch timer.
///
/// ``tic()`` works with the ``toc()`` function to measure elapsed time.
public func tic() {
    Task {
        await SwiftTimerActor.shared.start()
    }
}

/// Read elapsed time from stopwatch timer.
///
/// ``toc()`` reads the elapsed time since the stopwatch timer started by the ``tic()`` function.
public func toc() {
    Task {
        let seconds = await SwiftTimerActor.shared.stop()
        print("Elapsed time: \(seconds) seconds")
    }
}

/// Stopwatch actor using Swift's Clock API.
///
/// Using actor automatically handles thread safety without needing `@unchecked Sendable`.
private actor SwiftTimerActor {
    static let shared = SwiftTimerActor()
    private let clock = ContinuousClock()
    
    private var startInstant: ContinuousClock.Instant?
    
    private init() {}
    
    func start() {
        self.startInstant = clock.now
    }
    
    func stop() -> Double {
        let stopInstant = clock.now
        
        guard let lastStartInstant = self.startInstant else {
            return Double.nan
        }
        self.startInstant = nil
        
        let duration = stopInstant - lastStartInstant
        return Double(duration.components.seconds) + Double(duration.components.attoseconds) / 1e18
    }
}

/*
/// Start stopwatch timer.
///
/// ``tic()`` works with the ``toc()`` function to measure elapsed time.
public func tic() {
    MachTimer.shared.start()

    // Alternative using Actor
    // Task {
    //    await MachTimerActor.shared.start()
    // }
}

/// Read elapsed time from stopwatch timer.
///
/// ``toc()`` reads the elapsed time since the stopwatch timer started by the ``tic()`` function.
public func toc() {
    let seconds = MachTimer.shared.stop()
    print("Elapsed time: \(seconds) seconds")

    // Alternative using Actor
    // Task {
    //    let seconds = await MachTimerActor.shared.stop()
    //
    // }

}

/// Stopwatch.
private final class MachTimer: @unchecked Sendable {
    public static let shared = MachTimer()
    private let numer: UInt64
    private let denom: UInt64

    private let lock = NSLock() // Manual locking
    private var startTime: UInt64 = 0

    private init() {
        var info = mach_timebase_info(numer: 0, denom: 0)
        let status = mach_timebase_info(&info)
        if status == KERN_SUCCESS {
            self.numer = UInt64(info.numer)
            self.denom = UInt64(info.denom)
        } else {
            self.numer = 0
            self.denom = 0
        }
    }

    func start() {
        let newStartTime = mach_absolute_time()
        lock.lock()
        self.startTime = newStartTime
        lock.unlock()
    }

    func stop() -> Double {
        let stopTime = mach_absolute_time()

        lock.lock()
        let lastStartTime = self.startTime
        self.startTime = 0
        lock.unlock()

        guard self.numer !=  0 && self.denom != 0 else { return Double.nan }
        let elapsedTime = stopTime - lastStartTime
        let nanoseconds = elapsedTime * (self.numer / self.denom)
        let seconds = Double(nanoseconds) / 1_000_000_000.0  // Convert to seconds
        return seconds
    }

}

/// Stopwatch actor.
private actor MachTimerActor {
    static let shared = MachTimerActor()
    private let numer: UInt64
    private let denom: UInt64

    private var startTime: UInt64 = 0

    private init() {
        var info = mach_timebase_info(numer: 0, denom: 0)
        let status = mach_timebase_info(&info)
        if status == KERN_SUCCESS {
            self.numer = UInt64(info.numer)
            self.denom = UInt64(info.denom)
        } else {
            fatalError("Failed to initialize MachTimer: mach_timebase_info returned \(status)")
        }
    }

    func start() {
        self.startTime = mach_absolute_time()
    }

    func stop() -> Double {
        guard self.numer !=  0 && self.denom != 0 else { return Double.nan }
        let stopTime = mach_absolute_time()
        let elapsedTime = stopTime - startTime
        let nanoseconds = elapsedTime * self.numer / self.denom
        self.startTime = 0
        return Double(nanoseconds) / 1_000_000_000.0  // Convert to seconds
    }
}
*/
 
/*
 // Example usage:
 tic()
 // ... some code that takes time ...
 let elapsedTime = toc()
 print("Elapsed time: \(elapsedTime) seconds")
 */
