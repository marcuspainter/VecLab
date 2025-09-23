//
//  Timer.swift
//  VecLab
//
//  Created by Marcus Painter on 06/09/2025.
//

public func timer(
    _ desc: String = "Time",
    runs: Int = 100,
    body: () throws -> Void
) rethrows {
    let clock = ContinuousClock()
    let start = clock.now

    for _ in 1...runs {
        try body()
    }

    let duration = start.duration(to: clock.now)

    // Convert attoseconds → nanoseconds
    let totalNs = Double(duration.components.attoseconds) / 1e9
    let avgMs = totalNs / Double(runs) / 1_000_000.0

    print("\(desc): \(avgMs) ms")
}
