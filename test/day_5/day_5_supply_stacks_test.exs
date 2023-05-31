defmodule AdventOfCode2022.Day5.SupplyStacksTest do
  use ExUnit.Case
  doctest AdventOfCode2022.Day5.SupplyStacks

  alias AdventOfCode2022.Day5.SupplyStacks

  describe "main" do
    test "stacks after rearrangement procedure" do
      final_stack =
        %{
          1 => ["G"],
          2 => ["R"],
          3 => ["T", "T", "S", "V"],
          4 => ["S", "W", "R", "N", "D"],
          5 => ["W", "M", "D", "J", "B", "T", "B", "V", "F"],
          6 => ["N", "V", "M", "F", "Q", "P", "Q", "B", "D", "Q"],
          7 => ["J", "N"],
          8 => ["H", "N", "H", "D", "R", "D", "M", "H", "L", "T", "N", "B", "J"],
          9 => ["H", "Q", "H", "Z", "B", "B", "S", "R", "Q", "V", "N"]
        }

      assert SupplyStacks.main() == final_stack
    end
  end
end
