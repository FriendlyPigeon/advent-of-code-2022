defmodule TreeHouse2 do
  def main() do
    case File.open("input.txt", [:read]) do
      {:ok, file} ->
        rows =
          Enum.map(IO.stream(file, :line), fn line ->
            String.trim(line) |> String.split("", trim: true) |> Enum.map(&String.to_integer/1)
          end)

        cols =
          rows
          |> List.first
          |> Enum.with_index(fn element, index -> {index, element} end)
          |> Enum.reduce([], fn {index, item}, acc ->
            acc ++ [Enum.map(rows, fn row -> row |> Enum.at(index) end)]
          end)

        max_scenic_score =
          Enum.reduce(rows |> Enum.with_index, 0, fn {row, row_index}, acc ->
            row_max = Enum.reduce(row |> Enum.with_index, 0, fn {item, col_index}, row_acc ->
              col = cols |> Enum.at(col_index)

              above = col |> Enum.slice(0, row_index) |> Enum.reverse
              left = row |> Enum.slice(0, col_index) |> Enum.reverse
              right = row |> Enum.slice(col_index + 1, length(row))
              below = col |> Enum.slice(row_index + 1, length(col))

              above_tree = above |> Enum.take(1)
              left_tree = left |> Enum.take(1)
              right_tree = right |> Enum.take(1)
              below_tree = below |> Enum.take(1)

              above_trees = (above |> Enum.take_while(fn x -> x < item end)) ++ (above |> Enum.drop_while(fn x -> x < item end) |> Enum.take(1))
              left_trees = (left |> Enum.take_while(fn x -> x < item end)) ++ (left |> Enum.drop_while(fn x -> x < item end) |> Enum.take(1))
              right_trees = (right |> Enum.take_while(fn x -> x < item end)) ++ (right |> Enum.drop_while(fn x -> x < item end) |> Enum.take(1))
              below_trees = (below |> Enum.take_while(fn x -> x < item end)) ++ (below |> Enum.drop_while(fn x -> x < item end) |> Enum.take(1))

              scenic_score = Enum.count(above_trees) * Enum.count(left_trees) * Enum.count(right_trees) * Enum.count(below_trees)
              cond do
                scenic_score > row_acc -> scenic_score
                true -> row_acc
              end
            end)

            cond do
              row_max > acc -> row_max
              true -> acc
            end
          end)

        IO.puts max_scenic_score
      {:error, reason} ->
        IO.puts "Error opening input file: #{reason}"
    end
  end
end
