defmodule DistilleryTestTest do
  use ExUnit.Case
  doctest DistilleryTest

  test "greets the world" do
    assert DistilleryTest.hello() == :world
  end
end
