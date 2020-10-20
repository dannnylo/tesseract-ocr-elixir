defmodule TesseractOcr do
  @moduledoc """
  Documentation for TesseractOcr.
  """

  import TesseractOcr.Utils

  @doc """
  This function reads the chars on image by OCR.

  ## Examples

      iex> TesseractOcr.read("test/resources/world.png")
      "world"

  """
  def read(path, options \\ %{}) when is_binary(path) do
    path
    |> command("stdout", options)
    |> elem(0)
    |> String.trim()
  end
end
