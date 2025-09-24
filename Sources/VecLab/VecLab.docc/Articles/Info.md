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

### Warning: Adding New DocC Articles

Always create a new file from Article template. Do not create a new file and rename the file extension 
from .swift to .md.
Function will appear as global undocumented as well as under the article.

