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
    
end
