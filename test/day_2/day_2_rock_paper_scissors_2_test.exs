defmodule AdventOfCode2022.Day2.RockPaperScissors2Test do
  use ExUnit.Case
  doctest AdventOfCode2022.Day2.RockPaperScissors2

  alias AdventOfCode2022.Day2.RockPaperScissors2

  describe "main" do
    test "return total score with new strategy guide interpretation" do
      assert RockPaperScissors2.main() == 12526
    end
  end
end
