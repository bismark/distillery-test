defmodule DistilleryTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :distillery_test,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      # If I add :erlexec here, I don't need to start Exexec in my supervisor tree *only when running mix!*
      extra_applications: [:logger],#, :erlexec],
      mod: {DistilleryTest.Application, []}
    ]
  end

  defp deps do
    [
      {:distillery, "~> 1.5", runtime: false},
      {:exexec, "~> 0.1.0"}
    ]
  end
end
