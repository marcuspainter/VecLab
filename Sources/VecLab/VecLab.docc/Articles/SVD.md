# SVD

Singular Value Decomposition

- U = m x m
- S = m x n
- V = n x n

## Overview

### MATLAB
- Returns V, not transpose.
- S is a diagonal matrix, not vector.

```
[u,s,v] = svd(A)
```
### LAPACK
- Returns VT, transpose of V.
- S is a column vector

```
[u,s,vt] = svd(A)
```


