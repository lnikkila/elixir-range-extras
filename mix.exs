defmodule RangeExtras.Mixfile do
  use Mix.Project

  def project do
    [app: :range_extras,
     name: "RangeExtras",
     version: "0.1.0",
     elixir: "~> 1.1",
     description: description,
     package: package,
     deps: deps,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: [coveralls: :test]]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    []
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

  defp description do
    """
    Elixir range utilities: constant-time random sampling and set operations.
    """
  end

  defp package do
    [links: %{"GitHub" => "https://github.com/lnikkila/elixir-range-extras"},
     maintainers: ["Leo Nikkilä"],
     licenses: ["ISC"]]
  end
end
