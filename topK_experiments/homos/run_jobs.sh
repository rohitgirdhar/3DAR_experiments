#!/bin/bash
N=284   # num files - 1
for i in $(seq 0 $N)
do
	qsub -cwd -o std/out/$i.out -e std/err/$i.err ~/utils/matlab_batcher.sh runHomoCompute $i
done
