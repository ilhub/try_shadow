# Empty

Benchmarks for `try` and `case` Elixir constructions.

## Run benchmarks

```bash
$ mix run lib/benchmark.exs
```

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
case        19.69 K       50.78 μs    ±27.45%          50 μs          74 μs
try         19.62 K       50.98 μs    ±40.82%          50 μs          73 μs
throw       10.20 K       98.03 μs    ±15.25%          92 μs         160 μs
raise        1.25 K      798.12 μs    ±33.06%         752 μs     1679.59 μs

Comparison: 
case        19.69 K
try         19.62 K - 1.00x slower
throw       10.20 K - 1.93x slower
raise        1.25 K - 15.72x slower

##### With input Middle (100 Thousand) #####
Name            ips        average  deviation         median         99th %
case         196.27        5.10 ms     ±3.97%        5.03 ms        5.86 ms
try          194.86        5.13 ms     ±5.37%        5.05 ms        6.46 ms
throw         97.45       10.26 ms     ±6.06%       10.11 ms       13.15 ms
raise         14.65       68.25 ms    ±15.78%       63.39 ms      110.69 ms

Comparison: 
case         196.27
try          194.86 - 1.01x slower
throw         97.45 - 2.01x slower
raise         14.65 - 13.40x slower

##### With input Big (10 Million) #####
Name            ips        average  deviation         median         99th %
case           1.95         0.51 s     ±0.77%         0.51 s         0.52 s
try            1.94         0.52 s     ±2.64%         0.51 s         0.55 s
throw          0.96         1.05 s     ±4.39%         1.02 s         1.12 s
raise         0.151         6.61 s     ±0.00%         6.61 s         6.61 s

Comparison: 
case           1.95
try            1.94 - 1.01x slower
throw          0.96 - 2.04x slower
raise         0.151 - 12.91x slower
```