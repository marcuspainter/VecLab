# Fourier Transform

## Overview

The FFT functions give the same results as MATLAB. For example, the forward and inverse of x is x.

```swift
x == ifft(fft(x))
```

VecLab uses the newer [`vDSP.DiscreteFourierTransform`](https://developer.apple.com/documentation/accelerate/vdsp/discretefouriertransform) for length factors of 2, 3 and 5.
