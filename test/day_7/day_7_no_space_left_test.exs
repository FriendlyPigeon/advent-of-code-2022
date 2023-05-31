defmodule AdventOfCode2022.Day7.NoSpaceLeftTest do
  use ExUnit.Case
  doctest AdventOfCode2022.Day7.NoSpaceLeft

  alias AdventOfCode2022.Day7.NoSpaceLeft

  describe "main" do
    test "sum of total size of directories with a size of no more than 100000" do
      assert NoSpaceLeft.main() == 2061777
    end
  end
end
