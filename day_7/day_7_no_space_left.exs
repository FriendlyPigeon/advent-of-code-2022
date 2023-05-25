defmodule NoSpaceLeft do
  def increment_stack_sizes(stack, file_size) do
    Enum.map(stack, fn {dir, size} -> {dir, size + file_size} end)
  end

  def main() do
    case File.open("input.txt", [:read]) do
      {:ok, file} ->
        lines =
          Enum.map(IO.stream(file, :line), fn line ->
            String.trim(line)
          end)
        dirs = Enum.reduce(lines, {[], 0}, fn command, acc ->
          cond do
            String.starts_with?(command, "$ ls") ->
              acc
            String.starts_with?(command, "dir ") ->
              acc
            String.starts_with?(command, "$ cd ..") ->
              {stack, total_counted_size} = acc
              [head | tail] = stack
              {_cur_dir, size} = head
              cond do
                size <= 100000 ->
                  {tail, total_counted_size + size}
                true ->
                  {tail, total_counted_size}
              end
            String.starts_with?(command, "$ cd") ->
              {stack, total_counted_size} = acc
              {[{command |> String.split |> List.last, 0} | stack], total_counted_size}
            true ->
              cur_file_size = command |> String.split |> List.first |> String.to_integer
              {stack, total_counted_size} = acc
              {increment_stack_sizes(stack, cur_file_size), total_counted_size}
          end
        end)

        {_stack, total_counted_size} = dirs
        IO.puts total_counted_size
      {:error, reason} ->
        IO.puts "Error opening input file: #{reason}"
    end
  end
end
