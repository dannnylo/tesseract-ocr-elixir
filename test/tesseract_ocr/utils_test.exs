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

  test "support all default command line options" do
    assert TesseractOcr.Utils.command_options("test/resources/world.png", "stdout", %{
             lang: "eng",
             oem: "1",
             c: ["tessedit_char_whitelist=A10", "tessedit_do_invert=1"],
             psm: 3,
             dpi: 72,
             tessdata_dir: "/home/tesseract",
             user_patterns: "/home/tesseract-dir/patterns",
             user_words: "/home/tesseract-dir/words"
           }) === [
             "test/resources/world.png",
             "stdout",
             "-l",
             "eng",
             "--oem",
             "1",
             "--dpi",
             "72",
             "--psm",
             "3",
             "--tessdata-dir",
             "/home/tesseract",
             "--user-patterns",
             "/home/tesseract-dir/patterns",
             "--user-words",
             "/home/tesseract-dir/words",
             "-c",
             "tessedit_char_whitelist=A10",
             "-c",
             "tessedit_do_invert=1"
           ]
  end
end
