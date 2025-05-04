# Getting Started

## Overview

To begin using the library, you will need to be familiar with the basic data types.

#### Real and Complex Data Types

VecLab uses Swift `Double` and `[Double]` arrays for real numbers. For complex numbers the `ComplexDouble`
and `ComplexDoubleArray` types. For convenience, the following typealiases are defined.

```swift
public typealias Real = Double
public typealias RealArray = [Real]
public typealias Complex = ComplexDouble
public typealias ComplexArray = ComplexDoubleArray
```

### Scalars

#### Real Number

Real numbers are just `Double` types:

```swift
let a =  10.0
let c: Double =  123
```

A real number is referred by the typealias of `Real`. 

```swift
let c: Real =  123.0
```

#### Complex Number

A complex number struct `ComplexDouble`.

```swift
let a = ComplexDouble(1.0, 10.0)
```

```swift
let complexNumber =  (r: 1.0, i: 0.0)
let realPart = complexNumber.0
let imaginaryPart = complexNumber.1
```

#### The Imaginary Unit

The imaginary unit *i* is an static extension of `Double`. 

```swift
let c = 1 + 10.0 * Real.i
```

The `i` property can be used in any expression. For example, a complex exponential:

```swift
let a = exp(Real.i * 2 * Real.pi * 10.0)
```

### Vectors and Arrays

#### Real Arrays

Vectors are Swift arrays of 'Double' and can be created in the normal way:

```swift
let a = [1.0, 2.0, 3.0]
let b = [Double](repeating: 0.0, count: 10)
```

It is preferred to use the typealiases of `Real` or `RealArray`.

```swift
let c = [Real](repeating: 0.0, count: 10)
let d = RealArray(repeating: 0.0, count: 10)
```

#### The vector Function

A shorter and more versatile function is provided to create arrays.

```swift
let a = vector(count: 10)
```

##### Range Parameter

Arrays can be created from ranges of numbers. The function accepts `Range` or `ClosedRange`. 

```swift
let t1 = vector(0..<10)
let t2 = vector(1...10)
```

Ranges can be defined using the Swift `Range` or `ClosedRange` types and using an optional `by` value (Default = 1).
This has also been implemented as an extension to the `Array` type.

```swift
let evenNumbers = vector(0..<10, 2) 
```

#### Complex Arrays

Complex arrays are defined `ComplexDoubleArray`. This structure stores is known a split complex, rather than interleaved.

```swift
let realArray = [1.0, 2.0, 3.0]
let imagArray = [4.0, 5.0, 6.0]
let complexArray = ComplexArray(realArray, imagArray)
```

```swift
let realArray = RealArray(repeating: 0.0, count: 10)
let imagArray = RealArray(repeating: 0.0, count: 10)
let complexArray = ComplexArray(count: 10)
```


