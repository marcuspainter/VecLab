#  Polynomials

Polynomial functions.

## Topics

### Polynomial Evaluation

- ``polyval(coefficients:point:)-(RealArray,Real)``
- ``polyval(coefficients:point:)-(RealArray,Complex)``
- ``polyval(coefficients:points:)-(RealArray,RealArray)``
- ``polyval(coefficients:points:)-(RealArray,SplitComplexArray)``
- ``polyval(coefficients:point:)-(SplitComplexArray,Complex)``
- ``polyval(coefficients:points:)-(SplitComplexArray,RealArray)``
- ``polyval(coefficients:points:)-(SplitComplexArray,SplitComplexArray)``
- ``polyval(coefficients:point:)-(SplitComplexArray,Real)``

### Polynomial Roots

- ``roots(coefficients:)->(RealArray)``
- ``roots(coefficients:)->(ComplexArray)``
- ``roots(coefficients:)->SplitComplexArray``

### Polynomial From Roots

- ``poly(roots:)->(SplitComplexArray)``
