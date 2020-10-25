# TesseractOcr

[![travis-ci.org](https://api.travis-ci.org/dannnylo/tesseract-ocr-elixir.svg)](https://travis-ci.org/dannnylo/tesseract-ocr-elixir)
[![hex.pm](https://img.shields.io/hexpm/v/tesseract_ocr.svg)](https://hex.pm/packages/tesseract_ocr)
[![hex.pm](https://img.shields.io/badge/docs-hexpm-blue.svg)](https://hexdocs.pm/tesseract_ocr)
[![hex.pm](https://img.shields.io/hexpm/dt/tesseract_ocr.svg)](https://hex.pm/packages/tesseract_ocr)
[![hex.pm](https://img.shields.io/hexpm/l/tesseract_ocr.svg)](https://hex.pm/packages/tesseract_ocr)
[![github.com](https://img.shields.io/github/last-commit/dannnylo/tesseract-ocr-elixir.svg)](https://github.com/dannnylo/tesseract-ocr-elixir/commits/master)

Elixir wrapper for [Tesseract OCR](https://github.com/tesseract-ocr), an open
source text recognition (OCR) Engine.

## Requirements

- Elixir 1.6+ / Erlang OTP 19+
- [Tesseract OCR binary](https://github.com/tesseract-ocr/tesseract/wiki)

## Installation

Add `tesseract_ocr` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tesseract_ocr, "~> 0.1.5"}
  ]
end
```

## Usage

Reading an image file.

```elixir
iex> TesseractOcr.read("test/resources/world.png")
"world"
```

With additional options.

```elixir
iex> TesseractOcr.read("test/resources/world.png", %{lang: 'por', psm: 7, oem: 1})
"world"
```

Get words positions.

```elixir
iex> TesseractOcr.Words.read("test/resources/world.png")
[%{confidence: 95, word: "world", x_end: 185, x_start: 2, y_end: 56, y_start: 2}]
```

Convert image into PDF with text.

```elixir
iex> TesseractOcr.PDF.read("test/resources/world.png", "/tmp/test")
"/tmp/test.pdf"
```
Convert image into TSV with text.

```elixir
iex> TesseractOcr.TSV.read("test/resources/world.png", "/tmp/test")
"/tmp/test.tsv"
```
