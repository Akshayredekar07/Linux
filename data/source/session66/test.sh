#!/bin/bash
i=1
#until [ $i -gt 5 ]
#until [ false ]
until [ ! ture ]
do
	echo "$i"
	let i++
done
