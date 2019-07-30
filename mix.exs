defmodule TesseractOcr.MixProject do
  use Mix.Project

  def project do
    [
      app: :tesseract_ocr,
      version: "0.1.1",
      elixir: "~> 1.6",
      description: "A wrapper for Tesseract OCR",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      deps: deps(),
      package: package(),
      source_url: "https://github.com/dannnylo/tesseract-ocr-elixir"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
    ]
  end

  defp package() do
    [
      maintainers: ["Danilo Jeremias da Silva"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/dannnylo/tesseract-ocr-elixir"}
    ]
  end
end
