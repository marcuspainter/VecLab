import VecLab
import Testing

struct SubtractTestsNew {

    @Test func testSubtractReal() {
        let a: RealArray = [1.0, 2.0, 3.0]
        let b: RealArray = [3.0, 2.0, 1.0]
        let result = a - b
        #expect(result == [-2.0, 0.0, 2.0], "Real subtraction failed")
    }

    @Test func testSubtractRealRealArray() {
        let a: Real = 2.0
        let b: RealArray = [1.0, 2.0, 3.0]
        let result = a - b
        #expect(result == [1.0, 0.0, -1.0], "Real and real array subtraction failed")
    }

    @Test func testSubtractComplex() {
        let a: Complex = (1.0, 2.0)
        let b: Complex = (2.0, 3.0)
        let result = a - b
        #expect(result == (-1.0, -1.0), "Complex subtraction failed")
    }

    @Test func testSubtractComplexReal() {
        let a: Complex = (1.0, 2.0)
        let b: Real = 3.0
        let result = a - b
        #expect(result == (-2.0, 2.0), "Complex and real subtraction failed")
    }

    @Test func testSubtractRealComplex() {
        let a: Real = 3.0
        let b: Complex = (1.0, 2.0)
        let result = a - b
        #expect(result == (2.0, -2.0), "Real and complex subtraction failed")
    }

    @Test func testSubtractComplexArray() {
        let a: ComplexArray = ([1.0, 2.0], [2.0, 3.0])
        let b: ComplexArray = ([2.0, 3.0], [3.0, 4.0])
        let result = a - b
        #expect(result == ([-1.0, -1.0], [-1.0, -1.0]), "Complex array subtraction failed")
    }

    @Test func testSubtractComplexComplexArray() {
        let a: Complex = (1.0, 2.0)
        let b: ComplexArray = ([2.0, 3.0], [3.0, 4.0])
        let result = a - b
        #expect(result == ([1.0, 2.0], [1.0, 2.0]), "Complex and complex array subtraction failed")
    }

    @Test func testSubtractRealArrayComplexArray() {
        let a: RealArray = [1.0, 2.0]
        let b: ComplexArray = ([2.0, 3.0], [3.0, 4.0])
        let result = a - b
        #expect(result == ([1.0, 1.0], [3.0, 4.0]), "Real array and complex array subtraction failed")
    }

    @Test func testSubtractRealArrayComplex() {
        let a: RealArray = [1.0, 2.0]
        let b: Complex = (2.0, 3.0)
        let result = a - b
        #expect(result == ([-1.0, 0.0], [-3.0, -3.0]), "Real array and complex subtraction failed")
    }

    @Test func testSubtractComplexArrayReal() {
        let a: ComplexArray = ([1.0, 2.0], [2.0, 3.0])
        let b: Real = 2.0
        let result = a - b
        #expect(result == ([-1.0, 0.0], [2.0, 3.0]), "Complex array and real subtraction failed")
    }

    @Test func testSubtractRealComplexArray() {
        let a: Real = 2.0
        let b: ComplexArray = ([1.0, 2.0], [2.0, 3.0])
        let result = a - b
        #expect(result == ([1.0, 0.0], [2.0, 3.0]), "Real and complex array subtraction failed")
    }

    @Test func testSubtractComplexRealArray() {
        let a: Complex = (1.0, 2.0)
        let b: RealArray = [1.0, 2.0]
        let result = a - b
        #expect(result == ([0.0, -1.0], [2.0, 2.0]), "Complex and real array subtraction failed")
    }
}
