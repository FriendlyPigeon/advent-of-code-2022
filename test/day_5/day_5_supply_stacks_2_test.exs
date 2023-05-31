defmodule AdventOfCode2022.Day5.SupplyStacks2Test do
  use ExUnit.Case
  doctest AdventOfCode2022.Day5.SupplyStacks2

  alias AdventOfCode2022.Day5.SupplyStacks2

  describe "main" do
    test "stacks after rearrangement procedure (order preserved on move)" do
      final_stack =
        %{
          1 => ["Q"],
          2 => ["L"],
          3 => ["F", "R", "H", "M"],
          4 => ["Q", "J", "M", "T", "S"],
          5 => ["D", "W", "H", "T", "V", "N", "Q", "S", "D"],
          6 => ["B", "T", "F", "B", "B", "H", "R", "N", "J", "D"],
          7 => ["B", "N"],
          8 => ["H", "D", "T", "V", "V", "R", "W", "S", "N", "Q", "Q", "P", "J"],
          9 => ["M", "B", "N", "N", "H", "Z", "B", "D", "G", "V", "R"]
        }

      assert SupplyStacks2.main() == final_stack
    end
  end
end
