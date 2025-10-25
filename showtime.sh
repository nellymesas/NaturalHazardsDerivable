#!/bin/sh
echo "Showtime.sh - DockerDemo"
intervalo=2
if [ ! -z "$1" ]; then
  intervalo=$1
fi

echo "Interval set to ${intervalo} seconds."
echo "Launching"

while [ true ];
do
  date
  sleep ${intervalo}
done
