#!/bin/bash
set -euo pipefail

# Path to the Nextflow MAG script
NF_MAG_SCRIPT="/fs/ess/PAS2700/users/zenmckenzie14/finalproject/nfcmag/scripts/nfc_mag2.sh"

# Create a config file for batch job submissions
echo "
process.executor='slurm'
process.clusterOptions='--account=PAS2700'
" > nextflow.config

# Input data, output directory, and working directory
INPUT_DATA="/fs/ess/PAS2700/users/zenmckenzie14/finalproject/nfcmag/ForZen/gz"
OUTPUT_DIR="resultsnfcmag"
WORK_DIR="/fs/scratch/PAS2700/$USER/nfc-mag"
# we are going to use absolute paths because the nfc_mag.sh script needs absolute paths and not relative paths
# Check if the Nextflow MAG script exists
if [ ! -f "$NF_MAG_SCRIPT" ]; then
    echo "Error: nfc_mag2.sh script not found at: $NF_MAG_SCRIPT"
    exit 1
fi

# Check if input data, output directory, and working directory exist
if [ ! -d "$INPUT_DATA" ]; then
    echo "Error: Input data directory not found: $INPUT_DATA"
    exit 1
fi

#This creates the samplesheet 
echo "sample,group,short_reads_1,short_reads_2,long_reads" > samplesheet.csv 
ls "$INPUT_DATA"/* | paste -d, - - | sed 's/$/,/' | sed -E 's@.*/(.*)_R1@\1,0,&@' >> samplesheet.csv 
cat samplesheet.csv 

# Run the Nextflow MAG script
echo "Starting Nextflow MAG pipeline..."
sbatch "$NF_MAG_SCRIPT" samplesheet.csv "$OUTPUT_DIR" "$WORK_DIR" 

# Report completion
echo "Nextflow MAG pipeline started."
