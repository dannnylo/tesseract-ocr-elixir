defmodule TesseractOcr.WordsTest do
  use ExUnit.Case
  doctest TesseractOcr.Words

  test "read words of an image " do
    assert TesseractOcr.Words.read("test/resources/world.png", %{lang: "eng", psm: 7, oem: 1}) ===
             [%{confidence: 95, word: "world", x_end: 185, x_start: 2, y_end: 56, y_start: 2}]
  end
end
