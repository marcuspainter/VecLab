//
//  FilterTests.swift
//
//
//  Created by Marcus Painter on 25/09/2023.
//

import XCTest
import VecLab

class FilterTests: XCTestCase {

    let accuracy: Real = 1e-6

    // MARK: filter

    func testFilter() throws {
        let realArrayA: RealArray = [1.000000000000000, -0.000000000000000, 0.171572875253810]
        let realArrayB: RealArray = [0.292893218813452, 0.585786437626905, 0.292893218813452]
        let realArrayX: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
        let result: RealArray = filter(realArrayB, realArrayA, realArrayX)
        let expected: RealArray = [
           0.292893218813452,
           1.171572875253810,
           2.292893218813452,
           3.313708498984760,
           4.292893218813452,
           5.289321881345248,
           6.292893218813452,
           7.293505963451373
       ]
        XCTAssertEqual(result, expected, accuracy: accuracy, "filter failed")
    }

    func testFilterZ2() throws {
        let realArrayA: RealArray = [1]
        let realArrayB: RealArray = [0, 0, 1]
        let realArrayX: RealArray = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
        let result: RealArray = filter(realArrayB, realArrayA, realArrayX)
        let expected: RealArray = [0.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0]

        XCTAssertEqual(result, expected, accuracy: accuracy, "filter failed")
    }
    
    func testBiquad() throws {
        let Q = sqrt(2) / 2
        let (b, a) = biquad(f: 100, fs: 44100, Q: Real(Q), dbGain: 6, ftype: .lowpass)
        
        let bb: RealArray = [0.050241422994311e-3, 0.100482845988622e-3, 0.050241422994311e-3]
        let aa: RealArray = [1.000000000000000,   -1.979851542514359,    0.980052508206336]
        
        XCTAssertEqual(b, bb, accuracy: accuracy, "biquad failed")
        XCTAssertEqual(a, aa, accuracy: accuracy, "biquad failed")
    }

    func testFreqz() throws {
        let Q = sqrt(2) / 2
        let (b, a) = biquad(f: 100, fs: 44100, Q: Real(Q), dbGain: 6, ftype: .lowpass)
        
        let bb: RealArray = [0.050241422994311e-3, 0.100482845988622e-3, 0.050241422994311e-3]
        let aa: RealArray = [1.000000000000000,   -1.979851542514359,    0.980052508206336]
        
        XCTAssertEqual(b, bb, accuracy: accuracy, "biquad failed")
        XCTAssertEqual(a, aa, accuracy: accuracy, "biquad failed")
        
        let HH: ComplexArray =
            ([0.999999999998857,  0.787447131918628,  0.16648785181672,  -0.176754632622424, -0.200636601365454],
            [                 0, -0.588789505736948, -0.785673403249241, -0.482549328814426, -0.248410563593813])
              
        var H = freqz(b,a)
        H = slice(H, 0 ..< 5)
        XCTAssertEqual(H, HH, accuracy: accuracy, "freqz failed")
    }
    
    func testFreqz2() throws {
        let Q = sqrt(2) / 2
        let (b, a) = biquad(f: 100, fs: 44100, Q: Real(Q), dbGain: 6, ftype: .lowpass)
        
        let bb: RealArray = [0.050241422994311e-3, 0.100482845988622e-3, 0.050241422994311e-3]
        let aa: RealArray = [1.000000000000000,   -1.979851542514359,    0.980052508206336]
        
        XCTAssertEqual(b, bb, accuracy: accuracy, "biquad failed")
        XCTAssertEqual(a, aa, accuracy: accuracy, "biquad failed")
        
        let HH: ComplexArray =
            ([0.999999999998857,  0.787447131918628,  0.16648785181672,  -0.176754632622424, -0.200636601365454],
            [                 0, -0.588789505736948, -0.785673403249241, -0.482549328814426, -0.248410563593813])
              
        var H = freqz2(b,a)
        H = slice(H, 0 ..< 5)
        XCTAssertEqual(H, HH, accuracy: accuracy, "freqz2 failed")
        
        disp(H)
    }
    
    func testBiquadmag() throws {
        let Q = sqrt(2) / 2
        let (b, a) = biquad(f: 100, fs: 44100, Q: Real(Q), dbGain: 6, ftype: .lowpass)
        
        let bb: RealArray = [0.050241422994311e-3, 0.100482845988622e-3, 0.050241422994311e-3]
        let aa: RealArray = [1.000000000000000,   -1.979851542514359,    0.980052508206336]
        
        XCTAssertEqual(b, bb, accuracy: accuracy, "biquad failed")
        XCTAssertEqual(a, aa, accuracy: accuracy, "biquad failed")
        
        let HH: ComplexArray =
            ([0.999999999998857,  0.787447131918628,  0.16648785181672,  -0.176754632622424, -0.200636601365454],
            [                 0, -0.588789505736948, -0.785673403249241, -0.482549328814426, -0.248410563593813])
              
        var magnitude = biquadmag(b, a)
        magnitude = slice(magnitude, 0 ..< 5)
        
        let magnitudeHH = mag2db(abs(HH));
        
        XCTAssertEqual(magnitude, magnitudeHH, accuracy: accuracy, "biquadmag failed")
        
        disp(magnitude)
        disp("---")
        disp(magnitudeHH)
    }
    
    func testBiquadfreqz() throws {
        let Q = sqrt(2) / 2
        let (b, a) = biquad(f: 100, fs: 44100, Q: Real(Q), dbGain: 6, ftype: .lowpass)
        
        let bb: RealArray = [0.050241422994311e-3, 0.100482845988622e-3, 0.050241422994311e-3]
        let aa: RealArray = [1.000000000000000,   -1.979851542514359,    0.980052508206336]
        
        XCTAssertEqual(b, bb, accuracy: accuracy, "biquad failed")
        XCTAssertEqual(a, aa, accuracy: accuracy, "biquad failed")
        
        let HH: ComplexArray = 
            ([0.999999999998857,  0.787447131918628,  0.16648785181672,  -0.176754632622424, -0.200636601365454],
            [                 0, -0.588789505736948, -0.785673403249241, -0.482549328814426, -0.248410563593813])
              
        var H = biquadfreqz(b, a)
        H = slice(H, 0 ..< 5)
        
        XCTAssertEqual(H, HH, accuracy: accuracy, "biquadfreqz failed")
        
        disp(H)
        disp("---")
        disp(HH)
    }
}
