case File.open("input.txt", [:read]) do
  {:ok, file} ->
    crates_str =
      Enum.take_while(IO.stream(file, :line), fn line ->
        String.starts_with?(line, "[")
      end) |> Enum.reverse

    empty_stacks = Map.new(1..9, fn x -> {x, []} end)
    stacks = Enum.reduce(crates_str, empty_stacks, fn line, stacks_acc ->
      items = String.split(line, "") |> Enum.drop(2) |> Enum.take_every(4)
      Enum.reduce(items |> Enum.with_index, stacks_acc, fn {item, index}, stack ->
        case item do
          " " ->
            stack
          _ ->
            Map.put(stack, index+1, [item | Map.get(stack, index+1, [])])
        end
      end)
    end)

    # get rid of empty line
    Enum.take(IO.stream(file, :line), 1)

    instructions = Enum.reduce(IO.stream(file, :line), [], fn line, acc ->
      acc ++ [String.split(line, ~r/[^\d]/, trim: true) |> Enum.map(&String.to_integer/1)]
    end)

    organized_stacks = Enum.reduce(instructions, stacks, fn instruction, stacks_acc ->
      [count, from, to] = instruction
      items = Map.get(stacks_acc, from) |> Enum.take(count) |> Enum.reverse

      Map.put(stacks_acc, from, Map.get(stacks_acc, from) |> Enum.drop(count))
      |> Map.put(to, items ++ Map.get(stacks_acc, to))
    end)

    IO.inspect organized_stacks
  {:error, reason} ->
    IO.puts "Error opening input file: #{reason}"
end
