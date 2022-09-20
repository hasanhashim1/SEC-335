#!/bin/bash
h=$1
s=$2

echo "dns resolution for $h" | for i in $(seq 0 254); do
  nslookup $h.$i $s | grep "name"
done
