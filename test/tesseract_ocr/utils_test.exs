defmodule TesseractOcr.UtilsTest do
  use ExUnit.Case
  doctest TesseractOcr.Utils

  test "command options generate the options to shell command" do
    assert TesseractOcr.Utils.command_options("test/resources/world.png", "stdout", %{lang: "por", oem: "1"}) ===
             ["test/resources/world.png", "stdout", "-l", "por", "--oem", "1"]

    assert TesseractOcr.Utils.command_options("test/resources/world.png", "stdout", %{psm: "1"}) === [
             "test/resources/world.png",
             "stdout",
             "--psm",
             "1"
           ]

    assert TesseractOcr.Utils.command_options("test/resources/world.png", "stdout", %{}) === [
             "test/resources/world.png",
             "stdout"
           ]
  end
end
