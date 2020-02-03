defmodule Avetmiss.MixProject do
  use Mix.Project

  @version "0.1.5"
  @github "https://github.com/ryan-senn/avetmiss"

  def project do
    [
      app: :avetmiss,
      version: @version,
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      source_url: @github
    ]
  end

  def application do
    [
      extra_applications: []
    ]
  end

  defp deps do
    [
      {:typed_struct, "~> 0.1.4"},
      {:word_smith, "~> 0.2.0"}
    ]
  end

  defp description() do
    "Elixir library to generate AVETMISS reports"
  end

  defp package() do
    [
      maintainers: ["Ryan Senn"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => @github}
    ]
  end
end
