#!/usr/bin/env bash
#########################################
# Function:		Performance analysis
# Usage:		bash sys-profiller.sh <process_name>
# Author:		jiasir(Taio)
# E-Mail:		jiasir@icloud.com
# Version:		1.0
#########################################

if [[ $1 == "" ]]; then
	echo "Usage: bash $0 <process_name>"
	exit 1
fi

nsamples=1
sleeptime=0
pid=$(pidof $1)

for x in $(seq 1 $nsamples)
  do
    gdb -ex "set pagination 0" -ex "thread apply all bt" -batch -p $pid
    sleep $sleeptime
  done | \
awk '
  BEGIN { s = ""; } 
  /^Thread/ { print s; s = ""; } 
  /^\#/ { if (s != "" ) { s = s "," $4} else { s = $4 } } 
  END { print s }' | \
sort | uniq -c | sort -r -n -k 1,1