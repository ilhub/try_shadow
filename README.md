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
Estimated total run time: 1.40 min


Benchmarking case with input Big (10 Million)...
Benchmarking case with input Middle (100 Thousand)...
Benchmarking case with input Small (1 Thousand)...
Benchmarking raise with input Big (10 Million)...
Benchmarking raise with input Middle (100 Thousand)...
Benchmarking raise with input Small (1 Thousand)...
Benchmarking throw with input Big (10 Million)...
Benchmarking throw with input Middle (100 Thousand)...
Benchmarking throw with input Small (1 Thousand)...
Benchmarking try with input Big (10 Million)...
Benchmarking try with input Middle (100 Thousand)...
Benchmarking try with input Small (1 Thousand)...

##### With input Small (1 Thousand) #####
Name            ips        average  deviation         median         99th %
case        19.42 K       51.50 μs    ±17.89%          49 μs       83.00 μs
try         19.02 K       52.58 μs    ±19.48%          50 μs          92 μs
throw        9.97 K      100.30 μs    ±24.56%          91 μs         192 μs
raise        1.29 K      775.26 μs    ±29.31%         741 μs     1457.00 μs

Comparison: 
case        19.42 K
try         19.02 K - 1.02x slower
throw        9.97 K - 1.95x slower
raise        1.29 K - 15.05x slower

##### With input Middle (100 Thousand) #####
Name            ips        average  deviation         median         99th %
try          187.37        5.34 ms     ±7.14%        5.24 ms        6.83 ms
case         184.46        5.42 ms    ±11.45%        5.22 ms        8.01 ms
throw         97.25       10.28 ms     ±5.37%       10.24 ms       12.63 ms
raise         15.21       65.73 ms     ±4.63%       64.91 ms       74.54 ms

Comparison: 
try          187.37
case         184.46 - 1.02x slower
throw         97.25 - 1.93x slower
raise         15.21 - 12.32x slower

##### With input Big (10 Million) #####
Name            ips        average  deviation         median         99th %
try            1.89         0.53 s     ±1.64%         0.53 s         0.55 s
case           1.79         0.56 s     ±2.46%         0.56 s         0.58 s
throw          0.95         1.05 s     ±3.38%         1.04 s         1.11 s
raise         0.162         6.18 s     ±0.00%         6.18 s         6.18 s

Comparison: 
try            1.89
case           1.79 - 1.05x slower
throw          0.95 - 1.99x slower
raise         0.162 - 11.68x slower
```