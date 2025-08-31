# Double and Float Types

## Overview

VecLab uses `Double` types by default. To easily convert between `Double` and `Float`, use the following initializers.

### Float to Double Array

```swift
let floats: [Float] = [1, 2, 3, 4, 5]
let doubles: [Double] = [Double](floats: floats)
```

### Double to Float Array

```swift
let doubles: [Double] = [1.0, 2.0, 3.0, 4.0, 5.0]
let floats: [Float] = [Float](doubles: doubles)
```
