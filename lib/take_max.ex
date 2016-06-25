defmodule TakeMax do
  def take_max(_list, 0, _func), do: []
  def take_max([], _num, _func), do: []

  def take_max(list, num, func) do
    take_max(list, num, [], func)
  end

  defp take_max([], _remaining, keepers, _func), do: keepers
  defp take_max([head | tail], remaining, keepers, func) do
    take_max(tail, remaining - 1, [head | keepers], func)
  end
end
