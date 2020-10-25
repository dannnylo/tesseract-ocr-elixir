defmodule TesseractOcr.MixProject do
  use Mix.Project

  @source_url "https://github.com/dannnylo/tesseract-ocr-elixir"

  def project do
    [
      app: :tesseract_ocr,
      version: "0.1.5",
      elixir: "~> 1.6",
      description: description(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      docs: docs(),
      test_coverage: [tool: ExCoveralls]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    """
    Elixir wrapper for Tesseract OCR, an open source text recognition engine.
    """
  end

  defp deps do
    [
      {:secure_random, ">= 0.0.0"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:credo, "~> 1.2.0", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.12", only: :test}
    ]
  end

  defp package() do
    [
      maintainers: ["Danilo Jeremias da Silva"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      extras: [
        "README.md"
      ]
    ]
  end
end
