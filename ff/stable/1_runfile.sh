#!/bin/bash
#SBATCH --job-name=stab-wa
#SBATCH --nodes=1
#SBATCH --time=0-36
#SBATCH --account=isda
#SBATCH --mail-user=emmanuel.branlard@nrel.gov
#SBATCH --mail-type BEGIN,END,FAIL              # Send e-mail when job begins, ends or fails
#SBATCH -o slurm-%x.log                      # Output %j: job number
echo "# Working directory:" $SLURM_SUBMIT_DIR
echo "# Job name:" $SLURM_JOB_NAME
echo "# Job ID: " $SLURM_JOBID
echo "# Starting job at: " $(date)

export OMP_NUM_THREADS=104

#ffbin='/home/ebranlar/_bin/FAST.Farm-wat-gcc'
#source /home/ebranlar/_env/ebra-gcc.sh

ffbin='/home/ebranlar/_bin/FAST.Farm-wat-intel'
source /home/ebranlar/_env/ebra-intel.sh

echo "# Binary: " $ffbin

$ffbin FF-WAT.fstf 2>&1

echo "# Ending job at: " $(date)
