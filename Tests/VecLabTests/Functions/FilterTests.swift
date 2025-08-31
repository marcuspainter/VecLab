//
//  FilterTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import VecLab
import XCTest

class FilterTests: XCTestCase {
    let accuracy: Real = 1e-6

    // MARK: filter

    func testFilter() throws {
        let realArrayA: RealArray = [1.000000000000000, -0.000000000000000, 0.171572875253810]
        let realArrayB: RealArray = [0.292893218813452, 0.585786437626905, 0.292893218813452]
        let realArrayX: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
        let result: RealArray = filter(b: realArrayB, a: realArrayA, x: realArrayX)
        let expected: RealArray = [
            0.292893218813452,
            1.171572875253810,
            2.292893218813452,
            3.313708498984760,
            4.292893218813452,
            5.289321881345248,
            6.292893218813452,
            7.293505963451373,
        ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "filter failed")
    }

    func testFilterZ2() throws {
        let realArrayA: RealArray = [1]
        let realArrayB: RealArray = [0, 0, 1]
        let realArrayX: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
        let result: RealArray = filter(b: realArrayB, a: realArrayA, x: realArrayX)
        let expected: RealArray = [0.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0]

        XCTAssertEqual(result, expected, accuracy: accuracy, "filter failed")
    }

    func testBiquad() throws {
        let Q = sqrt(2.0) / 2.0
        let (b, a) = biquad(f: 100, fs: 44100, q: Real(Q), db: 6, type: .lowpass)

        let bb: RealArray = [0.050241422994311e-3, 0.100482845988622e-3, 0.050241422994311e-3]
        let aa: RealArray = [1.000000000000000, -1.979851542514359, 0.980052508206336]

        XCTAssertEqual(b, bb, accuracy: accuracy, "biquad failed")
        XCTAssertEqual(a, aa, accuracy: accuracy, "biquad failed")
    }

    func testFreqz() throws {
        let Q = sqrt(2.0) / 2.0
        let (b, a) = biquad(f: 100, fs: 44100, q: Real(Q), db: 6, type: .lowpass)

        let bb: RealArray = [0.050241422994311e-3, 0.100482845988622e-3, 0.050241422994311e-3]
        let aa: RealArray = [1.000000000000000, -1.979851542514359, 0.980052508206336]

        XCTAssertEqual(b, bb, accuracy: accuracy, "biquad failed")
        XCTAssertEqual(a, aa, accuracy: accuracy, "biquad failed")

        let HH: ComplexArray =
            ComplexArray([0.999999999998857, 0.787447131918628, 0.16648785181672, -0.176754632622424, -0.200636601365454],
                         [0, -0.588789505736948, -0.785673403249241, -0.482549328814426, -0.248410563593813])

        var H = freqz(b: b, a: a)
        H = slice(H, 0 ..< 5)
        XCTAssertEqual(H, HH, accuracy: 1e-3, "freqz failed")
    }

    func testFreqz2() throws {
        let Q = sqrt(2.0) / 2.0
        let (b, a) = biquad(f: 100, fs: 44100, q: Real(Q), db: 6, type: .lowpass)

        let bb: RealArray = [0.050241422994311e-3, 0.100482845988622e-3, 0.050241422994311e-3]
        let aa: RealArray = [1.000000000000000, -1.979851542514359, 0.980052508206336]

        XCTAssertEqual(b, bb, accuracy: accuracy, "biquad failed")
        XCTAssertEqual(a, aa, accuracy: accuracy, "biquad failed")

        let HH: ComplexArray =
            ComplexArray([0.999999999998857, 0.787447131918628, 0.16648785181672, -0.176754632622424, -0.200636601365454],
                         [0, -0.588789505736948, -0.785673403249241, -0.482549328814426, -0.248410563593813])

        var H = freqz2(b: b, a: a)
        H = slice(H, 0 ..< 5)
        XCTAssertEqual(H, HH, accuracy: 1e-3, "freqz2 failed")

        disp(H)
    }

    func testBiquadmag() throws {
        let Q = sqrt(2.0) / 2.0
        let (b, a) = biquad(f: 100, fs: 44100, q: Real(Q), db: 6, type: .lowpass)

        let bb: RealArray = [0.050241422994311e-3, 0.100482845988622e-3, 0.050241422994311e-3]
        let aa: RealArray = [1.000000000000000, -1.979851542514359, 0.980052508206336]

        XCTAssertEqual(b, bb, accuracy: accuracy, "biquad failed")
        XCTAssertEqual(a, aa, accuracy: accuracy, "biquad failed")

        let HH: ComplexArray =
            ComplexArray([0.999999999998857, 0.787447131918628, 0.16648785181672, -0.176754632622424, -0.200636601365454],
                         [0, -0.588789505736948, -0.785673403249241, -0.482549328814426, -0.248410563593813])

        var magnitude = biquadmag(b: b, a: a)
        magnitude = slice(magnitude, 0 ..< 5)

        let magnitudeHH = mag2db(abs(HH))

        XCTAssertEqual(magnitude, magnitudeHH, accuracy: 1e-2, "biquadmag failed")

        disp(magnitude)
        disp("---")
        disp(magnitudeHH)
    }

    func testBiquadfreqz() throws {
        let Q = sqrt(2.0) / 2.0
        let (b, a) = biquad(f: 100, fs: 44100, q: Real(Q), db: 6, type: .lowpass)

        let bb: RealArray = [0.050241422994311e-3, 0.100482845988622e-3, 0.050241422994311e-3]
        let aa: RealArray = [1.000000000000000, -1.979851542514359, 0.980052508206336]

        XCTAssertEqual(b, bb, accuracy: accuracy, "biquad failed")
        XCTAssertEqual(a, aa, accuracy: accuracy, "biquad failed")

        let HH: ComplexArray =
            ComplexArray([0.999999999998857, 0.787447131918628, 0.16648785181672, -0.176754632622424, -0.200636601365454],
                         [0, -0.588789505736948, -0.785673403249241, -0.482549328814426, -0.248410563593813])

        var H = biquadfreqz(b: b, a: a)
        H = slice(H, 0 ..< 5)

        XCTAssertEqual(H, HH, accuracy: 1e-3, "biquadfreqz failed")

        disp(H)
        disp("---")
        disp(HH)
    }

    func testFilterState() throws {
        let b: [Double] = [0.5, 0.5] // numerator coeffs (FIR averaging filter)
        let a: [Double] = [1.0, 0.0] // denominator coeffs (no feedback)

        let x: [Double] = [1, 2, 3, 4, 5] // input signal

        // Initial state
        var state: [Double] = []

        // Call our filter
        let (y, newState) = filter(b: b, a: a, x: x, state: state)
        state = newState

        print("Input x: \(x)")
        print("Output y: \(y)")
        print("Final state newState: \(newState)")

        let expectedY: [Double] = [0.500000000000000, 1.500000000000000, 2.500000000000000, 3.500000000000000, 4.500000000000000]
        let expectedState: [Double] = [2.5]
        XCTAssertEqual(y, expectedY, accuracy: accuracy)
        XCTAssertEqual(state, expectedState, accuracy: accuracy)
    }

    func testFilterState2() throws {
        //let b: [Double] = [0.5, 0.5] // numerator coeffs (FIR averaging filter)
        //let a: [Double] = [1.0, 0.0] // denominator coeffs (no feedback)
        
        //let b = [0.2];        // numerator
        //let a = [1, -0.8];    // denominator (feedback) Needs feedback to test delay line
        //let (b,a) = biquad(f: 100, fs: 48000.0, q: sqrt(2.0) / 2.0, db: 0, type: .lowpass)
        
        // Butterworh low-pass
        let b = [4.2443368140232844e-05, 8.488673628046569e-05, 4.2443368140232844e-05]
        let a = [1.0, -1.981488509144573, 0.9816582826171341]

        let x1: [Double] = [1, 2, 3, 4, 5]  // input signal 1
        let x2: [Double] = [6, 7, 8, 9, 10] // input signal 2
        let xFull: [Double] = cat(x1, x2)   // Combined

        // Initial state
        var state: [Double] = []
        var y1: [Double]
        var y2: [Double]

        // Block filter by parts
        (y1, state) = filter(b: b, a: a, x: x1, state: state)
        (y2, state) = filter(b: b, a: a, x: x2, state: state)
        
        // No state - Block 2 fails
        //y1 = filter(b: b, a: a, x: x1)
        //y2 = filter(b: b, a: a, x: x2)

        // Full length filter
        let yFull = filter(b: b, a: a, x: xFull)

        let yBlock = cat(y1, y2)

        XCTAssertEqual(yBlock, yFull, accuracy: accuracy)

        //disp(yBlock)
        //disp(yFull)
        //print("---")
        //print(b)
        //print(a)
    }
    
    func testFiltfiltReal() {
        let x = vector(1 ... 10)
        let b: [Double] = [0, 0, 0, 1] // 3 sample Delay
        //let b: [Double] = ones(3) / 3.0
        //let b: [Double] = [1, -1]
        
        let a: [Double] = [1]
        
        //let y1 = filter(b: b, a: a, x: x)
        //disp(y1)
        
        let y2 = filtfilt(b: b, a: a, x: x)
        //disp(y2)
        
        XCTAssertEqual(y2, x, accuracy: accuracy)
    }
    
    func testFiltfiltComplex() {
        let x = vector(1 ... 10)
        let z = ComplexArray(x, x)
        let b: [Double] = [0, 0, 0, 1] // 3 sample Delay
        //let b: [Double] = ones(3) / 3.0
        //let b: [Double] = [1, -1]
        
        let a: [Double] = [1]
        
        //let y1 = filter(b: b, a: a, x: x)
        //disp(y1)
        
        let y2 = filtfilt(b: b, a: a, x: z)
        //disp(y2)
        
        XCTAssertEqual(y2, z, accuracy: accuracy)
    }
    
    func testFiltFiltExtend() {
        let a = vector(1 ... 3)
        let b = vector(4 ... 6)
        let x = vector(1 ... 10)
        let n = x.count
        let nfact = 3 * (max(length(a), length(b)) - 1)
        
        // --- Step 2. Check input length
        if length(x) <= nfact {
            fatalError("Data sequence too short for filter order.")
        }
        
        // --- Step 3. Create reflected extensions
        let x_pre  = 2.0 * x[0]     - flip(x[1 ..< (nfact+1)])
        let x_post = 2.0 * x[n - 1] - flip(x[ (n-nfact-1) ..< (n-1) ])
        
        let x_ext = cat(x_pre, x, x_post)
        //disp(x_ext)
        
        //--- Step 4. Forward filter
        var y_ext = filter(b: b, a: a, x: x_ext)
          
        // --- Step 5. Reverse and filter again
        y_ext = filter(b: b, a: a, x: flip(y_ext))
          
        // --- Step 6. Flip back
        y_ext = flip(y_ext);
        
        y_ext = x_ext
        
        // --- Step 7. Trim off the extension
        let ny = y_ext.count
        let y = y_ext[ nfact ..< (ny - nfact) ]
        //disp(y);
    }
}
