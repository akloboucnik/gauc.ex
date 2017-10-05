defmodule Gauc.Mixfile do
  use Mix.Project

  def project do
    [
      app: :gauc,
      version: "0.2.0",
      elixir: "~> 1.5",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      compilers: [:rustler] ++ Mix.compilers,
      rustler_crates: rustler_crates(),
      description: description(),
      package: package(),
      deps: deps()
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
      {:rustler, "~> 0.10"},
    ]
  end

  def rustler_crates do
    [
      fintech: [
        path: "native/gauc",
        mode: :debug
      ]
    ]
  end

  defp description() do
    "Elxir Wrapper for Gauc - Rust Wrapper for Couchbase"
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "gauc",
      # These are the default files included in the package
      files:
        [
        "lib",
        "mix.exs",
        "native",
        "README*",
        "LICENSE*"
      ],
      maintainers:
        [
        "Tomas Korcak <korczis@gmail.com>"
      ],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/korczis/gauc.ex"}
    ]
  end
end
