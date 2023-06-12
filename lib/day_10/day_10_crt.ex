defmodule AdventOfCode2022.Day10.Crt do
  def main() do
    case File.open("inputs/day_10.txt", [:read]) do
      {:ok, file} ->
        instructions =
          Enum.map(IO.stream(file, :line), fn line ->
            String.trim(line) |> String.split(" ", trim: true)
          end) |> List.flatten

        {_, _, key_signals} =
          Enum.reduce(instructions, {1, 1, []}, fn instruction, {cycle_count, register, acc} ->
            acc =
              cond do
                Enum.member?([20, 60, 100, 140, 180, 220], cycle_count) ->
                  acc ++ [register * cycle_count]
                true ->
                  acc
              end

            case instruction do
              "noop" ->
                {cycle_count + 1, register, acc}
              "addx" ->
                {cycle_count + 1, register, acc}
              i ->
                num = String.to_integer(i)
                {cycle_count + 1, register + num, acc}
            end
          end)

        IO.inspect key_signals
        Enum.sum(key_signals)
      {:error, reason} ->
        IO.puts "Error opening input file: #{reason}"
    end
  end
end
