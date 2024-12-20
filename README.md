## Commands

### Initial Setup 
```bash
## Run containers
docker compose up -d

## Check logs of all containers
docker compose logs -f
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
