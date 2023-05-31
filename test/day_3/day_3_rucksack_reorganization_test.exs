defmodule AdventOfCode2022.Day3.RucksackReorganizationTest do
  use ExUnit.Case
  doctest AdventOfCode2022.Day3.RucksackReorganization

  alias AdventOfCode2022.Day3.RucksackReorganization

  describe "main" do
    test "sum of priorities of shared items between compartments in rucksack" do
      assert RucksackReorganization.main() == 8176
    end
  end
end
