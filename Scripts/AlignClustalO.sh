#!/bin/bash
cat ToAlign.txt | parallel -j 46 "clustalo -i ./Unaligned/{} --threads=1 --iter=2 -o ./ClustalAligned/{}.realigned"
