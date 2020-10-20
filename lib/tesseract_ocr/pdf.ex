defmodule TesseractOcr.PDF do
  @moduledoc """
  Documentation for TesseractOcr.PDF.
  """

  import TesseractOcr.Utils

  @doc """
  This function reads the words on image by OCR and returns the pdf's file's path

  ## Examples

      iex> TesseractOcr.PDF.read("test/resources/world.png", "/tmp/test")
      "/tmp/test.pdf"

  """
  def read(path, output, options \\ %{}) when is_binary(path) do
    options = Map.merge(options, %{c: "tessedit_create_pdf=1"})

    command(path, output, options)

    "#{output}.pdf"
  end
end
