defmodule AdventOfCode2022.Day2.RockPaperScissors do
  def main() do
    case File.open("inputs/day_2.txt", [:read]) do
      {:ok, file} ->
        total_score = Enum.reduce(IO.stream(file, :line), 0, fn line, acc ->
          enemy_hand = String.at(line, 0)
          player_hand = String.at(line, 2)

          # compute score for player choice
          choice_score = case player_hand do
            "X" -> 1
            "Y" -> 2
            "Z" -> 3
          end

          # compute score for outcome
          outcome_score = case {enemy_hand, player_hand} do
            {"A", "Y"} -> 6
            {"A", "Z"} -> 0
            {"B", "X"} -> 0
            {"B", "Z"} -> 6
            {"C", "X"} -> 6
            {"C", "Y"} -> 0
            _ -> 3
          end

          acc + choice_score + outcome_score
        end)

        total_score
      {:error, reason} ->
        IO.puts "Error opening input file: #{reason}"
    end
  end
end
