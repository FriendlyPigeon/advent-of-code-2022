case File.open("input.txt", [:read]) do
  {:ok, file} ->
    items = Enum.reduce(IO.stream(file, :line), [], fn line, acc ->
      acc ++ [String.to_charlist(line)]
    end)

    shared_items = Enum.reduce(items, [], fn bag, acc ->
      compartments = Enum.split(bag, div(Enum.count(bag), 2))
      first_compartment = elem(compartments, 0) |> MapSet.new
      second_compartment = elem(compartments, 1) |> MapSet.new
      acc ++ (MapSet.intersection(first_compartment, second_compartment) |> MapSet.to_list)
    end)

    priorities = Enum.reduce(shared_items, [], fn item, acc ->
      case item do
        x when x >= 97 -> acc ++ [x - 96]
        x when x <= 90 -> acc ++ [x - 38]
        _ -> acc
      end
    end)

    IO.puts Enum.sum(priorities)
  {:error, reason} ->
    IO.puts "Error opening input file: #{reason}"
end
