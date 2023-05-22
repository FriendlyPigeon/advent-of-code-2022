case File.read("input.txt") do
  {:ok, signal_str} ->
    start_marker_index =
      Enum.drop_while(13..(String.length(signal_str)), fn index ->
        String.slice(signal_str, index-13, 14)
        |> String.to_charlist
        |> Enum.uniq
        |> length < 14
      end)

    IO.puts List.first(start_marker_index)+1

  {:error, reason} ->
    IO.puts "Error opening input file: #{reason}"
end
