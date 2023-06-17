# AWS PostgreSQL 15.2: RDS vs. RDS Performance and cost comparison

For full writeup please refer to the article [here](https://aviitala.com/posts/aws-rds-vs-aurora-postgresql-performance-comparison/).

## Bring up infrastructure

You will need to configure certain sensitive parts of the infrastructure - see the [hidden.tfexample](./hidden.tfexample) file. Update as needed and rename to `hidden.tf` before running the below commands.

```bash
make init  # initialize terraform
make apply # create infrastructure
```

## Raw results

<summary>
 <Details>


## Aurora

### Iteration 1: 4 jobs, 4 clients

scaling factor: 5000
query mode: simple
number of clients: 4
number of threads: 4
duration: 600 s
number of transactions actually processed: 274822
latency average = 8.733 ms
initial connection time = 21.170 ms
tps = 458.047171 (without initial connection time)

### Iteration 1: 8 jobs, 8 clients

query mode: simple
number of clients: 8
number of threads: 8
duration: 600 s
number of transactions actually processed: 433761
latency average = 11.065 ms
initial connection time = 39.044 ms
tps = 722.968423 (without initial connection time)

### Iteration 1: 12 jobs, 12 clients

scaling factor: 5000
query mode: simple
number of clients: 12
number of threads: 12
duration: 600 s
number of transactions actually processed: 558265
latency average = 12.896 ms
initial connection time = 55.670 ms
tps = 930.495133 (without initial connection time)

### Iteration 2: 4 jobs, 4 clients

scaling factor: 5000
query mode: simple
number of clients: 4
number of threads: 4
duration: 600 s
number of transactions actually processed: 264303
latency average = 9.080 ms
initial connection time = 22.646 ms
tps = 440.514577 (without initial connection time)

### Iteration 2: 8 jobs, 8 clients

scaling factor: 5000
query mode: simple
number of clients: 8
number of threads: 8
duration: 600 s
number of transactions actually processed: 428963
latency average = 11.189 ms
initial connection time = 61.718 ms
tps = 714.993935 (without initial connection time)

### Iteration 2: 12 jobs, 12 clients

scaling factor: 5000
query mode: simple
number of clients: 12
number of threads: 12
duration: 600 s
number of transactions actually processed: 557441
latency average = 12.915 ms
initial connection time = 57.655 ms
tps = 929.127492 (without initial connection time)

### Iteration 3: 4 jobs, 4 clients

query mode: simple
number of clients: 4
number of threads: 4
duration: 600 s
number of transactions actually processed: 265271
latency average = 9.047 ms
initial connection time = 21.618 ms
tps = 442.128341 (without initial connection time)

### Iteration 3: 8 jobs, 8 clients

scaling factor: 5000
query mode: simple
number of clients: 8
number of threads: 8
duration: 600 s
number of transactions actually processed: 433392
latency average = 11.075 ms
initial connection time = 39.829 ms
tps = 722.355663 (without initial connection time)

### Iteration 3: 12 jobs, 12 clients

scaling factor: 5000
query mode: simple
number of clients: 12
number of threads: 12
duration: 600 s
number of transactions actually processed: 549315
latency average = 13.107 ms
initial connection time = 54.778 ms
tps = 915.569175 (without initial connection time)

### Iteration 4: 4 jobs, 4 clients

scaling factor: 5000
query mode: simple
number of clients: 4
number of threads: 4
duration: 600 s
number of transactions actually processed: 267359
latency average = 8.976 ms
initial connection time = 25.396 ms
tps = 445.610859 (without initial connection time)

### Iteration 4: 8 jobs, 8 clients

scaling factor: 5000
query mode: simple
number of clients: 8
number of threads: 8
duration: 600 s
number of transactions actually processed: 433075
latency average = 11.083 ms
initial connection time = 38.146 ms
tps = 721.814897 (without initial connection time)

### Iteration 4: 12 jobs, 12 clients

scaling factor: 5000
query mode: simple
number of clients: 12
number of threads: 12
duration: 600 s
number of transactions actually processed: 551536
latency average = 13.054 ms
initial connection time = 57.123 ms
tps = 919.270818 (without initial connection time)

---

## RDS

### Iteration 1: 4 jobs,4 clients

scaling factor: 5000
query mode: simple
number of clients: 4
number of threads: 4
duration: 600 s
number of transactions actually processed: 490713
latency average = 4.891 ms
initial connection time = 21.956 ms
tps = 817.880615 (without initial connection time)

### Iteration 1: 8 jobs, 8 clients

scaling factor: 5000
query mode: simple
number of clients: 8
number of threads: 8
duration: 600 s
number of transactions actually processed: 541273
latency average = 8.868 ms
initial connection time = 38.660 ms
tps = 902.133131 (without initial connection time)

### Iteration 1: 12 jobs, 12 clients

scaling factor: 5000
query mode: simple
number of clients: 12
number of threads: 12
duration: 600 s
number of transactions actually processed: 485587
latency average = 14.841 ms
initial connection time = 69.148 ms
tps = 808.553664 (without initial connection time)

### Iteration 2: 4 jobs, 4 clients

scaling factor: 5000
query mode: simple
number of clients: 4
number of threads: 4
duration: 600 s
number of transactions actually processed: 46225
latency average = 51.952 ms
initial connection time = 22.243 ms
tps = 76.994356 (without initial connection time)

### Iteration 2: 8 jobs, 8 clients

scaling factor: 5000
query mode: simple
number of clients: 8
number of threads: 8
duration: 600 s
number of transactions actually processed: 50419
latency average = 95.199 ms
initial connection time = 43.627 ms
tps = 84.034334 (without initial connection time)

### Iteration 2: 12 jobs, 12 clients

scaling factor: 5000
query mode: simple
number of clients: 12
number of threads: 12
duration: 600 s
number of transactions actually processed: 55617
latency average = 129.472 ms
initial connection time = 58.147 ms
tps = 92.684093 (without initial connection time)

### Iteration 3: 4 jobs, 4 clients

scaling factor: 5000
query mode: simple
number of clients: 4
number of threads: 4
duration: 600 s
number of transactions actually processed: 39491
latency average = 60.774 ms
initial connection time = 22.850 ms
tps = 65.817365 (without initial connection time)

### Iteration 3: 8 jobs, 8 clients

scaling factor: 5000
query mode: simple
number of clients: 8
number of threads: 8
duration: 600 s
number of transactions actually processed: 49588
latency average = 96.830 ms
initial connection time = 43.235 ms
tps = 82.618602 (without initial connection time)

### Iteration 3: 12 jobs, 12 clients

query mode: simple
number of clients: 12
number of threads: 12
duration: 600 s
number of transactions actually processed: 54468
latency average = 132.208 ms
initial connection time = 59.354 ms
tps = 90.765844 (without initial connection time)

### Iteration 4: 4 jobs, 4 clients

query mode: simple
number of clients: 4
number of threads: 4
duration: 600 s
number of transactions actually processed: 45062
latency average = 53.267 ms
initial connection time = 21.892 ms
tps = 75.093289 (without initial connection time)

### Iteration 4: 8 jobs, 8 clients

scaling factor: 5000
query mode: simple
number of clients: 8
number of threads: 8
duration: 600 s
number of transactions actually processed: 61648
latency average = 77.872 ms
initial connection time = 59.096 ms
tps = 102.733042 (without initial connection time)

### Iteration 4: 12 jobs, 12 clients

scaling factor: 5000
query mode: simple
number of clients: 12
number of threads: 12
duration: 600 s
number of transactions actually processed: 53857
latency average = 133.679 ms
initial connection time = 93.852 ms
tps = 89.767321 (without initial connection time)

</summary>