defmodule Test do
  @moduledoc false

  import Exoteric

  defcase fib do
    0 -> 1
    1 -> 1
    n -> fib(n - 1) + fib(n - 2)
  end

  defcond fizzbuzz(n) do
    rem(n, 15) == 0 -> "FizzBuzz"
    rem(n, 5) == 0 -> "Buzz"
    rem(n, 3) == 0 -> "Fizz"
    n -> n
  end

  defmulti fib_tail_rec do
    n -> fib_tail_rec(n, 1, 1)
    0, a, _ -> a
    n, a, b -> fib_tail_rec(n - 1, b, a + b)
  end

  def even_or_odd(n) do
    rem(n, 2) == 0 \\ "even" \\ "odd"
  end

end
