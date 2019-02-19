defmodule TryShadow do
  def to_case(number) do
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
