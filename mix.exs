defmodule RangeExtras.Mixfile do
  use Mix.Project

  def project do
    [app: :range_extras,
     name: "RangeExtras",
     version: "0.1.0",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     source_url: "https://github.com/lnikkila/elixir-range-extras",
     homepage_url: "https://github.com/lnikkila/elixir-range-extras",
     docs: [extras: ["README.md"]],
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: [coveralls: :test]]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ex_doc, "~> 0.11", only: :dev},
     {:earmark, "~> 0.1", only: :dev},
     {:excoveralls, "~> 0.4", only: :test}]
  end
end
