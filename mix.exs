defmodule Exoteric.MixProject do
  use Mix.Project

  def project do
    [
      app: :exoteric,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      docs: [
        main: "Exoteric",
        extras: ["README.md"],
        api_reference: false
      ]
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "A random collection of questionably useful Elixir tools."
  end

  defp package() do
    [
      licenses: ["Apache-2.0"],
      links: %{}
    ]
  end

end
