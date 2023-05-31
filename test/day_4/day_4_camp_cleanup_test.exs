defmodule AdventOfCode2022.Day4.CampCleanupTest do
  use ExUnit.Case
  doctest AdventOfCode2022.Day4.CampCleanup

  alias AdventOfCode2022.Day4.CampCleanup

  describe "main" do
    test "number of assignment pairs where one range fully contains the other" do
      assert CampCleanup.main() == 494
    end
  end
end
