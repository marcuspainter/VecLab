//
//  ComplexDouble+Properties.swift
//  VecLab
//
//  Created by Marcus Painter on 18/04/2025.
//

extension ComplexDouble {
    // MARK: - Special value properties

     /// Returns true if either component is NaN
     public var isNaN: Bool {
         return real.isNaN || imag.isNaN
     }

     /// Returns true if either component is infinite
    public var isInfinite: Bool {
         return real.isInfinite || imag.isInfinite
     }

     /// Returns true if both components are finite
    public var isFinite: Bool {
         return real.isFinite && imag.isFinite
     }

     /// Returns true if both components are zero
    public var isZero: Bool {
         return real == 0.0 && imag == 0.0
     }

     /// Returns true if either component is subnormal
    public var isSubnormal: Bool {
         return real.isSubnormal || imag.isSubnormal
     }

     /// Returns true if both components are normal
    public var isNormal: Bool {
         return real.isNormal && imag.isNormal
     }

     /// Returns true if either component is signaling NaN
    public var isSignalingNaN: Bool {
         return real.isSignalingNaN || imag.isSignalingNaN
     }

     // MARK: - Static special values

     /// Complex zero value (0 + 0i)
    public static var zero: Complex {
         return Complex(.zero, .zero)
     }

     /// Complex NaN value (NaN + NaNi)
    public static var nan: Complex {
         return Complex(.nan, .nan)
     }

     /// Positive infinity (∞ + ∞i)
    public  static var infinity: Complex {
         return Complex(.infinity, .infinity)
     }

     /// The imaginary unit (0 + 1i)
    public static var i: Complex {
         return Complex(.zero, 1.0)
     }
}
