#!/bin/bash
N=284   # num files - 1
#N=1   # num files - 1 (testing)
for i in $(seq 0 $N)
do
	qsub -cwd -o std/out/$i.out -e std/err/$i.err run.sh ~/utils/matlab_batcher.sh runHomoCompute $i
done
