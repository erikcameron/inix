defmodule InixTest do
  use ExUnit.Case
  doctest Inix

  test "greets the world" do
    assert Inix.hello() == :world
  end
end
