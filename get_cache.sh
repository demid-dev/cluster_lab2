#!/bin/bash

# Get the CPU cache size for each level of cache
L1_cache_size=$(lscpu | grep "L1d cache" | awk '{print $3}')
L2_cache_size=$(lscpu | grep "L2 cache" | awk '{print $3}')
L3_cache_size=$(lscpu | grep "L3 cache" | awk '{print $3}')

# Check if the filename was provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Save the CPU cache sizes to the specified file
echo "L1 cache size: $L1_cache_size" >>"$1"
echo "L2 cache size: $L2_cache_size" >>"$1"
echo "L3 cache size: $L3_cache_size" >>"$1"
