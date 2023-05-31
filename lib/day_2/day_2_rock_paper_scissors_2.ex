defmodule AdventOfCode2022.Day2.RockPaperScissors2 do
  def main() do
    case File.open("inputs/day_2.txt", [:read]) do
      {:ok, file} ->
        total_score = Enum.reduce(IO.stream(file, :line), 0, fn line, acc ->
          enemy_hand = String.at(line, 0)
          outcome = String.at(line, 2)

          # compute score for player choice
          outcome_score = case outcome do
            "X" -> 0
            "Y" -> 3
            "Z" -> 6
          end

          # compute score for outcome
          choice_score = case {enemy_hand, outcome} do
            {a, "X"} -> a == "A" && 3 || a == "B" && 1 || a == "C" && 2
            {a, "Y"} -> a == "A" && 1 || a == "B" && 2 || a == "C" && 3
            {a, "Z"} -> a == "A" && 2 || a == "B" && 3 || a == "C" && 1
          end

          acc + choice_score + outcome_score
        end)

        total_score
      {:error, reason} ->
        IO.puts "Error opening input file: #{reason}"
    end
  end
end
