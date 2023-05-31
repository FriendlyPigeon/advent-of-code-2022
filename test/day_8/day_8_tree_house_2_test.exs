defmodule AdventOfCode2022.Day8.TreeHouse2Test do
  use ExUnit.Case
  doctest AdventOfCode2022.Day8.TreeHouse2

  alias AdventOfCode2022.Day8.TreeHouse2

  describe "main" do
    test "returns highest scenic score (a tree house that sees the most surrounding trees) correctly" do
      assert TreeHouse2.main() == 327180
    end
  end
end
