i#!/bin/bash

# Generate a unique identifier
unique_id=$(date +%s%N | md5sum | head -c 20)

# Remove hyphens and replace with underscores
clean_id=${unique_id//-/_}

echo "$clean_id"
