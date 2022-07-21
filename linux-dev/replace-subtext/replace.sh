#!/bin/bash

cp original.txt result.txt

sed -i '/^NUMBERS=/ s/two four/two three four/' result.txt
