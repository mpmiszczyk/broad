defmodule BroadTest do
  use ExUnit.Case
  doctest Broad

  test "greets the world" do
    assert Broad.hello() == :world
  end
end
