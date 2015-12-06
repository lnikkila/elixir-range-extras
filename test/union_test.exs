defmodule RangeExtras.UnionTest do
  use ExUnit.Case, async: true

  test "increasing and increasing" do
    assert RangeExtras.union(-1..1, -5..-3) == [-5..-3, -1..1]
    assert RangeExtras.union(-1..1, -4..-2) == [-4..1]
    assert RangeExtras.union(-1..1, -3..-1) == [-3..1]
    assert RangeExtras.union(-1..1, -2.. 0) == [-2..1]
    assert RangeExtras.union(-1..1, -1.. 1) == [-1..1]
    assert RangeExtras.union(-1..1,  0.. 2) == [-1..2]
    assert RangeExtras.union(-1..1,  1.. 3) == [-1..3]
    assert RangeExtras.union(-1..1,  2.. 4) == [-1..4]
    assert RangeExtras.union(-1..1,  3.. 5) == [-1..1, 3..5]

    assert RangeExtras.union(-2..2, -2..0) == [-2..2]
    assert RangeExtras.union(-2..2, -1..1) == [-2..2]
    assert RangeExtras.union(-2..2,  0..2) == [-2..2]

    assert RangeExtras.union(-1..1, -1..2) == [-1..2]
    assert RangeExtras.union(-1..1, -2..1) == [-2..1]
    assert RangeExtras.union(-1..1, -2..2) == [-2..2]
  end

  test "increasing and decreasing" do
    assert RangeExtras.union(-1..1, -3..-5) == [-5..-3, -1..1]
    assert RangeExtras.union(-1..1, -2..-4) == [-4..1]
    assert RangeExtras.union(-1..1, -1..-3) == [-3..1]
    assert RangeExtras.union(-1..1,  0..-2) == [-2..1]
    assert RangeExtras.union(-1..1,  1..-1) == [-1..1]
    assert RangeExtras.union(-1..1,  2.. 0) == [-1..2]
    assert RangeExtras.union(-1..1,  3.. 1) == [-1..3]
    assert RangeExtras.union(-1..1,  4.. 2) == [-1..4]
    assert RangeExtras.union(-1..1,  5.. 3) == [-1..1, 3..5]

    assert RangeExtras.union(-2..2, 0..-2) == [-2..2]
    assert RangeExtras.union(-2..2, 1..-1) == [-2..2]
    assert RangeExtras.union(-2..2, 2.. 0) == [-2..2]

    assert RangeExtras.union(-1..1, 2..-1) == [-1..2]
    assert RangeExtras.union(-1..1, 1..-2) == [-2..1]
    assert RangeExtras.union(-1..1, 2..-2) == [-2..2]
  end

  test "decreasing and increasing" do
    assert RangeExtras.union(1..-1, -5..-3) == [1..-1, -3..-5]
    assert RangeExtras.union(1..-1, -4..-2) == [1..-4]
    assert RangeExtras.union(1..-1, -3..-1) == [1..-3]
    assert RangeExtras.union(1..-1, -2.. 0) == [1..-2]
    assert RangeExtras.union(1..-1, -1.. 1) == [1..-1]
    assert RangeExtras.union(1..-1,  0.. 2) == [2..-1]
    assert RangeExtras.union(1..-1,  1.. 3) == [3..-1]
    assert RangeExtras.union(1..-1,  2.. 4) == [4..-1]
    assert RangeExtras.union(1..-1,  3.. 5) == [5..3, 1..-1]

    assert RangeExtras.union(2..-2, -2..0) == [2..-2]
    assert RangeExtras.union(2..-2, -1..1) == [2..-2]
    assert RangeExtras.union(2..-2,  0..2) == [2..-2]

    assert RangeExtras.union(1..-1, -1..2) == [2..-1]
    assert RangeExtras.union(1..-1, -2..1) == [1..-2]
    assert RangeExtras.union(1..-1, -2..2) == [2..-2]
  end

  test "decreasing and decreasing" do
    assert RangeExtras.union(1..-1, -3..-5) == [1..-1, -3..-5]
    assert RangeExtras.union(1..-1, -2..-4) == [1..-4]
    assert RangeExtras.union(1..-1, -1..-3) == [1..-3]
    assert RangeExtras.union(1..-1,  0..-2) == [1..-2]
    assert RangeExtras.union(1..-1,  1..-1) == [1..-1]
    assert RangeExtras.union(1..-1,  2.. 0) == [2..-1]
    assert RangeExtras.union(1..-1,  3.. 1) == [3..-1]
    assert RangeExtras.union(1..-1,  4.. 2) == [4..-1]
    assert RangeExtras.union(1..-1,  5.. 3) == [5..3, 1..-1]

    assert RangeExtras.union(2..-2, 0..-2) == [2..-2]
    assert RangeExtras.union(2..-2, 1..-1) == [2..-2]
    assert RangeExtras.union(2..-2, 2.. 0) == [2..-2]

    assert RangeExtras.union(1..-1, 2..-1) == [2..-1]
    assert RangeExtras.union(1..-1, 1..-2) == [1..-2]
    assert RangeExtras.union(1..-1, 2..-2) == [2..-2]
  end
end
