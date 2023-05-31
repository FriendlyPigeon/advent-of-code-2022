defmodule AdventOfCode2022.Day8.TreeHouse do
  def main() do
    case File.open("inputs/day_8.txt", [:read]) do
      {:ok, file} ->
        rows =
          Enum.map(IO.stream(file, :line), fn line ->
            String.trim(line) |> String.split("", trim: true) |> Enum.map(&String.to_integer/1)
          end)

        cols =
          rows
          |> List.first
          |> Enum.with_index(fn element, index -> {index, element} end)
          |> Enum.reduce([], fn {index, _item}, acc ->
            acc ++ [Enum.map(rows, fn row -> row |> Enum.at(index) end)]
          end)

        count =
          Enum.reduce(rows |> Enum.with_index, 0, fn {row, row_index}, acc ->
            acc + Enum.reduce(row |> Enum.with_index, 0, fn {item, col_index}, acc ->
              col = cols |> Enum.at(col_index)

              above = col |> Enum.slice(0, row_index)
              left = row |> Enum.slice(0, col_index)
              right = row |> Enum.slice(col_index + 1, length(row))
              below = col |> Enum.slice(row_index + 1, length(col))

              cond do
                Enum.max(above, fn -> -1 end) < item or Enum.max(left, fn -> -1 end) < item or Enum.max(right, fn -> -1 end) < item or Enum.max(below, fn -> -1 end) < item ->
                  acc + 1
                true ->
                  acc
              end
            end)
          end)

        count
      {:error, reason} ->
        IO.puts "Error opening input file: #{reason}"
    end
  end
end
