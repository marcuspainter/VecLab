# Fourier Transforms

## Overview

The FFT functions give the same results as MATLAB. For example, the forward and inverse of x is x.

ifft(fft(x)) = x


VecLab uses the newer [`vDSP.DiscreteFourierTransform`](https://developer.apple.com/documentation/accelerate/vdsp/discretefouriertransform) for length factors of 2, 3 and 5.

### Magnitude and Phase

VecLab uses the MATLAB-style function names `abs()` and `angle()` for magnitude and phase.

```swift
let z = ComplexArray([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0], [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0])
let Z = fft(z)
let magnitude = abs(Z)
let phase = angle(Z)
```
### Real and Complex FFTs

To avoid ambiguity with return values and type inference, the FFT and IFFT functions have separate functions
for real numbers (similar to NumPy). The compiler will give an error if the wrong type is used. Use `fftr()` and
`ifftr()` for real arrays.

```swift
let x: [Double] = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0]
let X = fftr(x)  // Returns ComplexArray
let y = ifftr(X) // Returns [Double] real array

let Z = fft(x) // Error: 'fft' has been renamed to 'fftr': Use fftr for Real arrays
```
