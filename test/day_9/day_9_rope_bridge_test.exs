defmodule AdventOfCode2022.Day9.RopeBridgeTest do
  use ExUnit.Case
  doctest AdventOfCode2022.Day9.RopeBridge

  alias AdventOfCode2022.Day9.RopeBridge

  describe "main" do
    test "counts total number of unique positions visited by tail" do
      assert RopeBridge.main() == 6314
    end
  end
end
