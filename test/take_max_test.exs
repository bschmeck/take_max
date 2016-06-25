defmodule TakeMaxTest do
  use ExUnit.Case
  doctest TakeMax

  test "taking 0 elements returns an empty list" do
    assert TakeMax.take_max([1,2,3], 0, &(&1)) == []
  end

  test "taking from an empty list returns an empty list" do
    assert TakeMax.take_max([], 5, &(&1)) == []
  end

  test "taking more elements than are in the list returns everything in the list" do
    source = [1, 2, 3]
    taken = TakeMax.take_max(source, 20, &(&1))
    assert Enum.sort(source) == Enum.sort(taken)
  end

  test "it returns the N largest elements in the list" do
    # Use large numbers so that Elixir doesn't think it's a list of characters
    source = [500, 700, 800, 100, 400, 900]
    taken = TakeMax.take_max(source, 3, &(&1))
    assert Enum.sort(taken) == [700, 800, 900]
  end
end
