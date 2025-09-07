# Basic Functions

Basic functions.

## Topics

### Absolute Value
- ``abs(_:)-(RealArray)``

### Sort

- ``sort(_:order:)->(RealArray)``
- ``sort(_:order:)->(ComplexArray)``

### Sign
- ``sign(_:)->Real``
- ``sign(_:)->RealArray``
- ``sign(_:)->Complex``
- ``sign(_:)->ComplexArray``

### Print and Display
- ``disp(_:)-(RealArray)``
- ``disp(_:)-(ComplexArray)``
- ``disp(_:)-(ArraySlice<Real>)``
- ``disp(_:)-()``

### Sums and Products
- ``sum(_:)->Real``
- ``sum(_:)->Complex``
- ``cumsum(_:)->RealArray``
- ``cumsum(_:)->ComplexArray``
- ``prod(_:)->Real``
- ``prod(_:)->Complex``
- ``cumprod(_:)->RealArray``
- ``cumprod(_:)->ComplexArray``
- ``dot(_:_:)->Real``
- ``dot(_:_:)-(RealArray,ComplexArray)``
- ``dot(_:_:)-(ComplexArray,RealArray)``
- ``dot(_:_:)-(ComplexArray,ComplexArray)``

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

