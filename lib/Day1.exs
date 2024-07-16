defmodule AdventOfCode.Day1 do
  @moduledoc """
  Module for Day 1
  https://adventofcode.com/2023/day/1
  """

  @doc """
  Script entrance.

  Returns `number()`.

  ## Examples
      > elixir lib/Day1.exs
  """
  def solve do
    read_input()
    |> get_numbers()
    |> get_calibration_values()
    |> sum_calibration_values()
  end

  defp read_input do
    file_path = File.cwd!() <> "/assets/day-1-input.txt"

    case File.read(file_path) do
      {:ok, content} -> content
      {:error, :enoent} -> "Error!"
    end
  end

  defp get_numbers(content) do
    String.split(content, "\n")
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&Enum.filter(&1, fn char -> Regex.match?(~r/^\d+$/, char) end))
  end

  defp get_calibration_values(line_of_numbers) do
    Enum.map(line_of_numbers, &String.to_integer(Enum.at(&1, 0, "0") <> Enum.at(&1, -1, "0")))
  end

  defp sum_calibration_values(calibrations) do
    Enum.sum(calibrations)
  end
end

IO.inspect(AdventOfCode.Day1.solve())
