defmodule TesseractOcr.TSV do
  @moduledoc """
  Documentation for TesseractOcr.TSV.
  """

  import TesseractOcr.Utils

  @doc """
  This function reads the words on image by OCR and returns the TSV's file's path

  ## Examples

      iex> TesseractOcr.TSV.read("test/resources/world.png", "/tmp/test")
      "/tmp/test.tsv"

  """
  def read(path, output, options \\ %{}) when is_binary(path) do
    options = Map.merge(options, %{c: "tessedit_create_tsv=1"})

    command(path, output, options)

    "#{output}.tsv"
  end
end
