#!/bin/bash

fdisk /dev/sda

# create DOS partition table
echo "o\n"

# create partition table
echo "n\n"
echo "\n" # partition type   - select default
echo "\n" # partition number - select default
echo "\n" # first sector     - select default
echo "\n" # last sector      - select default

# set partition type
echo "t\n"
echo "8e\n"

# activate partition
echo "a\n"

# finalize
echo "w\n"