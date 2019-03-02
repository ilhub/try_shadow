# Empty

Benchmarks for `try` and `case` Elixir constructions.

## Run benchmarks

```bash
$ mix run lib/benchmark.exs
```

## Disassemble code

```bash
$ mix disassemble
```

The code can be found in `./extra/try_shadow.dis`

## Results

```
Operating System: macOS
CPU Information: Intel(R) Core(TM) i5-7360U CPU @ 2.30GHz
Number of Available Cores: 4
Available memory: 8 GB
Elixir 1.7.4
Erlang 21.0

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 0 ns
parallel: 1
inputs: Big (10 Million), Middle (100 Thousand), Small (1 Thousand)
Estimated total run time: 1.75 min

##### With input Small (1 Thousand) #####
Name            ips        average  deviation         median         99th %
try         19.25 K       51.94 μs    ±14.30%       49.99 μs       82.99 μs
with        18.46 K       54.17 μs    ±22.54%       50.99 μs       99.99 μs
case        18.45 K       54.20 μs    ±28.60%       48.99 μs       91.99 μs
throw        9.94 K      100.65 μs    ±37.49%       91.99 μs      197.99 μs
raise        1.29 K      774.58 μs    ±27.27%      748.99 μs     1321.19 μs

Comparison: 
try         19.25 K
with        18.46 K - 1.04x slower
case        18.45 K - 1.04x slower
throw        9.94 K - 1.94x slower
raise        1.29 K - 14.91x slower

##### With input Middle (100 Thousand) #####
Name            ips        average  deviation         median         99th %
case         198.08        5.05 ms     ±5.96%        4.96 ms        6.83 ms
try          192.84        5.19 ms     ±4.75%        5.11 ms        6.35 ms
with         191.13        5.23 ms     ±5.23%        5.16 ms        6.05 ms
throw         95.59       10.46 ms     ±5.02%       10.36 ms       12.28 ms
raise         15.42       64.86 ms     ±2.57%       64.64 ms       71.17 ms

Comparison: 
case         198.08
try          192.84 - 1.03x slower
with         191.13 - 1.04x slower
throw         95.59 - 2.07x slower
raise         15.42 - 12.85x slower

##### With input Big (10 Million) #####
Name            ips        average  deviation         median         99th %
try            1.91      523.63 ms     ±2.73%      521.14 ms      560.83 ms
with           1.89      529.23 ms     ±1.56%      525.62 ms      542.41 ms
case           1.84      542.03 ms     ±5.61%      535.21 ms      598.82 ms
throw          0.96     1045.53 ms     ±1.24%     1041.83 ms     1067.51 ms
raise         0.166     6038.49 ms     ±0.00%     6038.49 ms     6038.49 ms

Comparison: 
try            1.91
with           1.89 - 1.01x slower
case           1.84 - 1.04x slower
throw          0.96 - 2.00x slower
raise         0.166 - 11.53x slower
```