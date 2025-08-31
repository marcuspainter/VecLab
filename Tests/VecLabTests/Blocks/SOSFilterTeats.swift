//
//  SOSFilterTeats.swift
//  VecLab
//
//  Created by Marcus Painter on 31/08/2025.
//

import Foundation
import VecLab
import XCTest

class SOSFilterTests: XCTestCase {
    let accuracy: Real = 1e-6

    func testSOS() {
        let fs = 1000.0 // Sampling frequency (Hz)
        //let fc = 100.0 // Cutoff frequency (Hz)

        // % Design 4th-order lowpass Butterworth
        // [b, a] = butter(4, fc/(fs/2));

        // Convert to second-order sections
        // [sos, g] = tf2sos(b, a)
        let sos = [
            [1.000000000000000, 2.000000033541675, 0.999999985521573, 1.000000000000000, -1.048599576362616, 0.296140357561671],
            [1.000000000000000, 1.999999966458333, 1.000000014478434, 1.000000000000000, -1.320913430819422, 0.632738792885275],
        ]
        let gain = 0.004824343357716
        // Create some test signal: 10 Hz + 200 Hz
        let t = vector(0 ... 1.0, 1.0 / fs)
        let x = sin(2.0 * .pi * 10.0 * t) + sin(2.0 * .pi * 200.0 * t)

        let sosFilter = try! SOSFilter(sos: sos, gain: gain)
        let y = sosFilter.process(x)

        //disp(y[0 ..< 10])
        //disp(length(y))

        let expected = [
            0,
            1.013847035824467,
            7.170830367833683,
            23.180497754657363,
            45.432658623723817,
            60.350172723435051,
            58.426428087880836,
            47.299804604614792,
            44.412529816585632,
            56.924587486496904
        ] * gain

        XCTAssertEqual(y[0..<10], expected, accuracy: accuracy)
    }
}

/*
 % --- Step 3. Create reflected extensions
    x_pre  = 2*x(1)   - x((nfact+1):-1:2);
    x_post = 2*x(end) - x((end-1):-1:(end-nfact));
 */

/*
 % Example: Lowpass Butterworth filter using SOS

 fs = 1000;          % Sampling frequency (Hz)
 fc = 100;           % Cutoff frequency (Hz)

 % Design 4th-order lowpass Butterworth
 [b, a] = butter(4, fc/(fs/2));

 % Convert to second-order sections
 [sos, g] = tf2sos(b, a);

 % Create some test signal: 10 Hz + 200 Hz
 t = 0:1/fs:1;
 x = sin(2*pi*10*t) + sin(2*pi*200*t);

 % Apply SOS filter
 y = sosfilt(sos, x);

 % Plot
 subplot(2,1,1);
 plot(t, x); title('Input Signal');
 subplot(2,1,2);
 plot(t, y); title('Filtered Signal (Lowpass)');

 */
