//
//  Array+Double+Math+SIMD.swift
//  VecLab
//
//  Created by Marcus Painter on 15/09/2025.
//

@inlinable
public func addSimd4(_ a: [Double], _ b: [Double]) -> [Double] {
    var result = a
    a.withUnsafeBufferPointer { a in
        b.withUnsafeBufferPointer { b in
            result.withUnsafeMutableBufferPointer { result in

                // Define the chunk size based on the SIMD vector type (e.g. SIMD4)
                let chunkSize = 4

                // Process the arrays in chunks
                let remainderStartIndex = a.count - (a.count % chunkSize)

                // Type-cast SIMD vectors for the current chunk
                UnsafeMutableBufferPointer(rebasing: result[0..<remainderStartIndex]).withMemoryRebound(
                    to: SIMD4<Double>.self
                ) { simdResult in
                    UnsafeBufferPointer(rebasing: a[0..<remainderStartIndex]).withMemoryRebound(to: SIMD4<Double>.self)
                    { simdA in
                        UnsafeBufferPointer(rebasing: b[0..<remainderStartIndex]).withMemoryRebound(
                            to: SIMD4<Double>.self
                        ) { simdB in

                            for i in simdResult.indices {
                                // Perform element-wise addition using SIMD
                                // Store the result back into the result array
                                simdResult[i] = simdA[i] + simdB[i]
                            }
                        }
                    }
                }
                // Handle the remainder elements that don't fit into SIMD chunks
                for i in remainderStartIndex..<a.count {
                    result[i] = a[i] + b[i]
                }
            }
        }
    }
    return result
}

// Fastest
@inlinable
func addSimd4(_ a: [Double], _ b: [Double], result: inout [Double]) {
    a.withUnsafeBufferPointer { a in
        b.withUnsafeBufferPointer { b in
            result.withUnsafeMutableBufferPointer { result in

                // Define the chunk size based on the SIMD vector type (e.g. SIMD4)
                let chunkSize = 4

                // Process the arrays in chunks
                let remainderStartIndex = a.count - (a.count % chunkSize)

                // Type-cast SIMD vectors for the current chunk
                UnsafeMutableBufferPointer(rebasing: result[0..<remainderStartIndex]).withMemoryRebound(
                    to: SIMD4<Double>.self
                ) { simdResult in
                    UnsafeBufferPointer(rebasing: a[0..<remainderStartIndex]).withMemoryRebound(to: SIMD4<Double>.self)
                    { simdA in
                        UnsafeBufferPointer(rebasing: b[0..<remainderStartIndex]).withMemoryRebound(
                            to: SIMD4<Double>.self
                        ) { simdB in

                            for i in simdResult.indices {
                                // Perform element-wise addition using SIMD
                                // Store the result back into the result array
                                simdResult[i] = simdA[i] + simdB[i]
                            }
                        }
                    }
                }
                // Handle the remainder elements that don't fit into SIMD chunks
                for i in remainderStartIndex..<a.count {
                    result[i] = a[i] + b[i]
                }
            }
        }
    }
}

@inlinable
public func addSimd4Array(_ a: [Double], _ b: [Double]) -> [Double] {
    return [Double](unsafeUninitializedCapacity: a.count) { result, initializedCount in
        a.withUnsafeBufferPointer { a in
            b.withUnsafeBufferPointer { b in

                // Define the chunk size based on the SIMD vector type (e.g. SIMD4)
                let chunkSize = 4

                // Process the arrays in chunks
                let remainderStartIndex = a.count - (a.count % chunkSize)

                // Type-cast SIMD vectors for the current chunk
                UnsafeMutableBufferPointer(rebasing: result[0..<remainderStartIndex]).withMemoryRebound(
                    to: SIMD4<Double>.self
                ) { simdResult in
                    UnsafeBufferPointer(rebasing: a[0..<remainderStartIndex]).withMemoryRebound(
                        to: SIMD4<Double>.self
                    ) { simdA in
                        UnsafeBufferPointer(rebasing: b[0..<remainderStartIndex]).withMemoryRebound(
                            to: SIMD4<Double>.self
                        ) { simdB in

                            for i in 0..<remainderStartIndex {
                                // Perform element-wise addition using SIMD
                                // Store the result back into the result array
                                simdResult[i] = simdA[i] + simdB[i]
                            }
                        }
                    }
                }
                // Handle the remainder elements that don't fit into SIMD chunks
                for i in remainderStartIndex..<a.count {
                    result[i] = a[i] + b[i]
                }
            }

        }
        initializedCount = a.count
    }
}
