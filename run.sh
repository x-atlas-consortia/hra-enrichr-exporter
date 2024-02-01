#!/bin/bash

DIR=HRA # Output directory
OUTPUT=$DIR/human-reference-atlas.enrichr.tsv # Output Enrichr file
endpoint=https://lod.humanatlas.io/sparql  # Official HRA SPARQL Endpoint

sparql() {
  curl -s -H "Accept: text/tab-separated-values" --data-urlencode "query@${1}" $endpoint
}

HRA_VERSION=`sparql ./queries/hra-version.rq | tail -n +2`
GRAPHS=`sparql ./queries/asctb-with-bm-graphs.rq | tail -n +2`
echo $HRA_VERSION > $DIR/VERSION  # Save the current HRA Version

rm -f $OUTPUT
for graph in $GRAPHS; do
  echo $graph 
  cat ./queries/enrichr-etl.rq | perl -pe "s|\\Q#{{GRAPH}}\\E|FROM ${graph}|g" > .temp
  sparql .temp | tail -n +2 | perl -pe 's/\|/\t/g' >> $OUTPUT
done

rm -f .temp
