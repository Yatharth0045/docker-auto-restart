#!/usr/local/bin/bash

# List of containers to monitor (Container B)
CONTAINERS_B=("container_b1" "container_b2" "container_b3")

# Container A
CONTAINER_A="container_a"

# Monitor Docker events for the specified containers
docker events --filter "event=start" |
while read event; do
  for container in "${CONTAINERS_B[@]}"; do
    if echo "$event" | grep -q "$container"; then
      echo "Container $container has been restarted. Restarting Container A..."
      docker restart $CONTAINER_A
      break
    fi
  done
done
