defmodule AdventOfCode2022.Day4.CampCleanup2Test do
  use ExUnit.Case
  doctest AdventOfCode2022.Day4.CampCleanup2

  alias AdventOfCode2022.Day4.CampCleanup2

  describe "main" do
    test "number of assignment pairs where ranges overlap at all" do
      assert CampCleanup2.main() == 833
    end
  end
end
