# Array Concatenation

## Overview

Swift provides array concatenation using the `+` operator. This is a useful shorthand. However, we wish to use the `+` 
operator for addition.

### The Swift + Array Concatenation Operator

#### String Arrays

```swift
let a = ["A", "B", "C"]
let b = ["D", "E", "F"]
let c = a + b
print(c)

["A", "B", "C", "D", "E", "F"]
```
#### Double Arrays

```swift
let a = [1.0, 2.0, 3.0]
let b = [4.0, 5.0, 6.0]
let c = a + b
print(c)

[1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
```

However, when using VecLab, we want mathematically add the two arrays as vectors, not concatenate them.

VecLab cannot override the Swift concatenation operator, but it can make a specialized operator that only applies 
to `RealArray` and `ComplexArray`.

```swift
import VecLab

let a = [1.0, 2.0, 3.0]
let b = [4.0, 5.0, 6.0]
let c = a + b
print(c)

[5.0, 7.0, 9.0]  // Result of addition.
```

Note the behaviour has changed, so be aware of any unexpected results. There will be a error if the arrays are 
not the same length.

#### Using the cat() function

To concatenate a `RealArray` or `ComplexArray`, use the variadic `cat()` function.
```swift
import VecLab

let a = [1.0, 2.0, 3.0]
let b = [4.0, 5.0, 6.0]
let b = [7.0, 8.0, 9.0]
let c = cat(a, b, c)
print(c)

[1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0] // Result of concatenation.
```

All other array types can still use the original Swift `+` operator. So in the `String` example, the result will be as
expected.
