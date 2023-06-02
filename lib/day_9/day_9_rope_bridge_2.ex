defmodule AdventOfCode2022.Day9.RopeBridge2 do
  def update_body(head, body) do
    updated_tail =
      Enum.reduce(body, {head, []}, fn item, {cur_head, body} ->
        {head_x, head_y} = cur_head
        {tail_x, tail_y} = item

        new_tail =
          cond do
            head_y > tail_y + 1 and head_x > tail_x ->
              {tail_x + 1, tail_y + 1}
            head_y > tail_y + 1 and head_x < tail_x ->
              {tail_x - 1, tail_y + 1}
            head_y < tail_y - 1 and head_x > tail_x ->
              {tail_x + 1, tail_y - 1}
            head_y < tail_y - 1 and head_x < tail_x ->
              {tail_x - 1, tail_y - 1}
            head_x > tail_x + 1 and head_y > tail_y ->
              {tail_x + 1, tail_y + 1}
            head_x > tail_x + 1 and head_y < tail_y ->
              {tail_x + 1, tail_y - 1}
            head_x < tail_x - 1 and head_y > tail_y ->
              {tail_x - 1, tail_y + 1}
            head_x < tail_x - 1 and head_y < tail_y ->
              {tail_x - 1, tail_y - 1}
            head_y > tail_y + 1 ->
              {tail_x, tail_y + 1}
            head_y < tail_y - 1 ->
              {tail_x, tail_y - 1}
            head_x > tail_x + 1 ->
              {tail_x + 1, tail_y}
            head_x < tail_x - 1 ->
              {tail_x - 1, tail_y}
            true ->
              {tail_x, tail_y}
          end

        {new_tail, body ++ [new_tail]}
      end)

    {_, new_tail} = updated_tail
    new_tail
  end

  def compute_moves(head, tail, _, 0, visited_positions) do
    new_positions =
      %{
        head: head,
        tail: tail
      }

    {new_positions, visited_positions}
  end

  def compute_moves(head, tail, "U", steps, visited_positions) do
    new_head = {head |> elem(0), (head |> elem(1)) + 1}
    new_tail = update_body(new_head, tail)

    new_visited_positions = MapSet.put(visited_positions, List.last(new_tail))

    compute_moves(new_head, new_tail, "U", steps - 1, new_visited_positions)
  end

  def compute_moves(head, tail, "D", steps, visited_positions) do
    new_head = {head |> elem(0), (head |> elem(1)) - 1}
    new_tail = update_body(new_head, tail)

    new_visited_positions = MapSet.put(visited_positions, List.last(new_tail))

    compute_moves(new_head, new_tail, "D", steps - 1, new_visited_positions)
  end

  def compute_moves(head, tail, "L", steps, visited_positions) do
    new_head = {(head |> elem(0)) - 1, head |> elem(1)}
    new_tail = update_body(new_head, tail)

    new_visited_positions = MapSet.put(visited_positions, List.last(new_tail))

    compute_moves(new_head, new_tail, "L", steps - 1, new_visited_positions)
  end

  def compute_moves(head, tail, "R", steps, visited_positions) do
    new_head = {(head |> elem(0)) + 1, head |> elem(1)}
    new_tail = update_body(new_head, tail)

    new_visited_positions = MapSet.put(visited_positions, List.last(new_tail))

    compute_moves(new_head, new_tail, "R", steps - 1, new_visited_positions)
  end

  def main() do
    case File.open("inputs/day_9.txt", [:read]) do
      {:ok, file} ->
        instructions =
          Enum.map(IO.stream(file, :line), fn line ->
            String.trim(line) |> String.split(" ", trim: true)
          end)

        starting_pos =
          %{
            head: {0, 0},
            tail: [{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}]
          }

        {_positions, visited_positions} =
          Enum.reduce(instructions, {starting_pos, MapSet.new()}, fn instruction, {current_positions, visited_positions} ->
            [direction, steps] = instruction
            compute_moves(current_positions.head, current_positions.tail, direction, String.to_integer(steps), visited_positions)
          end)

        MapSet.size(visited_positions)
      {:error, reason} ->
        IO.puts "Error opening input file: #{reason}"
    end
  end
end
