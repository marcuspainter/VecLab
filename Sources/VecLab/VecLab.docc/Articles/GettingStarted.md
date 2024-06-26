# Getting Started

## Overview

To begin using the library, you will need to be familiar with the basic data types.

#### Real and Complex Data Types

VecLab does not define any new types for real and complex numbers or arrays. Four typealiases are defined for existing Swift types, starting with `Double`.

```swift
public typealias Real = Double
public typealias RealArray = [Real]
public typealias Complex = (Real, Real)
public typealias ComplexArray = ([Real], [Real])
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

A complex number is a tuple of two `Real` numbers. For example, *1 + 10i*:

```swift
let a = (1.0, 10.0)
```

Note that no labels are required, but can be specified. In Swift, tuples are *compound* types and do not behave like the more familiar *named* types, such as classes, structs and enums. These examples are all of type `(Double, Double)`. The label names are not part of the type.

```swift
let b = (r: 1.0, i: 10.0)
let c = (real: 1.0, imag:10.0)
let d = (real: 1.0, imaginary:10.0)
```

Tuple elements, the real and imaginary parts, can always the `.0` and `.1` properties regardless of any label.

```swift
let complexNumber =  (r: 1.0, i: 0.0)
let realPart = complexNumber.0
let imaginaryPart = complexNumber.1
```

#### The Imaginary Unit

The imaginary unit *i* is an extension of `Double`. The definition is the tuple `(0,1)`. A complex number can be initialized this way, though it is better to use the tuple form otherwise it will be evaluated as a expression at run-time.

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

##### Sized Parameter
A vector often needs to be initialized as the same size as another vector.

```swift
let a = [1.0, 2.0, 3.0]
let b = vector(sized: a)
```

##### Range Parameter

Arrays can be created from ranges of numbers. The function accepts `Range` or `ClosedRange`. 

```swift
let t1 = vector(0..<10)
let t2 = vector(1...10)
```

Ranges can be defined using the Swift `Range` or `ClosedRange` types and using an optional `by` value (Default = 1). This has also been implemented as an extension to the `Array` type.

```swift
let evenNumbers = vector(0..<10, 2) 
```

#### Complex Arrays

Complex arrays are defined as a tuple of two 'Real` arrays of real and imaginary parts. This structure
is known a split complex, rather than interleaved.

```swift
let realArray = [1.0, 2.0, 3.0]
let imagArray = [4.0, 5.0, 6.0]
let complexArray = (realArray, imagArray)
```

Note that unlike a true Swift `Array`, a `ComplexArray` is a tuple and cannot use an index. 

Creating a `ComplexArrray` can be longwinded:

```swift
let realArray = RealArray(repeating: 0.0, count: 10)
let imagArray = RealArray(repeating: 0.0, count: 10)
let complexArray = (realArray, imagArray)
```

#### The complex Function

Complex arrays can be initialized using the shorter `complex` function.

```swift
let complexArray2 = complex(count: 10)
```

It can also be used to create a complex array of the same size. A real array size can also be used.

```swift
let complexArray2 = complex(sized: complexArray1)
```



