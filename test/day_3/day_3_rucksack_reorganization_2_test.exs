defmodule AdventOfCode2022.Day3.RucksackReorganization2Test do
  use ExUnit.Case
  doctest AdventOfCode2022.Day3.RucksackReorganization2

  alias AdventOfCode2022.Day3.RucksackReorganization2

  describe "main" do
    test "sum of common item priorities amongst 2 elf groups" do
      assert RucksackReorganization2.main() == 2689
    end
  end
end
