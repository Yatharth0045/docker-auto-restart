#!/usr/local/bin/bash

# List of containers to monitor (Container B)
CONTAINERS_B=(${BASE_CONTAINERS:-"container_b1"})
# Container A
CONTAINER_A=${DEPENDENT_CONTAINER:-"container_a"}

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
