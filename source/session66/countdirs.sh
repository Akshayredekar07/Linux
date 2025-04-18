#!/bin/bash

for name in *
do
	if [ -f $name ]; then
	echo "$name"
	fi
done
