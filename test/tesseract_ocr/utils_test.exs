defmodule TesseractOcr.UtilsTest do
  use ExUnit.Case
  doctest TesseractOcr.Utils

  test "command options generate the options to shell command" do
    assert TesseractOcr.Utils.command_options("test/resources/world.png", "stdout", %{
             lang: "por",
             oem: "1"
           }) ===
             ["test/resources/world.png", "stdout", "-l", "por", "--oem", "1"]

    assert TesseractOcr.Utils.command_options("test/resources/world.png", "stdout", %{psm: "1"}) ===
             [
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

  test "allow multiple -c options" do
    assert TesseractOcr.Utils.command_options("test/resources/world.png", "stdout", %{
             lang: "por",
             oem: "1",
             c: ["tessedit_char_whitelist=A", "tessedit_do_invert=0"]
           }) === [
             "test/resources/world.png",
             "stdout",
             "-l",
             "por",
             "--oem",
             "1",
             "-c",
             "tessedit_char_whitelist=A",
             "-c",
             "tessedit_do_invert=0"
           ]
  end

  test "support a single -c option (support the 'old' behaviour)" do
    assert TesseractOcr.Utils.command_options("test/resources/world.png", "stdout", %{
             lang: "por",
             oem: "1",
             c: "tessedit_char_whitelist=A"
           }) === [
             "test/resources/world.png",
             "stdout",
             "-l",
             "por",
             "--oem",
             "1",
             "-c",
             "tessedit_char_whitelist=A"
           ]
  end
end
