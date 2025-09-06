# Double and Float Types

## Overview

VecLab uses `Double` types by default. To easily convert between `Double` and `Float`, use the following initializers.

### Float to Double Array

```swift
let floats: [Float] = [1.0, 2.0, 3.0, 4.0, 5.0]
let doubles: [Double] = [Double](floats: floats)
```

### Double to Float Array

```swift
let doubles = [1.0, 2.0, 3.0, 4.0, 5.0]
let floats: [Float] = [Float](doubles: doubles)
```
Alternatively, use these functions for conversion.

```swift
var floats: [Float] = [1.0, 2.0, 3.0, 4.0, 5.0]
...
let double = double2float(floats)
let newFloats = float2double(doubles)
```
