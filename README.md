# Config vsftpd service to oracle linux

## Config repository git

```
git clone https://github.com/cgalvisleon/ftp.git
```

## Basic image ubutu

```
docker run -d -it --name linux ubuntu:latest

docker run --name oraclelinux oraclelinux:8.8
docker run -d -it --name oraclelinux oraclelinux:8.8
docker exec -it 4e2537e1987e bin/sh
```

## Build

```
docker build --no-cache -t my-ftp -f ./Dockerfile .
docker run -d --rm --name ftp my-ftp:latest


docker run -it -p 20:20 -p 21:21 --name ftp my-ftp:latest
```

## deploy used docker-compose

```
git clone https://github.com/cgalvisleon/ftp.git
cd ftp
docker-compose -p my-ftp -f ./ftp.yml up -d

docker-compose -p my-ftp -f ./ftp.yml down
```

## Copy file and dir with docker

```
docker cp ftp:/etc/vsftpd/ ./conf/
```

## Basic command

```
useradd -s /bin/false -d /home/ftp/usuario_ftp usuario_ftp

usermod -l usuario_ftp
```
