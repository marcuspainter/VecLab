# Array Indexing

## Overview

Unlike normal Swift indexing with range, VecLab overrides the normal behaviour of sub-arrays.

- Sub-arrays ranges are arrays not slices.
- Assignment of sub-arrays must be the same size.

```swift
let a[0 ... 2] = b[1 ... 3] // Sizes must match
```

### Array Index

|Syntax|Type|Description|
|---|---|---|
|`a[i]`|`subscript(index: Int)`|Access a single element|

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
