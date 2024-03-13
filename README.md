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
chmod -R a+w ftp

docker build --no-cache -t my-ftp -f ./Dockerfile .
docker run -d --rm -p 20:20 -p 21:21 -v /conf:/etc/vsftpd -v /ftp:/var/ftp --name ftp my-ftp:latest
docker run -it --rm --name ftp my-ftp:latest

docker exec -it ftp /bin/sh

docker run -d -p 20:20 -p 21:21 -v ./conf:/etc/vsftpd -v ./ftp:/var/ftp --name ftp my-ftp:latest

cat /etc/passwd | cut -d: -f1

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

```
docker run -d -v /home:/home/vsftpd \
-p 20:20 -p 21:21 -p 21100-21110:21100-21110 \
-e FTP_USER=ftp -e FTP_PASS=Energia+1 \
-e PASV_ADDRESS=127.0.0.1 -e PASV_MIN_PORT=21100 -e PASV_MAX_PORT=21110 \
--name vsftpd --restart=always fauria/vsftpd
```

## Clear images

```
docker system prune -a --volumes -f
```

docker run -itd --restart=always \
 -p 20-22:20-22 \
 -p 80:80 \
 -p 40000-40050:40000-40050 \
 -v $LOCAL_DIR/data:/srv/ftp \
    -v $LOCAL_DIR/log:/var/log \
    -v $LOCAL_DIR/home:/home \
    -e PRIVATE_PASSWD=secret \
    -e PASV_ADDRESS=$PUBLIC_IP_ADDRESS \
 ustclug/ftp

docker run -itd --restart=always \
 -p 20-21:20-21 \
 -p 40000-40050:40000-40050 \
 -v /ftp/ftp:/fpt/ftp \
 -e PRIVATE_PASSWD=secret \
 -e PASV_ADDRESS=$PUBLIC_IP_ADDRESS \
 ustclug/ftp

## SSH

```
chmod +x update.sh
./update.sh
```
