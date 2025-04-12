# Math Operators

Real and complex scalar and vector arithmetic operators.

## Overview

The operator functions are overloaded to allow the free mixing scalars and vectors, including different left and right operand types.

The Accelerate framework is used for vector operations.

|Operator|Description|
|---|---|
|+| Add|
|-| Subtract|
|\*| Multiply|
|/| Divide|
|\*\*| Power|
|\*~|Right conjugate multiply: *a \* conj(b)*|
|~\*|Left conjugate multiply: *conj(a) \* b*|
| - |Unary minus|

#### Power Operator
The `**` operator can be used for power operations. This is the operator equivalent of the <doc:Power> function.

#### Complex Conjugate Multiply

As a shorthand, complex types can use the conjugate multiply operators.

## Topics

### Add

- ``+(_:_:)-(Real,Complex)``
- ``+(_:_:)-(Complex,Real)``
- ``+(_:_:)-(Real,RealArray)``
- ``+(_:_:)-(RealArray,Real)``
- ``+(_:_:)-(RealArray,RealArray)``
- ``+(_:_:)-(Real,ComplexArray)``
- ``+(_:_:)-(ComplexArray,Real)``
- ``+(_:_:)-(RealArray,Complex)``
- ``+(_:_:)-(Complex,RealArray)``
- ``+(_:_:)-(RealArray,ComplexArray)``
- ``+(_:_:)-(ComplexArray,RealArray)``
- ``+(_:_:)-(Complex,Complex)``
- ``+(_:_:)-(Complex,ComplexArray)``
- ``+(_:_:)-(ComplexArray,Complex)``
- ``+(_:_:)-(ComplexArray,ComplexArray)``


### Subtract

- ``-(_:_:)-(Real,Complex)``
- ``-(_:_:)-(Complex,Real)``
- ``-(_:_:)``
- ``-(_:_:)``
- ``-(_:_:)``
- ``-(_:_:)``
- ``-(_:_:)``
- ``-(_:_:)``
- ``-(_:_:)``
- ``-(_:_:)``
- ``-(_:_:)``
- ``-(_:_:)``
- ``-(_:_:)``
- ``-(_:_:)``
- ``-(_:_:)``

### Multiply

- ``*(_:_:)-(Real,Complex)``
- ``*(_:_:)-(Complex,Real)``
- ``*(_:_:)-(Real,RealArray)``
- ``*(_:_:)-(RealArray,Real)``
- ``*(_:_:)-(RealArray,RealArray)``
- ``*(_:_:)-(Real,ComplexArray)``
- ``*(_:_:)-(ComplexArray,Real)``
- ``*(_:_:)-(RealArray,Complex)``
- ``*(_:_:)-(Complex,RealArray)``
- ``*(_:_:)-(RealArray,ComplexArray)``
- ``*(_:_:)-(ComplexArray,RealArray)``
- ``*(_:_:)-(Complex,Complex)``
- ``*(_:_:)-(Complex,ComplexArray)``
- ``*(_:_:)-(ComplexArray,Complex)``
- ``*(_:_:)-(ComplexArray,ComplexArray)``

### Divide

- ``/(_:_:)-(Real,Complex)``
- ``/(_:_:)-(Complex,Real)``
- ``/(_:_:)-(Real,RealArray)``
- ``/(_:_:)-(RealArray,Real)``
- ``/(_:_:)-(RealArray,RealArray)``
- ``/(_:_:)-(Real,ComplexArray)``
- ``/(_:_:)-(ComplexArray,Real)``
- ``/(_:_:)-(RealArray,Complex)``
- ``/(_:_:)-(Complex,RealArray)``
- ``/(_:_:)-(RealArray,ComplexArray)``
- ``/(_:_:)-(ComplexArray,RealArray)``
- ``/(_:_:)-(Complex,Complex)``
- ``/(_:_:)-(Complex,ComplexArray)``
- ``/(_:_:)-(ComplexArray,Complex)``
- ``/(_:_:)-(ComplexArray,ComplexArray)``


### Right Conjugate Multiply

- ``*~(_:_:)-(Real,Complex)``
- ``*~(_:_:)-(Real,ComplexArray)``
- ``*~(_:_:)-(RealArray,Complex)``
- ``*~(_:_:)-(RealArray,ComplexArray)``
- ``*~(_:_:)-(Complex,Complex)``
- ``*~(_:_:)-(Complex,ComplexArray)``
- ``*~(_:_:)-(ComplexArray,Complex)``
- ``*~(_:_:)-(ComplexArray,ComplexArray)``

### Left Conjugate Multiply
- ``~*(_:_:)-(Complex,Real)``
- ``~*(_:_:)-(ComplexArray,Real)``
- ``~*(_:_:)-(Complex,RealArray)``
- ``~*(_:_:)-(ComplexArray,RealArray)``
- ``~*(_:_:)-(Complex,Complex)``
- ``~*(_:_:)-(Complex,ComplexArray)``
- ``~*(_:_:)-(ComplexArray,Complex)``
- ``~*(_:_:)-(ComplexArray,ComplexArray)``

### Power
- ``**(_:_:)-(Int,Int)``
- ``**(_:_:)-(Int,Real)``
- ``**(_:_:)-(Real,Int)``
- ``**(_:_:)-(Real,Real)``
- ``**(_:_:)-(RealArray,Int)``
- ``**(_:_:)-(Real,Complex)``
- ``**(_:_:)-(Complex,Real)``
- ``**(_:_:)-(Complex,Int)``
- ``**(_:_:)-(Complex,Complex)``
- ``**(_:_:)-(Real,RealArray)``
- ``**(_:_:)-(RealArray,Real)``
- ``**(_:_:)-(RealArray,RealArray)``
- ``**(_:_:)-(RealArray,Complex)``
- ``**(_:_:)-(RealArray,ComplexArray)``
- ``**(_:_:)-(Complex,RealArray``
- ``**(_:_:)-(Real,ComplexArray)``
- ``**(_:_:)-(ComplexArray,Real)``
- ``**(_:_:)-(ComplexArray,RealArray)``
- ``**(_:_:)-(ComplexArray,ComplexArray)``

### Unary Plus

- ``+(_:)->RealArray``
- ``+(_:)->Complex``
- ``+(_:)->ComplexArray``

### Unary Minus

- ``-(_:)->RealArray``
- ``-(_:)->Complex``
- ``-(_:)->ComplexArrray``
