inputs = %{
  "Small (1 Thousand)" => 1..1_000,
  "Middle (100 Thousand)" => 1..100_000,
  "Big (10 Million)" => 1..10_000_000
}

Benchee.run %{
  "try" => fn(range) -> Enum.each(range, &TryShadow.to_try/1) end,
  "case" => fn(range) -> Enum.each(range, &TryShadow.to_case/1) end,
  "throw" => fn(range) -> Enum.each(range, &TryShadow.to_throw/1) end,
  "raise" => fn(range) -> Enum.each(range, &TryShadow.to_raise/1) end,
}, inputs: inputs
