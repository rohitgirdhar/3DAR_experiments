#!/bin/bash
N=95   # num files - 1
#N=1   # num files - 1 (testing)
START=46 # change!!
for i in $(seq $START $N)
do
	./run.sh ~/utils/matlab_batcher.sh runHomoCompute $i
done
