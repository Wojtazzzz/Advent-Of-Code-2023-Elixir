defmodule AdventOfCode.Day1 do
  def solve do
    read_input()
    |> get_numbers()
    |> get_calibration_values()
    |> sum_calibration_values()
  end

  def read_input do
    file_path = File.cwd!() <> "/assets/day-1-input.txt"

    case File.read(file_path) do
      {:ok, content} -> content
      {:error, :enoent} -> "Error!"
    end
  end

  def get_numbers(content) do
    String.split(content, "\n")
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&Enum.filter(&1, fn char -> Regex.match?(~r/^\d+$/, char) end))
  end

  def get_calibration_values(line_of_numbers) do
    line_of_numbers
    |> Enum.map(&String.to_integer(Enum.at(&1, 0, "0") <> Enum.at(&1, -1, "0")))
  end

  def sum_calibration_values(calibrations) do
    Enum.sum(calibrations)
  end
end

IO.inspect(AdventOfCode.Day1.solve())
