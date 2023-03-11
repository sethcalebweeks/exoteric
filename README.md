A random collection of questionably useful Elixir tools.

## `log` macro

```elixir
hello = "Hello, World"
log(hello)
```

Logs:

```elixir
hello: "Hello, World"
```

## `defcase` macro

```elixir
defcase fib do
  0 -> 1
  1 -> 1
  n -> fib(n - 1) + fib(n - 2)
end
```

Expands to:

```elixir
def fib(input) do
  case input do
    0 -> 1
    1 -> 1
    n -> fib(n - 1) + fib(n - 2)
  end
end
```

## `defcond` macro

```elixir
defcond fizzbuzz(n) do
  rem(n, 15) == 0 -> "FizzBuzz"
  rem(n, 5) == 0 -> "Buzz"
  rem(n, 3) == 0 -> "Fizz"
  n -> n
end
```

Expands to:

```elixir
def fizzbuzz(n) do
  cond do
    rem(n, 15) == 0 -> "FizzBuzz"
    rem(n, 5) == 0 -> "Buzz"
    rem(n, 3) == 0 -> "Fizz"
    n -> n
  end
end
```

## `defmulti` macro

```elixir
defmulti fib_tail_rec do
  n -> fib_tail_rec(n, 1, 1)
  0, a, _ -> a
  n, a, b -> fib_tail_rec(n - 1, b, a + b)
end
```

Expands to:

```elixir
def fib_tail_rec(n), do: fib_tail_rec(n, 1, 1)
def fib_tail_rec(0, a, _), do: a
def fib_tail_rec(n, a, b), do: fib_tail_rec(n - 1, b, a + b)
```

## Map destructuring

```elixir
destructure_map map do
  string_key <- "string_key"
  atom_key <- :atom_key
  tuple_key <- {1, 2}
  map_key <- %{key: "value"}
  missing_key <- :does_not_exist
end
```

Expands to:

```elixir
string_key = Map.get(map, "string_key")
atom_key = Map.get(map, :atom_key)
tuple_key = Map.get(map, {1, 2})
map_key = Map.get(map, %{key: "value"})
missing_key = Map.get(map, :does_not_exist)
```

## Ternary operator `\\`

```elixir
rem(n, 2) == 0 \\ "even" \\ "odd"
```

Expands to:

```elixir
if rem(n, 2) == 0, do: "even", else: "odd"
```
