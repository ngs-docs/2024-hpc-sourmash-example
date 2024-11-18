#!/bin/bash -login
#SBATCH -p low2                # partition, or queue, to assign to
#SBATCH -J sourmash            # name for job
#SBATCH -N 1                   # one "node", or computer
#SBATCH -n 1                   # one task for this node
#SBATCH -c 2                  # cores per task
#SBATCH -t 10:00                 # ask for 10m
#SBATCH --mem=3000             # memory (3,000 mb = 3gb)
#SBATCH --mail-type=ALL
#SBATCH --mail-user=titus@idyll.org

# initialize conda
module load mamba

# activate your desired conda environment
conda activate smash

# fail on weird errors
set -o nounset
set -o errexit
set -x

# go to the directory you ran 'sbatch' in, OR just hardcode it...
cd $SLURM_SUBMIT_DIR

# run the snakemake!
/usr/bin/time -v sourmash scripts manysearch $1 /group/ctbrowngrp/sourmash-db/gtdb-rs214/gtdb-rs214-reps.k31.zip -o $1.csv -c 2

# print out various information about the job
env | grep SLURM            # Print out values of the current jobs SLURM environment variables

scontrol show job ${SLURM_JOB_ID}     # Print out final statistics about resource uses before job exits

sstat --format 'JobID,MaxRSS,AveCPU' -P ${SLURM_JOB_ID}.batch
