defmodule RangeExtras do
  @moduledoc """
  Range utilities: random sampling and O(1) set operations.
  """

  @doc """
  Takes a uniformly distributed pseudo-random integer from a range.

  The implementation uses Erlang’s `:rand` module.
  """
  @spec random(Range.t) :: integer
  def random(a..b) do
    min = min(a, b)
    max = max(a, b)

    min + round(:rand.uniform * (max - min))
  end

  @doc """
  Returns the union of the two ranges.

  The result is a list with one or two ranges.

  The direction of the resulting ranges is the same as the direction of the
  first range.

  ## Examples

      iex> RangeExtras.union(1..4, 3..5)
      [1..5]

      iex> RangeExtras.union(4..1, 3..5)
      [5..1]

      iex> RangeExtras.union(4..1, 7..9)
      [9..7, 4..1]
  """
  @spec union(Range.t, Range.t) :: [Range.t, ...]
  def union(a..b, c..d) when a <= b and c <= d do
    cond do
      b < (c - 1)       -> [a..b, c..d]
      d < (a - 1)       -> [c..d, a..b]
      c <= a and b <= d -> [c..d]
      a <  c and b <= d -> [a..d]
      c <= a and d <  b -> [c..b]
      a <  c and d <  b -> [a..b]
    end
  end

  def union(a..b, c..d) when a > b do
    union(b..a, c..d) |> reverse
  end

  def union(a..b, c..d) when c > d do
    union(a..b, d..c)
  end

  @doc """
  Returns the set difference of the two ranges.

  The result is a list with zero, one, or two ranges.

  The direction of the resulting ranges is the same as the direction of the
  first range.

  ## Examples

      iex> RangeExtras.difference(1..4, 1..4)
      []

      iex> RangeExtras.difference(1..4, 3..5)
      [1..2]

      iex> RangeExtras.difference(4..1, 3..5)
      [2..1]

      iex> RangeExtras.difference(8..1, 4..4)
      [8..5, 3..1]
  """
  @spec difference(Range.t, Range.t) :: [Range.t]
  def difference(a..b, c..d) when a <= b and c <= d do
    cond do
      b <  c or  d <  a -> [a..b]
      c <= a and b <= d -> []
      a <  c and b <= d -> [a..(c - 1)]
      c <= a and d <  b -> [(d + 1)..b]
      a <  c and d <  b -> [a..(c - 1), (d + 1)..b]
    end
  end

  def difference(a..b, c..d) when a > b do
    difference(b..a, c..d) |> reverse
  end

  def difference(a..b, c..d) when c > d do
    difference(a..b, d..c)
  end

  @doc """
  Returns the intersection of the two ranges.

  The result is a list with zero or one ranges.

  The direction of the resulting range is the same as the direction of the
  first range.

  ## Examples

      iex> RangeExtras.intersection(1..4, 1..4)
      [1..4]

      iex> RangeExtras.intersection(1..4, 3..5)
      [3..4]

      iex> RangeExtras.intersection(4..1, 3..5)
      [4..3]

      iex> RangeExtras.intersection(8..1, -4..0)
      []
  """
  @spec intersection(Range.t, Range.t) :: [Range.t]
  def intersection(a..b, c..d) when a <= b and c <= d do
    cond do
      b <  c or  d <  a -> []
      c <= a and b <= d -> [a..b]
      a <  c and b <= d -> [c..b]
      c <= a and d <  b -> [a..d]
      a <  c and d <  b -> [c..d]
    end
  end

  def intersection(a..b, c..d) when a > b do
    intersection(b..a, c..d) |> reverse
  end

  def intersection(a..b, c..d) when c > d do
    intersection(a..b, d..c)
  end

  defp reverse(ranges) do
    case ranges do
      []           -> []
      [a..b]       -> [b..a]
      [a..b, c..d] -> [d..c, b..a]
    end
  end
end
