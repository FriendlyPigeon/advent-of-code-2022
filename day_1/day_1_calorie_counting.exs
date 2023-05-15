case File.open("input.txt", [:read]) do
  {:ok, file} ->
    calorie_counts = Enum.reduce(IO.stream(file, :line), {[], 0}, fn line, acc ->
      case line do
        "\n" ->
          {elem(acc, 0) ++ [elem(acc, 1)], 0}
        num_str ->
          calories = num_str |> String.trim |> String.to_integer
          {elem(acc, 0), elem(acc, 1) + calories}
      end
    end)
    calorie_counts = elem(calorie_counts, 0) ++ [elem(calorie_counts, 1)]
    IO.puts Enum.max(calorie_counts)
  {:error, reason} ->
    IO.puts "Error opening input file: #{reason}"
end
