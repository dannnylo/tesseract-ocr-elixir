defmodule TesseractOcr.Utils do
  @moduledoc """
  Utilities to run `tesseract-ocr` binary.
  """

  @doc """
  This function executes the tesseract on system and return the output.
  """
  def command(path, output, options) do
    System.cmd("tesseract", command_options(path, output, options))
  end

  @doc """
  This function will mount the options to Tesseract OCR.

  ## Examples

      iex> TesseractOcr.Utils.command_options("test/resources/world.png", "stdout", %{l: "por", oem: "1"})
      ["test/resources/world.png", "stdout", "-l", "por", "--oem","1"]

      iex> TesseractOcr.Utils.command_options("test/resources/world.png", "stdout", %{l: "por", psm: 1})
      ["test/resources/world.png", "stdout", "-l", "por", "--psm", "1"]

      iex> TesseractOcr.Utils.command_options("test/resources/world.png", "stdout", %{c: "var=b"})
      ["test/resources/world.png", "stdout", "-c", "var=b"]

  """
  def command_options(path, output, options) do
    [
      path,
      output,
      make_short_option(:l, options[:l] || options[:lang]),
      make_option(:oem, options[:oem]),
      make_option(:psm, options[:psm]),
      make_short_option(:c, options[:c])
    ]
    |> List.flatten()
    |> Enum.filter(&(!is_nil(&1)))
  end

  defp make_option(_name, value) when is_nil(value) do
    nil
  end

  defp make_option(name, value) when is_integer(value) do
    make_option(name, Integer.to_string(value))
  end

  defp make_option(name, value) do
    ["--#{name}", value]
  end

  defp make_short_option(_name, value) when is_nil(value) do
    nil
  end

  defp make_short_option(name, value) do
    ["-#{name}", value]
  end

  def read_and_remove(path) do
    content = File.read(path)

    File.rm(path)

    content
  end
end
