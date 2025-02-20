#!/bin/bash

echo "Check the health of the container"

if [ $? -eq 0 ]; then
	echo "Container is healthy"
else
	echo "Container is in unhealthy state"
fi
