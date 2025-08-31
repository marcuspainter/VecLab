# Filters

## Overview

Examples of how to use filters.

#### Filter Coefficients Convention

Following the MATLAB convention:

- b are numerator coefficients.
- a are denominator coefficients.
- a0 is normalized to 1.
- (b, a) is the parameter order.

## Biquad Filters

Use `biquad` to get the coefficients for a filter.

|Filter Type|Q|Gain|Enum|
|---|---|---|---|
|Low pass|Yes|No|`.lowpass`|
|High pass|Yes|No|`.highpass`|
|High shelf|Yes|Yes (boost/cut)|`.highshelf`|
|Low shelf|Yes|Yes (boost/cut)|`.lowshelf`|
|Peak|Yes (bandwidth)|Yes (boost/cut at center frequency)|`.peak`|
|Notch|Yes (bandwidth)|No| `.notch`|
|Band pass Q|Yes|No|`.bandpassQ`|
|Band pass 0|Yes|No|`.bandpass0`|
|All pass|Yes|No|`.allpass`|

#### Example

Example of a low pass Butterworth filter.

```swift
// Parameters
let frequency = 100.0 // Hz
let sampleRate: Double = 48000.0 // Hz
let qualityFactor = sqrt(2.0) / 2.0 // 0.707106781186548 - Butterworth
let dbGain = 0.0

// Filter coefficients for Butterworth filter
let (b, a) = biquad(f: frequency, fs: sampleRate, q: qualityFactor, db: dbGain, type: .lowpass)

let x = vector(1 ... 10)
let y = filter(b: b, a: a, x: x)
```

## Filtering with State

Maintain filter state between calls. Useful for block filtering.

```swift
// Filter coefficients
let b = [0, 0, 0, 1] // 3 sample delay
let a = [1]

// Signal
let x = vector(1 ... 10)

// Input blocks
let x1 = x[0..<5]
let x2 = x[6..<10]

// Output blocks
let y1 = [Double]()
let y2 = [Double]()

// Filter state
let state = [Double]()
(y1, state) = filter(b: b, a: a, x: x1, state: state)
(y2, state) = filter(b: b, a: a, x: x2, state: state)
```

## Forward-Backward Filtering

Applies a filter forwards and backwards for zero-delay filtering.

```swift
// Filter coefficients
let b = [0, 0, 0, 1] // 3 sample delay
let a = [1]

let x = vector(1 ... 10)

// Forwards only
let y1 = filter(b: b, a: a, x: x)

// Forwards and backwards
let y2 = filtfilt(b: b, a: a, x: x)

// y1 = [0, 0, 0, 1, 2, 3, 4, 5, 6, 7]
// y2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

```
