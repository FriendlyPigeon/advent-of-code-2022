defmodule AdventOfCode2022.Day6.TuningTrouble2Test do
  use ExUnit.Case
  doctest AdventOfCode2022.Day6.TuningTrouble2

  alias AdventOfCode2022.Day6.TuningTrouble2

  describe "main" do
    test "number of characters needed to be processed before start-of-message marker" do
      assert TuningTrouble2.main() == 2265
    end
  end
end
