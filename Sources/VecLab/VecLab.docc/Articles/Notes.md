
# Notes

## Overview

Some notes about MATLAB conventions and differences to Swift.

## Array Indexing Starts at 1

Indexes start at 1 not 0. When porting code be careful to distinguish between indexing loops and value loops. 

- Values often start at zero, for example, t = 0:10. 
- Look for any usage outside an array index.

A tip for changing indexing is to convert your MATLAB code use loop starting from 0 to N-1, and add +1 to each 
index reference. Your code should still work. Remove the all the +1s when using Swift.

## Modulo Function

The `mod` function behaves differently to Swift `%`. Unlike Swift, `mod` is never negative. 
Use it for wrapping phases or buffer indexes. The `rem` remainder function is similar to `%`.

|Feature|% (Swift)| mod (MATLAB)|
|---|---|---|
|Negative dividend |remainder can be negative|remainder always non-negative|
|Range|(-b, b)|(0, b)|
|Use case| low-level remainder|consistent wrapping (angles, cyclic indexing)|

[MATLAB - mod](https://uk.mathworks.com/help/matlab/ref/double.mod.html)

## Filter Coefficients

Filter Coefficients defined by the numerator and denominator coefficients b and a. Parameters are returned in this 
order in tuples.

```swift
let b = [4.2443368140232844e-05, 8.488673628046569e-05, 4.2443368140232844e-05]
let a = [1.0,                   -1.981488509144573,     0.9816582826171341]

let y = filter(b: b, a: a, x: x)
```

Coefficient normalization is done with a0 = 1.

[MATLAB - Filter](https://uk.mathworks.com/help/matlab/ref/filter.html)

## Complex Sort Order

If A is complex, then by default, `sort` sorts the elements by magnitude. If more than one element has equal magnitude, 
then the elements are sorted by phase angle on the interval [−π, π].

- Internally the phase angle is wrapped to [0, 2π] for anticlockwise ordering if the magnitudes are equal.
- Be careful when using unit complex numbers, they may not all be exactly equal to 1.

[MATLAB - sort](https://uk.mathworks.com/help/matlab/ref/double.sort.html)

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
```

[MATLAB - Create and Evaluate Polynomials](https://uk.mathworks.com/help/matlab/math/create-and-evaluate-polynomials.html)

## Power Operator (\*\*) Associativity

The MATLAB power operator `^` is implemented in VecLab as the Swift `**` operator. There is a difference between MATLAB and NumPy.
VecLab uses the MATLAB convention of left associativity. If in doubt, use parentheses.

The precedence is higher than multiplication.

|MATLAB|NumPy|
|-|-|
|2 \*\* 2 \*\* 3 = 64| 2 \*\* 2 \*\* 3 = 256|
|(2 \*\* 2) \*\* 3 = 64| 2 \*\* (2 \*\* 3) = 256|
|associativity: left|associativity: right|

```swift
// Uses Matlab convention: 2**2**3 Matlab = 64, NumPy = 256
precedencegroup PowerPrecedence {
    higherThan: MultiplicationPrecedence
    associativity: left  // Matlab
}
```
