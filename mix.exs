defmodule TryShadow.MixProject do
  use Mix.Project

  def project do
    [
      app: :try_shadow,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [{:benchee, "~> 0.14", only: :dev}]
  end

  defp aliases() do
    [
      disassemble: &disassemble/1
    ]
  end

  defp disassemble(_) do
    f = './_build/dev/lib/try_shadow/ebin/Elixir.TryShadow.beam'
    result = :beam_lib.chunks(f,[:abstract_code])
    {:ok,{_,[{:abstract_code,{_,ac}}]}} = result
    File.write("./extra/try_shadow.dis", :erl_prettypr.format(:erl_syntax.form_list(ac)))
  end
end
