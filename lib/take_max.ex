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

  defp take_max([head | tail], 0, keepers, func) do
    [min_keeper | rest_keepers] = Enum.sort_by(keepers, func)
    if func.(head) > func.(min_keeper) do
      keepers = [head | rest_keepers]
    end
    take_max(tail, 0, keepers, func)
  end
end
