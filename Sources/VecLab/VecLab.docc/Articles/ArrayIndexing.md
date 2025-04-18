# Array Indexing


```
a0 = [0,0,0,0, 0,0,0,0]
indices1 = [1,3]
indices2 = [5,7]

b = [10, 20, 30, 40, 50, 60, 70, 80]
c = [19, 29]

% Set all to scalar
a = a0;
a(:) = 1

% Set indices to scalar
a = a0;
a(indices1) = 1

% Set indices to vector
a = a0;
a(indices1) = c

% Set indices to indices of vector
a = a0;
a(indices2) = b(indices1)
```

|Syntax|Type|Description|
|---|---|---|
|`a[i]`|`subscript(index: Int)`|Access a single element|
|`a[m..<n]`|`subscript(bounds: Range<Int>`)|Half-open range|
|`a[m...n]`|`subscript(bounds: ClosedRange<Int>)`|Closed range|
|`a[..<n]`|`subscript(bounds: PartialRangeUpTo<Int>)`|From start up to (excl. `n`)|
|`a[...n]`|`subscript(bounds: PartialRangeThrough<Int>)`|From start through `n`|
|`a[m...]`|`subscript(bounds: PartialRangeFrom<Int>)`|From `m` through end|
|`a[...]`|`subscript(bounds: PartialRangeFrom<Int>)`|With `m = startIndex`|
