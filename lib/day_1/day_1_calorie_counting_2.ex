defmodule AdventOfCode2022.Day1.CalorieCounting2 do
  def main() do
    case File.open("inputs/day_1.txt", [:read]) do
      {:ok, file} ->
        calorie_counts = Enum.reduce(IO.stream(file, :line), {[], 0}, fn line, acc ->
          case line do
            "\n" ->
              {elem(acc, 0) ++ [elem(acc, 1)], 0}
            num_str ->
              calories = num_str |> String.trim |> String.to_integer
              {elem(acc, 0), elem(acc, 1) + calories}
          end
        end)
        calorie_counts = elem(calorie_counts, 0) ++ [elem(calorie_counts, 1)]
        calorie_counts = Enum.sort(calorie_counts, &(&1 > &2))
        Enum.take(calorie_counts, 3) |> Enum.sum
      {:error, reason} ->
        IO.puts "Error opening input file: #{reason}"
    end
  end
end
