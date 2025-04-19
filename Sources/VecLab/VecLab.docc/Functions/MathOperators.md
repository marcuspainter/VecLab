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
