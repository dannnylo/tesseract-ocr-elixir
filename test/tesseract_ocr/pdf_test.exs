defmodule TesseractOcr.PDFTest do
  use ExUnit.Case
  doctest TesseractOcr.PDF

  test "read image and saves on a PDF" do
    pdf_path = TesseractOcr.PDF.read("test/resources/world.png", "test/test", %{lang: "eng", psm: 7, oem: 1})

    assert pdf_path === "test/test.pdf"
    File.rm(pdf_path)
  end
end
