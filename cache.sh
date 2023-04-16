#!/bin/bash

# Get the CPU cache size for each level of cache
L1_cache_size=$(lscpu | grep "L1d cache" | awk '{print $3}')
L2_cache_size=$(lscpu | grep "L2 cache" | awk '{print $3}')
L3_cache_size=$(lscpu | grep "L3 cache" | awk '{print $3}')

# Save the CPU cache sizes to a file in the current directory
echo "Node $PBS_NODENUM: 
L1 cache size: $L1_cache_size, 
L2 cache size: $L2_cache_size, 
L3 cache size: $L3_cache_size" >>./output/cache_${PBS_ARRAYID}.txt
