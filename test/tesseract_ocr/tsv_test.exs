defmodule TesseractOcr.TSVTest do
  use ExUnit.Case
  doctest TesseractOcr.TSV

  test "read image and saves on a TSV" do
    tsv_path = TesseractOcr.TSV.read("test/resources/world.png", "test/test", %{lang: "eng", psm: 7, oem: 1})

    assert tsv_path === "test/test.tsv"
    File.rm(tsv_path)
  end
end
