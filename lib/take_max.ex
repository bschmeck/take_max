defmodule TakeMax do
  def take_max(_list, 0, _func), do: []
  def take_max([], _num, _func), do: []

  def take_max(list, num, func) do
    take_max(list, num, [], func)
  end

  defp take_max([], _remaining, keepers, _func), do: keepers
  defp take_max([head | tail], remaining, keepers, func) when remaining > 1 do
    take_max(tail, remaining - 1, [head | keepers], func)
  end

  defp take_max([head | []], remaining, keepers, _func) when remaining > 0, do: [head | keepers]
  defp take_max([head | tail], 1, keepers, func) do
    take_max(tail, 0, Enum.sort_by([head | keepers], func), func)
  end

  defp take_max([head | tail], 0, [min_keeper | rest_keepers] = keepers, func) do
    if func.(head) > func.(min_keeper) do
      keepers = Enum.sort_by([head | rest_keepers], func)
    end
    take_max(tail, 0, keepers, func)
  end
end
