defmodule TesseractOcr.Words do
  @moduledoc """
  Documentation for TesseractOcrWords.
  """

  import TesseractOcr.Utils

  @doc """
  This function reads the words on image by OCR and returns with positions.

  ## Examples

      iex> TesseractOcr.Words.read("test/resources/world.png")
      [%{confidence: 95, word: "world", x_end: 185, x_start: 2, y_end: 56, y_start: 2}]

  """
  def read(path, options \\ %{}) when is_binary(path) do
    output = SecureRandom.uuid()
    options = Map.merge(options, %{c: "tessedit_create_hocr=1"})

    command(path, output, options)

    read_and_remove("#{output}.hocr")
    |> elem(1)
    |> parse
  end

  defp parse(content) do
    content
    |> String.split("\n")
    |> Enum.map(fn line -> parse_line(line) end)
    |> Enum.reject(&is_nil/1)
  end

  defp parse_line(line) do
    if String.match?(line, ~r/oc(rx|r)_word/) do
      word = content_match(line, ~r/(?<=>)(.*?)(?=<)/)

      if word == "" do
        nil
      else
        word_info(word, parse_position(line), parse_confidence(line))
      end
    else
      nil
    end
  end

  def word_info(word, positions, confidence) do
    %{
      word: word,
      confidence: confidence,
      x_start: Enum.at(positions, 0),
      y_start: Enum.at(positions, 1),
      x_end: Enum.at(positions, 2),
      y_end: Enum.at(positions, 3)
    }
  end

  defp parse_position(line) do
    content_match(line, ~r/(?<=bbox)(.*?)(?=;)/)
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  defp parse_confidence(line) do
    content_match(line, ~r/(?<=; x_wconf )(.*?)(?=')/)
    |> String.to_integer()
  end

  def content_match(string, re) do
    matched =
      Regex.scan(re, string)
      |> List.first()

    List.first(matched || [""])
  end
end
