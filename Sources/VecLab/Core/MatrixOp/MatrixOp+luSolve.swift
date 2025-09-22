//
//  luSolve.swift
//  
//
//  Created by Marcus Painter on 13/09/2023.
//

import Foundation

extension MatrixOp {
    
    static func luSolve(a: [Double], b: [Double], rows: Int, columns: Int) -> [Double] {
        guard rows == columns else {
            fatalError("Matrix must be square for LU decomposition-based solving.")
        }
        
        // 1. LU Decomposition
        let (L, U, ipiv) = MatrixOp.luDecomposition(a: a, rows: rows, columns: columns)
        
        // 2. Apply pivots to b
        let adjustedB = applyPivots(b, pivots: ipiv)
        
        // 3. Forward substitution
        var y = [Double](repeating: 0.0, count: rows)
        for i in 0..<rows {
            var sum = 0.0
            for j in 0..<i {
                sum += L[i + j * rows] * y[j]
            }
            y[i] = (adjustedB[i] - sum) / L[i + i * rows]
        }
        
        // 4. Backward substitution
        var x = [Double](repeating: 0.0, count: rows)
        for i in (0..<rows).reversed() {
            var sum = 0.0
            for j in (i+1)..<rows {
                sum += U[i + j * rows] * x[j]
            }
            x[i] = (y[i] - sum) / U[i + i * rows]
        }
        
        return x
    }
    
    static func applyPivots(_ vector: [Double], pivots: [Int]) -> [Double] {
        var result = vector
        for i in 0..<pivots.count {
            let pivot = Int(pivots[i]) - 1  // LAPACK indices are 1-based
            if pivot != i {
                result.swapAt(i, pivot)
            }
        }
        return result
    }
}

/*
 /*
  Compile and excute with:
     $ gcc det.c -o det -llapacke
     $ ./det
 */

 #include <stdio.h>
 #include <stdlib.h>
 #include <lapacke.h>
 #define dim 3

 int main() {
     int n = dim;
     int lda = n;

     printf("Initial matrix:\n");
     double A[dim*dim] = { 3.0, -1.0,  2.0,
                          -3.0,  3.0, -1.0,
                           6.0,  0.0,  4.0 };
     int ipiv[dim];
     int info;

     // Print matrix A
     for (int i = 0; i < n; i++) {
         printf("  [");
         for (int j = 0; j < n; j++) {
             printf("%f", A[i * n + j]);
             if (j < n - 1) printf(", ");
         }
         printf("]");
         if (i < n - 1) printf(",\n");
     }

     // Perform LU-decomposition to get ipiv values
     info = LAPACKE_dgetrf(LAPACK_ROW_MAJOR, n, n, A, lda, ipiv);
     if (info < 0) {
         printf("\nError: Argument %d had an illegal value\n", -info);
         return -1;
     } else if (info > 0) {
         printf("\nError: Matrix is singular\n");
         return -1;
     }

     // Calculate the determinant
     double determinant = 1.0;
     for (int i = 0; i < n; i++) {
         determinant *= A[i * n + i];
     }
     int sign = 1;
     for (int i = 0; i < n; i++) {
         if (ipiv[i] != i + 1) {
             sign = -sign;
         }
     }
     determinant *= sign;

     // Print the result
     printf("\nDeterminant: %lf\n", determinant);

     return 0;
 }
 
 */
