# Array Indexing

## Overview

Unlike normal Swift indexing with ranges, VecLab overrides the normal behaviour of slices of sub-arrays.

### Array Slices

Sub-array ranges are arrays not slices.

```swift
let a: [Double] = [1, 2, 3, 4, 5]
let b = a[1 ... 3]
let c = Array(b)
print(c)

```
### Assignment

Assignment of sub-arrays must be the same size.

```swift
let a[0 ... 2] = b[1 ... 3] // Sizes must match
```

### Array Index

|Syntax|Type|Description|
|---|---|---|
|`a[i]`|`subscript(index: Int)`|Access a single element at index `i`|
|`a[b]`|`subscript(indices: [Int])`|Access elements of array `b` of indices|

### Array Range

|Syntax|Type|Description|
|---|---|---|
|`a[m ..< n]`|`subscript(bounds: Range<Int>`)|Half-open range|
|`a[m ... n]`|`subscript(bounds: ClosedRange<Int>)`|Closed range|
|`a[..< n]`|`subscript(bounds: PartialRangeUpTo<Int>)`|From start up to (excl. `n`)|
|`a[... n]`|`subscript(bounds: PartialRangeThrough<Int>)`|From start through `n`|
|`a[m ...]`|`subscript(bounds: PartialRangeFrom<Int>)`|From `m` through end|
|`a[...]`|`subscript(bounds: PartialRangeFrom<Int>)`|With `m = startIndex`|

### Array Range with Step

|Syntax|Type|Description|
|---|---|---|
|`a[m ..< n, s]`|`subscript(bounds: Range<Int>`)|Half-open range|
|`a[m ... n, s]`|`subscript(bounds: ClosedRange<Int>)`|Closed range|
|`a[..< n, s]`|`subscript(bounds: PartialRangeUpTo<Int>)`|From start up to (excl. `n`)|
|`a[... n, s]`|`subscript(bounds: PartialRangeThrough<Int>)`|From start through `n`|
|`a[m ..., s]`|`subscript(bounds: PartialRangeFrom<Int>)`|From `m` through end|
|~`a[..., s]`~|Not available with step|This syntax is not allowed by Swift|
