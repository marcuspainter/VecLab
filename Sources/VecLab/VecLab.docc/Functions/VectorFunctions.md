# Vector Functions

Vector functions.

## Topics

### Concatenation
- ``cat(_:)-(RealArray...)``
- ``cat(_:)-([RealArray])``
- ``cat(_:)-(ComplexArray...)``
- ``cat(_:)-([ComplexArray])``

### Circular Shift
- ``circshift(_:_:)->RealArray``
- ``circshift(_:_:)->ComplexArray``

### Flip (Reverse)
- ``flip(_:)->RealArray``
- ``flip(_:)->ComplexArray``

### Vector Length (Size)
- ``length(_:)-(RealArray)``
- ``length(_:)-(ComplexArray)``

### Repeating Element
- ``repelem(_:_:)-(Real,_)``
- ``repelem(_:_:)-(RealArray,_)``
- ``repelem(_:_:)-(Complex,_)``
- ``repelem(_:_:)-(Complex,_)``
- ``repelem(_:_:)-(ComplexArray,_)``

### Vector Slice
- ``slice(_:_:_:)-(RealArray,Range<Int>,_)``
- ``slice(_:_:_:)-(ComplexArray,Range<Int>,_)``
- ``slice(_:_:_:)-(RealArray,ClosedRange<Int>,_)``
- ``slice(_:_:_:)-(ComplexArray,ClosedRange<Int>,_)``

### Resize
- ``resize(_:length:)->RealArray``
- ``resize(_:length:)->ComplexArray``

### Padding and Trimming
- ``paddata(_:length:)->RealArray``
- ``paddata(_:length:)->ComplexArray``
- ``trimdata(_:length:)->RealArray``
- ``trimdata(_:length:)->ComplexArray``

### Gather

- ``gather(_:indices:)->RealArray``
- ``gather(_:indices:)->ComplexArray``
