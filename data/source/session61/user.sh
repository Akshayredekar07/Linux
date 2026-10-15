#! /bin/bash

user=$(whoami)
if [ user != "root" ]; then
	echo "Current user is not root user"
else
	echo "Current user is root user"
fi

echo "Top 5 running processes are: "
ps -ef | head -6
