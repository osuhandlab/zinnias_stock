# Proposal for the Zinnia and Stock metagenomic project.
 ## When working with metagenomics, we have to be aware of the **bias** that can arise from our pipeline.
 ### A major bias can arise from which DNA extraction method a researcher choses for their project.
 1. The first part of my project is to decide which DNA extraction kit is giving me quality DNA for the organisms I am interested in, as well as which seed processing method (chopping, soaking, or grinding) is producing the best quality DNA prior to sequening. 
 2. Then, once the DNA has been checked for quality, which ever method gave the best DNA quality, will then be choosen for sequencing, and will undergo metagenomic analysis.
 3. The pipeline will follow the Nextflow pipeline model with some input from Hannah and her work, as well as the postdoc in my lab, Rachel: Kraken2 for taxonomic classification, visualization with Pavion, adapter and quality trimming with FastQC and trimmomatic, assembly with SPAdes or METASPAdes, binning with Kraken2 tools extension, and then evaluation and quality control with BUSCO, CheckM, and reporting with MultiQC.
 - The data I will be working with is sequencing data and outputs include metagenomic data?
 - I plan on separating the inputs and outputs from each step into their own subsection, so I do not get confused on where the files are going in the next step of the pipeline, with each step having a quality control step prior to running the next software on the OSC. 
 - Scripts will be used to help organize and run loops, as there will be millions of reads to parse through. 
 - I am uncertain about how far I will get, as I often get overwhelemed. 
 - I chose this project because it is useful for my research, and I want to get better at coding so that I can continue to do work like this. I think I should focus on coding and creating a reproducible workflow, since I tend to get stuck on the details.