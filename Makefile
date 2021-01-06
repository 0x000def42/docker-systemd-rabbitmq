all:
	docker volume create rabbitmq.service.data
	docker network create rabbitmq.network
	cp ./rabbitmq /etc/systemd/system/rabbitmq.service
	chmod 664 /etc/systemd/system/rabbitmq.service
	systemctl enable rabbitmq.service
	systemctl restart rabbitmq.service