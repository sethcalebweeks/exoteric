defmodule Exoteric do
  @doc """
  Prints a variable along with a label of the same text using IO.inspect

  ## Examples

      iex> hello = "Hello, World!"
      ...> Exoteric.log(hello)
      \"""
      hello: "Hello, World!"
      \"""

  """
  @spec log(any) :: any
  defmacro log({label, _, _} = val) do
    quote do
      IO.inspect(unquote(val), label: unquote(label))
    end
  end

  defmacro defmulti({name, _, _}, [do: block]) do
    {:__block__, [], [
      Enum.map(block, fn
        {:->, _, [params, body]} ->
          {:def, [context: __MODULE__], [
            {name, [context: __MODULE__], params},
            [do: body]
          ]}
      end)
    ]}
  end

  @doc """
  Defines a function of the given name with multiple case clauses.
  """
  defmacro defcase({name, _, _}, [do: block]) do
    {:def, [context: __MODULE__], [
      {name, [context: __MODULE__], [{:input, [], nil}]},
      [do: {:case, [], [
        {:input, [], nil},
        [do: block]
      ]}]
    ]}
  end

  defmacro defcond({name, meta, params}, block) do
    {:def, [context: __MODULE__], [
      {name, [context: __MODULE__], params},
      [do: {:cond, meta, [block]}]
    ]}
  end

  defmacro {:\\, _, [predicate, true_]} \\ false_ do
    quote do
      if unquote(predicate), do: unquote(true_), else: unquote(false_)
    end
  end

  defmacro destructure_map(map, do: {:__block__, _, block}) do
    Enum.map(block, fn {:<-, _, [identifier, key]} ->
      quote do
        var!(unquote(identifier)) = Map.get(unquote(map), unquote(key))
      end
    end)
  end

end
