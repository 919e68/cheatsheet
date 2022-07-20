#!/bin/bash

fdisk /dev/sda

# create DOS partition table
echo "o\n"

# create partition table
echo "n\n"

# set partition type
echo "t\n"
echo "8e\n"

# activate partition
echo "a\n"

# finalize
echo "w\n"