# Vector Functions

Vector functions.

## Topics

### Concatenation
- ``cat(_:)-(RealArray...)``
- ``cat(_:)-([RealArray])``
- ``cat(_:)-(SplitComplexArray...)``
- ``cat(_:)-([SplitComplexArray])``

### Circular Shift
- ``circshift(_:_:)->RealArray``
- ``circshift(_:_:)->SplitComplexArray``

### Flip (Reverse)
- ``flip(_:)->RealArray``
- ``flip(_:)->SplitComplexArray``

### Vector Length (Size)
- ``length(_:)-(RealArray)``
- ``length(_:)-(SplitComplexArray)``

### Repeating Element
- ``repelem(_:_:)-(Real,_)``
- ``repelem(_:_:)-(RealArray,_)``
- ``repelem(_:_:)-(Complex,_)``
- ``repelem(_:_:)-(Complex,_)``
- ``repelem(_:_:)-(SplitComplexArray,_)``

### Vector Slice
- ``slice(_:_:_:)-(RealArray,Range<Int>,_)``
- ``slice(_:_:_:)-(SplitComplexArray,Range<Int>,_)``
- ``slice(_:_:_:)-(RealArray,ClosedRange<Int>,_)``
- ``slice(_:_:_:)-(SplitComplexArray,ClosedRange<Int>,_)``

### Resize
- ``resize(_:length:)->RealArray``
- ``resize(_:length:)->SplitComplexArray``

### Padding and Trimming
- ``paddata(_:length:)->RealArray``
- ``paddata(_:length:)->SplitComplexArray``
- ``trimdata(_:length:)->RealArray``
- ``trimdata(_:length:)->SplitComplexArray``

### Gather

- ``gather(_:indices:)->RealArray``
- ``gather(_:indices:)->SplitComplexArray``
