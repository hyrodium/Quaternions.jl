using Test

test_associative(x, y, z, ⊗) = @test (x ⊗ y) ⊗ z ≈ x ⊗ (y ⊗ z)

test_commutative(x, y, ⊗) = @test x ⊗ y ≈ y ⊗ x

function test_inverse(x, eins, ⊗, inv)
    @test x ⊗ inv(x) ≈ eins
    @test inv(x) ⊗ x ≈ eins
end

function test_neutral(x, eins, ⊗)
    @test x ⊗ eins ≈ x
    @test eins ⊗ x ≈ x
end

function test_monoid(x, y, z, ⊗, eins)
    test_associative(x, y, z, ⊗)
    test_neutral(x, eins, ⊗)
    return nothing
end

function test_group(x, y, z, ⊗, eins, inv)
    test_monoid(x, y, z, ⊗, eins)
    test_inverse(x, eins, ⊗, inv)
    return nothing
end

test_multiplicative(x, y, ⊗, f) = @test f(x ⊗ y) ≈ f(x) ⊗ f(y)

complex_to_quat(c::Complex) = Quaternion(c.re, c.im, 0, 0)
complex_to_quat(a::Real) = Quaternion(a, 0, 0, 0)

complex_to_octo(c::Quaternion) = Octonion(c.s, c.v1, c.v2, c.v3, 0, 0, 0, 0)
complex_to_octo(c::Complex) = Octonion(c.re, c.im, 0, 0, 0, 0, 0, 0)
complex_to_octo(a::Real) = Octonion(a, 0, 0, 0, 0, 0, 0, 0)
