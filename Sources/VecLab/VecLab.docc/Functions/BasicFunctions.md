# Basic Functions

Basic functions.

## Topics

### Absolute Value
- ``abs(_:)-(RealArray)``

### Sort

- ``sort(_:order:)->(RealArray)``
- ``sort(_:order:)->(SplitComplexArray)``

### Sign
- ``sign(_:)->Real``
- ``sign(_:)->RealArray``
- ``sign(_:)->Complex``
- ``sign(_:)->SplitComplexArray``

### Print and Display
- ``disp(_:)-(RealArray)``
- ``disp(_:)-(SplitComplexArray)``
- ``disp(_:)-(ArraySlice<Real>)``
- ``disp(_:)-()``

### Sums and Products
- ``sum(_:)->Real``
- ``sum(_:)->Complex``

- ``cumsum(_:)->RealArray``
- ``cumsum(_:)->ComplexArray``
- ``cumsum(_:)->SplitComplexArray``

- ``prod(_:)->Real``
- ``prod(_:)-(ComplexArray)->Complex``
- ``prod(_:)-(ComplexArray)``
- ``prod(_:)-(SplitComplexArray)``

- ``cumprod(_:)->RealArray``
- ``cumprod(_:)->ComplexArray``
- ``cumprod(_:)->SplitComplexArray``

- ``dot(_:_:)-(RealArray,RealArray)``
- ``dot(_:_:)-(RealArray,SplitComplexArray)``
- ``dot(_:_:)-(SplitComplexArray,RealArray)``
- ``dot(_:_:)-(SplitComplexArray,SplitComplexArray)``

### Miscellaneous

- ``iterate(_:_:)-(_,(Complex)->Complex)``
- ``iterate(_:_:)-(_,(Int,Complex)->Complex)``
- ``iterate(_:_:)-(_,(Int,Real)->Real)``
- ``iterate(_:_:)-(_,(Real)->Real)``

- ``norm(_:)``

- ``clip(_:lower:upper:)-(Real,Real,Real)``
- ``clip(_:lower:upper:)-(RealArray,Real,Real)``
- ``threshold(_:lower:)-(Real,Real)``
- ``threshold(_:lower:)-(RealArray,Real)``

