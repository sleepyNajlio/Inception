build:
	mkdir -p /home/$(USER)/data/wordpress
	mkdir -p /home/$(USER)/data/mariadb
	docker compose -f srcs/docker-compose.yaml build

up: build
	docker compose -f srcs/docker-compose.yaml up -d

stop:
	docker compose -f srcs/docker-compose.yaml stop

down:
	docker compose -f srcs/docker-compose.yaml down --rmi all --volumes

clean: down
	docker system prune -af

fclean: clean
	rm -rf /home/$(USER)/data/wordpress
	rm -rf /home/$(USER)/data/mariadb

re: fclean up



