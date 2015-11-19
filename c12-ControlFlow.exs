defmodule ControlFlow do
  def upto(n) do
    1..n |> Enum.map(&fizzbuzz/1)
  end
  defp fizzbuzz(n) do
    case {rem(n, 3), rem(n, 5)} do
      {0, 0} -> "FizzBuzz"
      {0, _} -> "Fizz"
      {_, 0} -> "Buzz"
      _      -> n
    end
  end
  
  def ok!({:ok, data}), do: data
  def ok!({:error, message}), do: raise message
  def ok!(_), do: raise RuntimeError
end
