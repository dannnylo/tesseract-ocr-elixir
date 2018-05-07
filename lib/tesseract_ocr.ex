defmodule TesseractOcr do
  @moduledoc """
  Documentation for TesseractOcr.
  This Module is a wrapper of tesseract-ocr
  """

  @doc """
  This function reads the chars on image by OCR

  ## Examples

      iex> TesseractOcr.read("test/resources/world.png")
      "world"

  """
  def read(path, options \\ %{}) do
    # #{lang} #{oem} #{psm} #{tessdata_dir} #{user_words} #{user_patterns} #{config_file} #{clear_console_output} #{options_cmd.join(' ')}
    command(path, options)
    |> elem(0)
    |> String.trim
  end

  @doc """
  This function executes the tesseract on system and return the output
  """
  def command(path, options) do
    System.cmd("tesseract", command_options(path, options))
  end

  @doc """
  This function will mount the options to tesseract OCR

  ## Examples

    iex> TesseractOcr.command_options("test/resources/world.png", %{lang: "por", oem: "1"})
    ["test/resources/world.png", "stdout", "--lang por", "--oem 1"]

    iex> TesseractOcr.command_options("test/resources/world.png", %{lang: "por", psm: 1})
    ["test/resources/world.png", "stdout", "--lang por", "--psm 1"]

  """
  def command_options(path, options) do
    [path,
      "stdout",
      make_option(:lang, options[:lang]),
      make_option(:oem, options[:oem]),
      make_option(:psm, options[:psm])
    ]
    |> Enum.filter(& !is_nil(&1))
  end

  defp make_option(_name, value) when is_nil(value) do
    nil
  end

  defp make_option(name, value) when is_integer(value) do
    make_option(name, Integer.to_string(value))
  end

  defp make_option(name, value) do
    "--#{name} " <> value
  end
end
