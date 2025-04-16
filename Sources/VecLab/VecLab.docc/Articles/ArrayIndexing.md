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
