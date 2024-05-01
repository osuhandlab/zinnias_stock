#!/bin/bash
set -euo pipefail

# Specify the directory where your FastQ files are located
input_directory="/fs/ess/PAS2700/users/zenmckenzie14/finalproject/nfcmag/ForZen"



# Navigate to the input directory
cd "$input_directory" || exit

# Iterate over each FastQ file in the input directory
for fastq_file in *.fastq; do
    
    echo "fastq file conversion for $fastq_file"
    # Convert FastQ to compressed FastQ.gz
    gzip "$fastq_file" 
    
    # Optionally, you can remove the original FastQ file after compression
    # rm "$fastq_file"
done

echo "Conversion complete."
