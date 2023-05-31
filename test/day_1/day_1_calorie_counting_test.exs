defmodule AdventOfCode2022.Day1.CalorieCountingTest do
  use ExUnit.Case
  doctest AdventOfCode2022.Day1.CalorieCounting

  alias AdventOfCode2022.Day1.CalorieCounting

  describe "main" do
    test "return the number of calories being carried by the elf carrying the most calories at once" do
      assert CalorieCounting.main() == 70116
    end
  end
end
