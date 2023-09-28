#!/bin/bash

# Check if an argument (image name) is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <new_image_name>"
  exit 1
fi

# Define the new image name
new_image_name="$1"

# Specify the path to your values.yaml file
values_yaml="values.yaml"

# Use awk to update the image value
awk -v new_image="$new_image_name" '/compound-interest:/,/^$/{sub(/^  image:.*/, "  image: " new_image)} 1' $values_yaml > tmpfile && mv tmpfile $values_yaml

echo "Image name updated to $new_image_name in $values_yaml"
