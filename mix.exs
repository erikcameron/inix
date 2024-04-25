defmodule Inix.MixProject do
  use Mix.Project

  def project do
    [
      app: :inix,
      version: "0.1.0",
      elixir: "~> 1.17-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Inix.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:erlexec, "~> 2.0"},
      {:maxine, "~> 1.0"},
      {:phoenix_pubsub, "~> 2.0"}
    ]
  end
end
