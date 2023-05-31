defmodule AdventOfCode2022.Day1.CalorieCounting2Test do
  use ExUnit.Case
  doctest AdventOfCode2022.Day1.CalorieCounting2

  alias AdventOfCode2022.Day1.CalorieCounting2

  describe "main" do
    test "total number of calories being carried by the 3 elves carrying the most calories" do
      assert CalorieCounting2.main() == 206582
    end
  end
end
