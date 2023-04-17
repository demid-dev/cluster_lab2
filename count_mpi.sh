#!/bin/bash

nodes=() # Nodes list

# Get unique nodes
for line in $(grep "Hello world from processor" mpi*); do
    node=$(echo $line | awk '{print $4}')
    if [[ ! " ${nodes[@]} " =~ " $node " ]]; then
        nodes+=($node)
    fi
done

# Get MPI processes count
for node in "${nodes[@]}"; do
    count=$(grep -c "Hello world from processor $node" mpi*)
    echo "MPI processes countt for node $node: $count"
done
