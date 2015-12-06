defmodule RangeExtras.IntersectionTest do
  use ExUnit.Case, async: true

  test "increasing and increasing" do
    assert RangeExtras.intersection(-1..1, -5..-3) == []
    assert RangeExtras.intersection(-1..1, -4..-2) == []
    assert RangeExtras.intersection(-1..1, -3..-1) == [-1..-1]
    assert RangeExtras.intersection(-1..1, -2.. 0) == [-1.. 0]
    assert RangeExtras.intersection(-1..1, -1.. 1) == [-1.. 1]
    assert RangeExtras.intersection(-1..1,  0.. 2) == [ 0.. 1]
    assert RangeExtras.intersection(-1..1,  1.. 3) == [ 1.. 1]
    assert RangeExtras.intersection(-1..1,  2.. 4) == []
    assert RangeExtras.intersection(-1..1,  3.. 5) == []

    assert RangeExtras.intersection(-2..2, -2..0) == [-2..0]
    assert RangeExtras.intersection(-2..2, -1..1) == [-1..1]
    assert RangeExtras.intersection(-2..2,  0..2) == [ 0..2]

    assert RangeExtras.intersection(-1..1, -1..2) == [-1..1]
    assert RangeExtras.intersection(-1..1, -2..1) == [-1..1]
    assert RangeExtras.intersection(-1..1, -2..2) == [-1..1]
  end

  test "increasing and decreasing" do
    assert RangeExtras.intersection(-1..1, -3..-5) == []
    assert RangeExtras.intersection(-1..1, -2..-4) == []
    assert RangeExtras.intersection(-1..1, -1..-3) == [-1..-1]
    assert RangeExtras.intersection(-1..1,  0..-2) == [-1.. 0]
    assert RangeExtras.intersection(-1..1,  1..-1) == [-1.. 1]
    assert RangeExtras.intersection(-1..1,  2.. 0) == [ 0.. 1]
    assert RangeExtras.intersection(-1..1,  3.. 1) == [ 1.. 1]
    assert RangeExtras.intersection(-1..1,  4.. 2) == []
    assert RangeExtras.intersection(-1..1,  5.. 3) == []

    assert RangeExtras.intersection(-2..2, 0..-2) == [-2..0]
    assert RangeExtras.intersection(-2..2, 1..-1) == [-1..1]
    assert RangeExtras.intersection(-2..2, 2.. 0) == [ 0..2]

    assert RangeExtras.intersection(-1..1, 2..-1) == [-1..1]
    assert RangeExtras.intersection(-1..1, 1..-2) == [-1..1]
    assert RangeExtras.intersection(-1..1, 2..-2) == [-1..1]
  end

  test "decreasing and increasing" do
    assert RangeExtras.intersection(1..-1, -5..-3) == []
    assert RangeExtras.intersection(1..-1, -4..-2) == []
    assert RangeExtras.intersection(1..-1, -3..-1) == [-1..-1]
    assert RangeExtras.intersection(1..-1, -2.. 0) == [ 0..-1]
    assert RangeExtras.intersection(1..-1, -1.. 1) == [ 1..-1]
    assert RangeExtras.intersection(1..-1,  0.. 2) == [ 1.. 0]
    assert RangeExtras.intersection(1..-1,  1.. 3) == [ 1.. 1]
    assert RangeExtras.intersection(1..-1,  2.. 4) == []
    assert RangeExtras.intersection(1..-1,  3.. 5) == []

    assert RangeExtras.intersection(2..-2, -2..0) == [0..-2]
    assert RangeExtras.intersection(2..-2, -1..1) == [1..-1]
    assert RangeExtras.intersection(2..-2,  0..2) == [2.. 0]

    assert RangeExtras.intersection(1..-1, -1..2) == [1..-1]
    assert RangeExtras.intersection(1..-1, -2..1) == [1..-1]
    assert RangeExtras.intersection(1..-1, -2..2) == [1..-1]
  end

  test "decreasing and decreasing" do
    assert RangeExtras.intersection(1..-1, -3..-5) == []
    assert RangeExtras.intersection(1..-1, -2..-4) == []
    assert RangeExtras.intersection(1..-1, -1..-3) == [-1..-1]
    assert RangeExtras.intersection(1..-1,  0..-2) == [ 0..-1]
    assert RangeExtras.intersection(1..-1,  1..-1) == [ 1..-1]
    assert RangeExtras.intersection(1..-1,  2.. 0) == [ 1.. 0]
    assert RangeExtras.intersection(1..-1,  3.. 1) == [ 1.. 1]
    assert RangeExtras.intersection(1..-1,  4.. 2) == []
    assert RangeExtras.intersection(1..-1,  5.. 3) == []

    assert RangeExtras.intersection(2..-2, 0..-2) == [0..-2]
    assert RangeExtras.intersection(2..-2, 1..-1) == [1..-1]
    assert RangeExtras.intersection(2..-2, 2.. 0) == [2.. 0]

    assert RangeExtras.intersection(1..-1, 2..-1) == [1..-1]
    assert RangeExtras.intersection(1..-1, 1..-2) == [1..-1]
    assert RangeExtras.intersection(1..-1, 2..-2) == [1..-1]
  end
end
