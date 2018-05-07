defmodule TesseractOcrTest do
  use ExUnit.Case
  doctest TesseractOcr

  test "read a image" do
    assert TesseractOcr.read("./test/resources/blank.tif") == ""
    assert TesseractOcr.read("./test/resources/test.tif") == "43XF"
    assert TesseractOcr.read("./test/resources/test.png") == "HW9W"
  end

  test "command options generate the options to shell command" do
    assert TesseractOcr.command_options("test/resources/world.png", %{lang: "por", oem: "1"}) === ["test/resources/world.png", "stdout", "--lang por", "--oem 1"]
    assert TesseractOcr.command_options("test/resources/world.png", %{psm: "1"}) === ["test/resources/world.png", "stdout", "--psm 1"]
    assert TesseractOcr.command_options("test/resources/world.png", %{}) === ["test/resources/world.png", "stdout"]
  end
end
