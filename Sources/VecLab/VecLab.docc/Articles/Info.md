# Info

## Array Indexing

### Row Major
```swift
index = row * number_of_columns + column
```

### Column Major
```swift
index = column * number_of_rows + row
```
## Notes

### Hypot for Magnitude

Use `hypot` instead of `sqrt(x*x + y*y)`. Better accuracy.
