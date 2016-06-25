defmodule TakeMaxTest do
  use ExUnit.Case
  doctest TakeMax

  test "taking 0 elements returns an empty list" do
    assert TakeMax.take_max([1,2,3], 0, &(&1)) == []
  end

  test "taking from an empty list returns an empty list" do
    assert TakeMax.take_max([], 5, &(&1)) == []
  end
end
