defmodule TryShadow do
  def to_Case(number) do
    case dumb_worker(number) do
      {:ok, number} -> number
      {:error, reason} -> reason
    end
  end

  def to_try(number) do
    dumb_worker(number)
  else
    {:ok, number} -> number
    {:error, reason} -> reason
  end

  def to_throw(number) do
    throw_worker(number)
  catch
    {:ok, number} -> number
    {:error, reason} -> reason
  end

  def to_raise(number) do
    raise_worker(number)
  rescue
    e -> e
  end

  def dumb_worker(number) when rem(number, 2) == 0, do: {:error, "odds are bad!"}
  def dumb_worker(number), do: {:ok, number}

  def throw_worker(number) when rem(number, 2) == 0, do: throw({:error, "odds are bad!"})
  def throw_worker(number), do: throw({:ok, number})

  def raise_worker(number) when rem(number, 2) == 0, do: raise "odds are bad!"
  def raise_worker(number), do: number
end

inputs = %{
  "Small (1 Thousand)" => 1..1_000,
  "Middle (100 Thousand)" => 1..100_000,
  "Big (10 Million)" => 1..10_000_000
}

Benchee.run %{
  "try" => fn(range) -> Enum.each(range, &TryShadow.to_try/1) end,
  "case" => fn(range) -> Enum.each(range, &TryShadow.to_try/1) end,
  "throw" => fn(range) -> Enum.each(range, &TryShadow.to_throw/1) end,
  "raise" => fn(range) -> Enum.each(range, &TryShadow.to_raise/1) end,
}, inputs: inputs
