# list images
```bash
docker images
```

# pull a image
```bash
docker pull <image_name>
```

# run from image (will create a new container)
```bash
docker run <image:tag>
```

# run a cli in container
```bash
docker run -it ubuntu /bin/bash
```

# start a container
```bash
docker start <name|id>
```

# stop a container
```bash
docker stop <name|id>
```

# remove a container
```bash
docker rm <name|id>
```

# run a container with exposed port
```bash
docker run --name <container_name> -p <localport>:<dockerport> <image_name>
```

# run a container with mounted volume
```bash
docker run -v <localpath>:<dockerpath>
```

# remove all containers
```bash
docker rm $(docker ps -aq)
```

# run a command on running container
```bash
docker exec
```

# docker remove all unused objects
```bash
docker system prune
```

# show mysql/mysql-server generated password
```bash
docker logs mysql 2>&1 | grep GENERATED
```
# change mysql password query
```sql
UPDATE mysql.user SET Password=PASSWORD('ABC12abc') WHERE User='root';
FLUSH PRIVILEGES;
```
