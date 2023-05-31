defmodule AdventOfCode2022.Day6.TuningTrouble2 do
  def main() do
    case File.read("inputs/day_6.txt") do
      {:ok, signal_str} ->
        start_marker_index =
          Enum.drop_while(13..(String.length(signal_str)), fn index ->
            String.slice(signal_str, index-13, 14)
            |> String.to_charlist
            |> Enum.uniq
            |> length < 14
          end)

        List.first(start_marker_index)+1
      {:error, reason} ->
        IO.puts "Error opening input file: #{reason}"
    end
  end
end
