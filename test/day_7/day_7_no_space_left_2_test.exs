defmodule AdventOfCode2022.Day7.NoSpaceLeft2Test do
  use ExUnit.Case
  doctest AdventOfCode2022.Day7.NoSpaceLeft2

  alias AdventOfCode2022.Day7.NoSpaceLeft2

  describe "main" do
    test "size of smallest size directory possible to delete to make enough space" do
      assert NoSpaceLeft2.main() == 4473403
    end
  end
end
