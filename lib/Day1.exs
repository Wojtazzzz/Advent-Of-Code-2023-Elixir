defmodule AdventOfCode.Day1 do
  def solve do
    readFile()
    |> getNumbers()
    |> getCalibrationValues()
    |> computeCalibrations()
  end

  def readFile do
    case File.read(File.cwd!() <> "/assets/day-1-input.txt") do
      {:ok, content} -> content
      {:error, :enoent} -> "Error!"
    end
  end

  def getNumbers(content) do
    String.split(content, "\n")
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&Enum.filter(&1, fn char -> Regex.match?(~r/^\d+$/, char) end))
  end

  def getCalibrationValues(lineOfNumbers) do
    lineOfNumbers
    |> Enum.map(&String.to_integer(Enum.at(&1, 0, "0") <> Enum.at(&1, -1, "0")))
  end

  def computeCalibrations(calibrations) do
    Enum.sum(calibrations)
  end
end

IO.inspect AdventOfCode.Day1.solve()
