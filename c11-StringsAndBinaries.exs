defmodule MyString do
  def printable?([head | tails]), do: head>31 && head< 127 && printable?(tails)
  def printable?([]), do: true

  def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)

  def calculate(str), do: _calculate([], str)
  defp _calculate(num1, [?+ | num2]), do: to_int(Enum.reverse(num1)) + to_int(num2)
  defp _calculate(num1, [?- | num2]), do: to_int(Enum.reverse(num1)) - to_int(num2)
  defp _calculate(num1, [?* | num2]), do: to_int(Enum.reverse(num1)) * to_int(num2)
  defp _calculate(num1, [?/ | num2]), do: to_int(Enum.reverse(num1)) / to_int(num2)
  defp _calculate(num1, [x | num2]), do: _calculate([x | num1], num2)

  defp to_int(expression), do: _parse_number({ 0, expression })
  defp _parse_number({value, [ digit | rest ] }) when digit in ?0..?9 do
    _parse_number({ value*10 + digit - ?0, rest})
  end
  defp _parse_number({value, []}), do: value
  defp _parse_number({value, [ ?\s | rest ]}), do: _parse_number({value, rest})

end
