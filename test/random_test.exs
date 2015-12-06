defmodule RangeExtras.RandomTest do
  use ExUnit.Case, async: true

  test "increasing ranges" do
    range = -1..5
    number = RangeExtras.random(range)

    assert Enum.member?(range, number)
  end

  test "decreasing ranges" do
    range = 5..-1
    number = RangeExtras.random(range)

    assert Enum.member?(range, number)
  end

  test "single-value ranges" do
    assert RangeExtras.random(1..1) == 1
  end

  test "uniform distribution" do
    count = 25_000
    sum = fn -> RangeExtras.random(0..1) end
           |> Stream.repeatedly
           |> Stream.take(count)
           |> Enum.sum

    assert_in_delta sum / count, 0.5, 0.1
  end
end
