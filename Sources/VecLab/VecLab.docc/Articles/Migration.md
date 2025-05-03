# Migration to Version 2.0

Migrating your code.

## Overview

Version 2.0 now uses structs instead of tuples for complex types. Conversion should be relatively straightforward and any required
changes will be flagged by the compiler. Your code should not need any structural changes, though you might wish to 
take advantage some of the new features.

### Type Alias Changes

Complex numbers are now `ComplexDouble` structs and complex arrays are now `ComplexDoubleArray` structs.

For convenience, these are shortened to `Complex` and `ComplexArray` with type aliases. The package assumes `Double` 
as the base numeric type. `Float` types may be added at a later date.

Your function signatures should not require any changes.

```swift
// V1
public typealias Real = Double
public typealias RealArray = [Real]
public typealias Complex = (Real, Real) // Tuple
public typealias ComplexArray = ([Real], [Real]) // Tuple

// V2
public typealias Real = Double
public typealias RealArray = [Real]
public typealias Complex = ComplexDouble // Struct
public typealias ComplexArray = ComplexDoubleArray // Struct Collection
```

### Complex Numbers

Use the `Complex` initializer.

```swift
// V1
let complexNumber = (2.0, 3.0)

// V2
let complexNumber = Complex(2.0, 3.0)
```

### Complex Arrays

Use the `ComplexArray` initializer.

```swift
// V1
let complexArray = (realArray, imagArray)

// V2
let complexArray = ComplexArray(realArray, imagArray)
```

### Real and Imaginary Parts

Replace the tuple notation of `x.0` and `x.1` for real and imaginary parts 
with `x.real` and `x.imag`. The new scheme should be more intuitive and less error-prone.

```swift
// V1
let realPart = x.0
let imagPart = x.1

// V2
let realPart = x.real
let imagPart = x.imag
```
### Complex Array Indexing

The `ComplexArray` type is now a `Collection`. Accessing a complex number in an array can be done using a single index.
The real and imaginary parts do not have to be indexed as separate arrays, simplifying access to individual complex elements.

For example, assigning one array element to another:

```swift
// V1
(x.0[i],x.1[i]) = (y.0[i], y.1[i])

// V2
x[i] = y[i]
```

### Function Parameter Labels

Some functions now have explicit labels to be more Swift-like. In general, the first parameter will not have a label 
for brevity. Optional parameters will have more meaningful names.

Example:

```swift
// V1
let x = paddata(y, 100)

// V2
let x = paddata(y, length: 100)
```

