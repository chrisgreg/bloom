defmodule Bloom.MixProject do
  use Mix.Project

  def project do
    [
      app: :bloom,
      version: "0.0.8",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      app_src: ["lib", "lib/bloom/components"],
      package: package(),
      templates: ~w(priv/templates),
      description: "An Opinionated extension to Phoenix core_components."
    ]
  end

  defp package() do
    [
      name: "bloom",
      files: ~w(lib/tasks priv/templates .formatter.exs mix.exs README* LICENSE*
                CHANGELOG*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/chrisgreg/bloom"}
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
      {:phoenix, "~> 1.7.6"},
      {:phoenix_live_view, "~> 0.19"},
      {:phoenix_html, ">= 3.3.3"},
      {:mox, "~> 1.0", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:tailwind_formatter, "~> 0.4.0", only: [:dev, :test], runtime: false}
    ]
  end
end
