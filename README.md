# Install docker

```
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf makecache
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version


```

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

## Deploy used docker-compose

```
git clone https://github.com/cgalvisleon/ftp.git
cd ftp
docker-compose -p my-ftp -f ./ftp.yml up -d
docker-compose -p my-ftp -f ./ftp.yml down
```

## How to begin swarm mode in docker

```
docker swarm init

docker swarm init --advertise-addr 172.31.130.70

docker swarm join-token worker

docker swarm leave --force
```

## Up clean service

```
docker service create -d \
-e CLEAN_PERIOD=900 \
-e DELAY_TIME=600 \
--log-driver json-file \
--log-opt max-size=1m \
--log-opt max-file=2 \
--name=cleanup \
--mode global \
--mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
meltwater/docker-cleanup:latest
```

## Deploy used swarm mode

```
docker stack deploy -c ./ftp.yml ftp
docker stack rm ftp
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
```

## SSH

```
chmod +x update.sh
./update.sh

chmod +x deploy.sh
./deploy.sh
```

### Volume

```
docker volume inspect my-vol
```

### Sert version

```
git update &&
git tag v1.0.0 &&
git push origin --tags
```
