defmodule NoSpaceLeft2 do
  def increment_stack_sizes(stack, file_size) do
    Enum.map(stack, fn {dir, size} -> {dir, size + file_size} end)
  end

  def smallest_dir_size_for_deletion(dirs, min_size) do
    Enum.reduce(dirs, 99_999_999, fn {dir, size}, acc ->
      cond do
        size < acc and size >= min_size ->
          size
        true ->
          acc
      end
    end)
  end

  def main() do
    case File.open("input.txt", [:read]) do
      {:ok, file} ->
        lines =
          Enum.map(IO.stream(file, :line), fn line ->
            String.trim(line)
          end)
        dirs = Enum.reduce(lines, {[], []}, fn command, acc ->
          cond do
            String.starts_with?(command, "$ ls") ->
              acc
            String.starts_with?(command, "dir ") ->
              acc
            String.starts_with?(command, "$ cd ..") ->
              {stack, dirs_acc} = acc
              [head | tail] = stack
              {tail, [head | dirs_acc]}
            String.starts_with?(command, "$ cd") ->
              {stack, dirs_acc} = acc
              {[{command |> String.split |> List.last, 0} | stack], dirs_acc}
            true ->
              cur_file_size = command |> String.split |> List.first |> String.to_integer
              {stack, dirs_acc} = acc
              {increment_stack_sizes(stack, cur_file_size), dirs_acc}
          end
        end)
        all_dirs = elem(dirs, 0) ++ elem(dirs, 1)

        root = Enum.find(all_dirs, fn {dir, _size} -> dir == "/" end)
        root_size = elem(root, 1)
        size_to_delete = smallest_dir_size_for_deletion(all_dirs, (30_000_000 - (70_000_000 - root_size)))
        IO.puts size_to_delete
      {:error, reason} ->
        IO.puts "Error opening input file: #{reason}"
    end
  end
end
