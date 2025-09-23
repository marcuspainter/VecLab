# Fourier Transform

FFT, DFT and FFT shift.

## Topics

### Fast Fourier Transform

- ``fft(_:length:)``
- ``fftr(_:length:)``

- ``ifft(_:length:)->SplitComplexArray``
- ``ifftr(_:length:)->(RealArray)``

- ``fft(_:)->ComplexArray``
- ``ifft(_:)->ComplexArray``

### FFT Shift

- ``fftshift(_:)->RealArray``
- ``fftshift(_:)->SplitComplexArray``
- ``ifftshift(_:)->RealArray``
- ``ifftshift(_:)->SplitComplexArray``
- ``fftsymmetric(_:)``

### Discrete Fourier Transform 

- ``dftr(_:)``
- ``dft(_:)``
- ``dft(x:frequency:sampleRate:)``

- ``dft(_:)``
- ``dftr(_:)``
- ``idft(_:)``
- ``idftr(_:)``

### Discrete Cosine Transform

- ``dct(_:)``
- ``idct(_:)``

### FFT Setup

- ``nextpow2(_:)->(Int)``

