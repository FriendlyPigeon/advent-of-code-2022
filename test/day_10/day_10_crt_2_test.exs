defmodule AdventOfCode2022.Day10.Crt2Test do
  use ExUnit.Case
  doctest AdventOfCode2022.Day10.Crt2

  alias AdventOfCode2022.Day10.Crt2

  describe "main" do
    test "Proper CRT output with code (PAPKFKEJ) after following draw instructions" do
      assert Crt2.main() == "###...##..###..#..#.####.#..#.####...##.\n#..#.#..#.#..#.#.#..#....#.#..#.......#.\n#..#.#..#.#..#.##...###..##...###.....#.\n###..####.###..#.#..#....#.#..#.......#.\n#....#..#.#....#.#..#....#.#..#....#..#.\n#....#..#.#....#..#.#....#..#.####..##.."
    end
  end
end
