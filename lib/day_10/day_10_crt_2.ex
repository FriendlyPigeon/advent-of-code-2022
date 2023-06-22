defmodule AdventOfCode2022.Day10.Crt2 do
  def main() do
    case File.open("inputs/day_10.txt", [:read]) do
      {:ok, file} ->
        instructions =
          Enum.map(IO.stream(file, :line), fn line ->
            String.trim(line) |> String.split(" ", trim: true)
          end) |> List.flatten

        crt = List.duplicate(".", 40*6)

        {_, _, output_crt} =
          Enum.reduce(instructions, {0, 1, crt}, fn instruction, {clock_cycle, sprite_position, acc} ->
            horizontal_position = Integer.mod(clock_cycle, 40)
            acc =
              cond do
                Enum.member?([sprite_position, sprite_position - 1, sprite_position + 1], horizontal_position) ->
                  List.replace_at(acc, clock_cycle, "#")
                true ->
                  acc
              end

            case instruction do
              "noop" ->
                {clock_cycle + 1, sprite_position, acc}
              "addx" ->
                {clock_cycle + 1, sprite_position, acc}
              i ->
                num = String.to_integer(i)
                {clock_cycle + 1, sprite_position + num, acc}
            end
          end)

        output_crt |> Enum.chunk_every(40) |> Enum.intersperse("\n") |> List.flatten |> Enum.join("")
      {:error, reason} ->
        IO.puts "Error opening input file: #{reason}"
    end
  end
end
