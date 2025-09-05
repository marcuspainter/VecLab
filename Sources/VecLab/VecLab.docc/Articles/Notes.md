
# Notes

## Overview

Some notes about MATLAB conventions and implementation notes.

## Array Indexing Starts at 1

Indexes start at 1 not zero. When porting code be careful to distinguish between indexing loops and value loops. Values
often start at zero, for example, t = 0:10.

## Complex Sort Order

If A is complex, then by default, `sort` sorts the elements by magnitude. If more than one element has equal magnitude, 
then the elements are sorted by phase angle on the interval (−π, π].

[MATLAB - sort](https://uk.mathworks.com/help/matlab/ref/double.sort.html)


## Filter Coefficients

Filter Coefficients defined by the numerator and denominator coefficients b and a. Parameters are return in this 
order in tuples.

```swift
let b = [4.2443368140232844e-05, 8.488673628046569e-05, 4.2443368140232844e-05]
let a = [1.0,                   -1.981488509144573,     0.9816582826171341]

let y = filter(b: b, a: a, x: x)
```

Coefficient normalization is done with a0 = 1.

[MATLAB - Filter](https://uk.mathworks.com/help/matlab/ref/filter.html)

## Polynomial Coefficient Order

Polynomials as row vectors containing coefficients ordered by descending powers. For example, the three-element vector

```swift
let p = [p2, p1, p0]
```

represents the polynomial

p(x) = p2x^2 + p1x + p0

```swift
// x^2 + 2x + 3
let c1 = [1.0, 2.0, 3.0]
let result: Complex = polyval(coefficients: c1, point: 2)
print(result) 
// 11

// x^2 -3x + 2
let c2 = [1.0, -3.0, 2.0]
let r2 = roots(coefficients: c2)
print(r2)
// [2.0+0.0i, 1.0+0.0i]

let c3 = poly(roots: r2)
print(c3)
// [1.0+0.0i, -3.0+0.0i, 2.0+0.0i]
}
```

[MATLAB - Create and Evaluate Polynomials](https://uk.mathworks.com/help/matlab/math/create-and-evaluate-polynomials.html)
