#!/bin/bash

cp original.txt result.txt

sed -i '/USERNAME/c\This line is removed by the admin.' ./result.txt