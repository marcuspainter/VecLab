# New

New functions.

## Topics

### Cross-correlation

- ``xcorr(_:)->RealArray``
- ``xcorr(_:)->SplitComplexArray``
- ``xcorr(_:_:)->RealArray``
- ``xcorr(_:_:)->SplitComplexArray``
- ``xcorrSimple(_:_:)``

### Convolution 

- ``conv(_:_:shape:)->RealArray``
- ``conv(_:_:shape:)->SplitComplexArray``

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
