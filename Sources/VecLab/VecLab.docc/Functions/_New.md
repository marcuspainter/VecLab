# New

New functions.

## Topics

### Fill and Clear
- ``clear(_:)-(RealArray)``
- ``clear(_:)-(ComplexArray)``

- ``fill(_:_:)-(_,Real)``
- ``fill(_:_:)-(_,Complex)``


### Cross-correlation

- ``xcorr(_:)->RealArray``
- ``xcorr(_:)->ComplexArray``
- ``xcorr(_:_:)->RealArray``
- ``xcorr(_:_:)->ComplexArray``
- ``xcorrSimple(_:_:)``

### Convolution 

- ``conv(_:_:shape:)->ComplexArray``
- ``conv(_:_:shape:)->RealArray``

### Resample

- ``upsample(_:_:_:)``
- ``downsample(_:_:_:)``

### Peak Power

- ``peak2rms(_:)``
- ``peak2peak(_:)``
- ``paprdb(_:)``

### FFT Bin Frequency

- ``bin2freq(bin:n:fs:)``
- ``freq2bin(f:n:fs:)``

### Peaks

- ``findpeaks(_:minPeakHeight:threshold:)``
