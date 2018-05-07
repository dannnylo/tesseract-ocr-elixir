# TesseractOcr

{<img src="https://api.travis-ci.org/dannnylo/tesseract-ocr-elixir.svg?branch=master" alt="Build Status" />}[https://travis-ci.org/dannnylo/tesseract-ocr-elixir]


This package is a wrapper of Tesseract OCR. Helping to read characters on a image.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `tesseract_ocr` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tesseract_ocr, "~> 0.1.0"}
  ]
end
```

*** Atention: You will need to install the tesseract Ocr application on your operation system. ***
[Instalation wiki][https://github.com/tesseract-ocr/tesseract/wiki]

## Usage
Basic usage:

```elixir
  TesseractOCR.read('path/of/my/image.ext')
```

```elixir
  iex> TesseractOcr.read("test/resources/world.png")
  "world"
```

With options:

```elixir
  iex> TesseractOcr.read("test/resources/world.png", %{lang: 'por', psm: 7, oem: 1})
  "world"
```


Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/tesseract_ocr](https://hexdocs.pm/tesseract_ocr).
