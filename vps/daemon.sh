#!/bin/bash
while true
do
	ssh -R 33555:localhost:8389 hja@mhy12345.xyz -p 2233 bash idle.sh & ssh_pid=$!
	echo ssh pid is $ssh_pid
	while true
	do
		sleep 30s
		curl http://mhy12345.xyz:33555
		if [ $? != 52 ]
		then
			echo Connection broken
			kill -9 $ssh_pid
			kill -9 $ssh_pid
			kill -9 $ssh_pid
			kill -9 $ssh_pid
			break
		else
			date
		fi
	done
done
