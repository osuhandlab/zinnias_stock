#!/bin/bash
#SBATCH --account=PAS2700
#SBATCH --time=48:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --output=slurm-nfc_mag2-%j.out
set -euo pipefail

# Load the Nextflow Conda environment
module load miniconda3/23.3.1-py310
conda activate /fs/ess/PAS0471/jelmer/conda/nextflow
export NXF_SINGULARITY_CACHEDIR=software/containers

# Process command-line arguments
if [[ ! "$#" -eq 3 ]]; then
    echo "Error: wrong number of arguments"
    echo "Usage: nfc_mag2.sh <samplesheet> <outdir> <workdir>"
    exit 1
fi
samplesheet=$1
outdir=$2
workdir=$3

# Report
echo "Starting script nfc_mag2.sh"
date

# Create the output dir
mkdir -p results/nfcmag


# we used this glob in --input to indicate the files will be scripts and the '' are used for nextflow to know where to find them
# Run the workflow
echo "Running Nextflow workflow..."
nextflow run nf-core/mag -r 2.5.4 \
    -profile singularity \
    --input "$samplesheet" \
    --outdir "$outdir" \
    -work-dir "$workdir" \
    -ansi-log false \
    -resume #> "$outdir/slurm-nfc_mag2-${SLURM_JOB_ID}.log" 2>&1

# Report
echo "Done with script nfc_mag2.sh"
date

