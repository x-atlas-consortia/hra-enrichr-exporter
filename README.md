# hra-enrichr-exporter

A script for exporting a subset of the HRA Knowledge Graph to Enrichr format. The latest results are stored in the [HRA](./HRA/) directory.

## Installation

A standard unix environment should have all the tools needed, including bash, perl, curl, and tail.

## Running

To run the exporter, simply run `bash run.sh` which will run the required sparql queries, a minor transform, and output results to the HRA directory.

## Results

An Enrichr compatible TSV file that has a characterizing genes per cell type per anatomical structure is outputted to [HRA/human-reference-atlas.enrichr.tsv](./HRA/human-reference-atlas.enrichr.tsv).
