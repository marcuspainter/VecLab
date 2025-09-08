# Coding Standard

## Overview

A few coding notes.

### Comments and Periods

```swift
/// Clip data to range.
/// - Parameters:
///   - x: Input number.
///   - lower: Lower bound.
///   - upper: Upper bound.
/// - Returns: Clipped data.
public func clip(_ x: Real, lower: Real, upper: Real) -> Real {
    if x < lower {
        return lower
    } else if x < upper {
        return upper
    }
    return x
}
```

### Error Messages

### Assertions and Preconditions
