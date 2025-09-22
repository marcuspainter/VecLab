//
//  Complex+Properties.swift
//  VecLab
//
//  Created by Marcus Painter on 18/04/2025.
//

extension Complex {

    // MARK: - Special value properties

    /// Returns true if either component is NaN.
    @inlinable
    public var isNaN: Bool {
        return real.isNaN || imag.isNaN
    }

    /// Returns true if either component is infinite.
    @inlinable
    public var isInfinite: Bool {
        return real.isInfinite || imag.isInfinite
    }

    /// Returns true if both components are finite.
    @inlinable
    public var isFinite: Bool {
        return real.isFinite && imag.isFinite
    }

    /// Returns true if both components are zero.
    @inlinable
    public var isZero: Bool {
        return real == 0.0 && imag == 0.0
    }

    /// Returns true if either component is subnormal.
    @inlinable
    public var isSubnormal: Bool {
        return real.isSubnormal || imag.isSubnormal
    }

    /// Returns true if both components are normal.
    @inlinable
    public var isNormal: Bool {
        return real.isNormal && imag.isNormal
    }

    /// Returns true if either component is signaling NaN.
    @inlinable
    public var isSignalingNaN: Bool {
        return real.isSignalingNaN || imag.isSignalingNaN
    }

    // MARK: - Static special values

    /// Complex NaN value (NaN + NaNi).
    @inlinable
    public static var nan: Complex {
        return Complex(.nan, .nan)
    }

    /// Positive infinity (∞ + ∞i).
    @inlinable
    public static var infinity: Complex {
        return Complex(.infinity, .infinity)
    }

    /// The imaginary unit (0 + 1i).
    @inlinable
    public static var i: Complex {
        return Complex(.zero, 1.0)
    }

    /// The imaginary unit (0 + 1j).
    @inlinable
    public static var j: Complex {
        return Complex(.zero, 1.0)
    }

}
