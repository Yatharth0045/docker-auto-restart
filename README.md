## Commands

### Initial Setup 
```bash
## Run containers
docker compose up -d

## Check logs of all containers
docker compose logs -f
```

### Configure ENVs
```bash
## Container names for all containers whose restart should trigger a reload for dependent container.
BASE_CONTAINERS: "container_b1 container_b2 container_b3"

## Container name for dependent container which needs to be restarted.
DEPENDENT_CONTAINER: "container_a"
```

### Test Auto Restart
```bash
## Check running containers
docker ps

## Restart any of the main docker container (container b*)
docker compose restart container_b2

## Check auto restart of container_a
docker ps
## and check for STATUS of the container
```
