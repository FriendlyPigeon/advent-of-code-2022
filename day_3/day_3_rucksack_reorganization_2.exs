case File.open("input.txt", [:read]) do
  {:ok, file} ->
    items = Enum.reduce(IO.stream(file, :line), [], fn line, acc ->
      acc ++ [String.trim(line) |> String.to_charlist]
    end)

    groups_items = Enum.chunk_every(items, 3)

    groups_item_frequencies = Enum.map(groups_items, fn group ->
      Enum.map(group, fn bag ->
        MapSet.new(bag)
      end)
    end)
    #IO.puts groups_item_frequencies

    commons = Enum.reduce(groups_item_frequencies, [], fn group, acc ->
      first_bag = Enum.fetch!(group, 0)
      second_bag = Enum.fetch!(group, 1)
      third_bag = Enum.fetch!(group, 2)
      acc ++ (MapSet.intersection(first_bag, second_bag) |> MapSet.intersection(third_bag) |> MapSet.to_list)
    end)

    priorities = Enum.reduce(commons, [], fn item, acc ->
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
