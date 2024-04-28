defmodule BloomTest do
  use ExUnit.Case
  doctest Bloom

  test "greets the world" do
    assert Bloom.hello() == :world
  end
end
