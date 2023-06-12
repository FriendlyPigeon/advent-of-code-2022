defmodule AdventOfCode2022.Day10.CrtTest do
  use ExUnit.Case
  doctest AdventOfCode2022.Day10.Crt

  alias AdventOfCode2022.Day10.Crt

  describe "main" do
    test "sum of register value multiplied by clock cycle count at specific points (20th, 60th, 100th, 140th, 180th, and 220th clock cycle)" do
      assert Crt.main() == 14060
    end
  end
end
