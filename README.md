# 2024-hpc-sourmash-example

An example of using sourmash on the HPC, with options for parallelism etc.

## Quickstart

Start in a local clone of the git repo:
```
git clone https://github.com/ngs-docs/2024-hpc-sourmash-example
cd 2024-hpc-sourmash-example
```

Install the necessary software via conda:
```
conda env create -n smash -f environment.yml
```

Activate the conda environment and sketch the genomes:
```
conda activate smash
sourmash sketch dna data/*.fa
```

Now run your commands, like
```!
sourmash scripts manysearch 1.fa.sig /group/ctbrowngrp/sourmash-db/gtdb-rs214/gtdb-rs214-reps.k31.zip -o 1.csv -c 4
```
