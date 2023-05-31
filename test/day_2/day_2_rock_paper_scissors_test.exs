defmodule AdventOfCode2022.Day2.RockPaperScissorsTest do
  use ExUnit.Case
  doctest AdventOfCode2022.Day2.RockPaperScissors

  alias AdventOfCode2022.Day2.RockPaperScissors

  describe "main" do
    test "return total score with original strategy guide interpretation" do
      assert RockPaperScissors.main() == 10994
    end
  end
end
