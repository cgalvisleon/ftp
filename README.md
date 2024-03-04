# Config vsftpd service to oracle linux

## Config repository git

```
git clone https://github.com/cgalvisleon/ftp.git
```

## Basic image ubutu

```
docker run -d -it --name oraclelinux oraclelinux:8.8
docker exec -it 4e2537e1987e bin/sh
```

## Build

```
docker build --no-cache -t my-ftp -f ./Dockerfile .
docker run -d -it --name ftp my-ftp:latest
docker run -d --name ftp my-ftp:latest
docker exec -it b95cb3dfdc00 bin/sh
```

## deploy used docker-compose

```
docker-compose -p my-ftp -f ./ftp.yml up -d
docker-compose -p my-ftp -f ./prd.yml down
```
