//
//  ArraySubscriptable.swift
//  VecLab
//
//  Created by Marcus Painter on 24/09/2025.
//

/*
public protocol ArraySubscriptable: MutableCollection, RangeReplaceableCollection
where Index == Int {
    subscript(indices: [Int]) -> [Element] { get set }
    func helloArraySubscriptable()
}
public protocol ArraySubscriptableElement { }

// Notes:
// where Element == SomeProtocol → Element must be the protocol type itself
// where Element: SomeProtocol → Element must conform to the protocol
extension Array: ArraySubscriptable where Element: ArraySubscriptableElement { }

fileprivate func test() {
    
    let a = [Double](repeating: 0.0, count: 10)
    let idx: [Int] = [1, 2 ,3]
    let b = a[idx]
    print(b)
}

extension ArraySubscriptable {
    
    public func helloArraySubscriptable() {
        print("Hello, World!")
    }
    
    /// Access elements using an array of indices
    public subscript(indices: [Int]) -> [Element] {
        get {
            // Verify all indices are in bounds
            for idx in indices {
                precondition(indices.contains(idx), "Index \(idx) out of range")
            }
            return indices.map { self[$0] }
        }
        set {
            // Verify all indices are in bounds
            for idx in indices {
                precondition(idx >= 0 && idx < count, "Index \(idx) out of range")
            }

            precondition(
                indices.count == newValue.count,
                "Replacement array must have the same count as the indices array"
            )

            for (offset, idx) in indices.enumerated() {
                self[idx] = newValue[offset]
            }
        }
    }
}

*/
