# Dockerized rabbitmq on systemd unit

Requirements:
 - runned docker service

How to install:
  - `git clone git@github.com:0x000def42/docker-systemd-rabbitmq.git`
  - `cd docker-systemd-rabbitmq && sudo make`

It's will: 
- build rabbitmq docker image
- create docker volume `rabbitmq.service.data`
- create docker network `rabbitmq.network`
- copy `rabbitmq` unit into `/etc/systemd/system/rabbitmq.service`
- and run `systemctl enable rabbitmq.service` and `systemctl restart rabbitmq.service`

Rabbitmq starts on 5672 host port.
Connection available inside another docker containers under network `rabbitmq.network`
by `rabbitmq.service` host.

Connect another docker to network:
```
docker run --network rabbitmq.network something
```
or via compose file:
```
  version: '3.*'
  services:
    youapp:
      networks:
        - rabbitmq.network
  networks:
    rabbitmq.network:
      external: true
```