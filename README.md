# RangeExtras

**Elixir range utilities: constant-time random sampling and set operations.**

## Installation

Add `range_extras` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:range_extras, "~> 0.1.0"}]
end
```

Run `mix deps.get`.

## Set operations

- `union/2`
- `difference/2`
- `intersection/2`

These functions take two ranges and return a list of zero to two ranges:

```elixir
iex> RangeExtras.union(1..4, 3..5)
[1..5]

iex> RangeExtras.difference(8..1, 4..4)
[8..5, 3..1]

iex> RangeExtras.intersection(8..1, -4..0)
[]
```

They’re implemented as simple `cond` clauses that match on the start and end
values of the ranges, so they run in constant time.

Ranges are always inclusive.

The direction of the resulting ranges is the same as the direction of the first
given range:

```elixir
iex> RangeExtras.union(1..4, 3..5)
[1..5]

iex> RangeExtras.union(4..1, 3..5)
[5..1]
```

## Random sampling

- `random/1`

Works in the same way as `Enum.random/1`, but runs in constant time as well
since it only uses the start and end values of the range.

The implementation uses Erlang’s `:rand` module. You don’t need to seed the
generator like you have to currently do with `Enum.random/1` that uses
`:random` instead.

(The development version of Elixir now uses `:rand`.)

## Licence

> ISC License (ISC)
>
> Copyright © 2015 Leo Nikkilä
>
> Permission to use, copy, modify, and/or distribute this software for any
> purpose with or without fee is hereby granted, provided that the above 
> copyright notice and this permission notice appear in all copies.
>
> THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
> REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
> AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
> INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
> LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
> OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> PERFORMANCE OF THIS SOFTWARE.
