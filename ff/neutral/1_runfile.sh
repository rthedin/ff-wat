#!/bin/bash
#SBATCH --job-name=neut-wa
#SBATCH --nodes=1
#SBATCH --time=0-36
#SBATCH --account=isda
#SBATCH --mail-user=emmanuel.branlard@nrel.gov
#SBATCH --mail-type BEGIN,END,FAIL              # Send e-mail when job begins, ends or fails
#SBATCH -o slurm-%x.log                      # Output
echo "# Working directory:" $SLURM_SUBMIT_DIR
echo "# Job name:" $SLURM_JOB_NAME
echo "# Job ID: " $SLURM_JOBID
echo "# Starting job at: " $(date)

# ffbin='/home/ebranlar/_bin/FAST.Farm-vWAT'
# source /home/ebranlar/_env/ebra.sh

ffbin='/home/ebranlar/_bin/FAST.Farm-vWAT-Regis-Nrel'
source /home/ebranlar/_env/regis-nrel.sh

ffbin='/home/ebranlar/_bin/FAST.Farm-wat-gcc'
source /home/ebranlar/_env/ebra-gcc.sh

$ffbin FF-WAT.fstf

echo "# Ending job at: " $(date)
