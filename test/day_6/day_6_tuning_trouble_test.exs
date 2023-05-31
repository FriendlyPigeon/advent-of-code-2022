defmodule AdventOfCode2022.Day6.TuningTroubleTest do
  use ExUnit.Case
  doctest AdventOfCode2022.Day6.TuningTrouble

  alias AdventOfCode2022.Day6.TuningTrouble

  describe "main" do
    test "number of characters needed to be processed before start-of-packet marker" do
      assert TuningTrouble.main() == 1566
    end
  end
end
