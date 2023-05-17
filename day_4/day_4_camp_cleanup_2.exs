case File.open("input.txt", [:read]) do
  {:ok, file} ->
    pairs = Enum.map(IO.stream(file, :line), fn line ->
      String.trim(line) |> String.split(",")
    end)

    fully_overlapped_pairs = Enum.reduce(pairs, 0, fn pair, acc ->
      first = List.first(pair)
      second = List.last(pair)
      first_start = String.split(first, "-") |> List.first |> String.to_integer
      first_end = String.split(first, "-") |> List.last |> String.to_integer
      second_start = String.split(second, "-") |> List.first |> String.to_integer
      second_end = String.split(second, "-") |> List.last |> String.to_integer
      first_sections = Enum.to_list(first_start..first_end) |> MapSet.new
      second_sections = Enum.to_list(second_start..second_end) |> MapSet.new

      if (MapSet.intersection(first_sections, second_sections) |> MapSet.size) > 0 do
        acc + 1
      else
        acc
      end
    end)

    IO.puts fully_overlapped_pairs
  {:error, reason} ->
    IO.puts "Error opening input file: #{reason}"
end
