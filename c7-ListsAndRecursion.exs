defmodule MyList do

  def sum([]), do: 0
  def sum([head|tail]), do: head+sum(tail)

  def mapsum([],func), do: 0
  def mapsum([head|tail],func), do: func.(head)+mapsum(tail,func)

  def max([x]), do: x
  def max([head|tail]), do: Kernel.max(head,max(tail))

  def _map([head|tail],func), do: [func.(head)|_map(tail,func)] 

  def caesar([],n), do: []
  def caesar([head|tail],n)
    when head+n <= ?z,
    do: [head+n | caesar(tail,n)]

  def caesar([head|tail],n),
    do: [head+n-26 | caesar(tail,n)]

  def span(from,to) when from < to,
    do: [from| span(from+1,to)]
  def span(to,to),
    do: [to]
  
  def all?([],func), do: true
  def all?([head|tail],func), do:
    func.(head) && all?(tail,func)        

  def each([],_func), do: [] 
  def each([head|tail],func), do:
    [func.(head) | each(tail,func)]

  def filter([],_func), do: []
  def filter([head|tail],func) do
    if func.(head) do
      [head|filter(tail,func)]
    else
      filter( tail , func )
    end
  end
  
  def take([],n), do: []
  def take(_,n) when n <= 0, do: []
  def take([ head| tail], n), do: [ head| take( tail, n-1)]

  def rest([],n), do: []
  def rest( list, n) when n<=0, do: list
  def rest([head | tail], n), do: rest( tail, n-1)


  def split(list, n), do: {take(list, n), rest( list, n)}
  
  def flatten(list), do: _flatten(list,[])

  defp _flatten([],result), do: Enum.reverse(result)
  defp _flatten([[head | []] | tail ], result), do: _flatten([ head | tail ], result)
  defp _flatten([[head | tail ] | other], result), do: _flatten([head, tail | other], result)
  defp _flatten([head | tail], result), do: _flatten(tail, [head | result])

end
