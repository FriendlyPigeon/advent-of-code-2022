defmodule AdventOfCode2022.Day9.RopeBridge2Test do
  use ExUnit.Case
  doctest AdventOfCode2022.Day9.RopeBridge2

  alias AdventOfCode2022.Day9.RopeBridge2

  describe "main" do
    test "counts total number of unique positions visited by tail of rope of length 10" do
      assert RopeBridge2.main() == 2504
    end
  end
end
