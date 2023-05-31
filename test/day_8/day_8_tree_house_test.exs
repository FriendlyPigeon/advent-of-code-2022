defmodule AdventOfCode2022.Day8.TreeHouseTest do
  use ExUnit.Case
  doctest AdventOfCode2022.Day8.TreeHouse

  alias AdventOfCode2022.Day8.TreeHouse

  describe "main" do
    test "counts visible tree houses correctly" do
      assert TreeHouse.main() == 1672
    end
  end
end
