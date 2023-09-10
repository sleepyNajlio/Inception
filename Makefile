NAME = Inception

all : $(NAME)

$(NAME) :
	sudo mkdir -p "/Users/najlio/data/mariadb_data"
	sudo mkdir -p "/Users/najlio/data/wordpress_data"
	sudo docker compose -f ./srcs/docker-compose.yaml up

down :
	docker compose -f ./srcs/docker-compose.yaml down
	
restart :
	docker compose -f ./srcs/docker-compose.yaml restart


prune :
	docker compose -f ./srcs/docker-compose.yaml down --rmi all --volumes

re : fclean all
	

clean : down prune


fclean : clean
	sudo rm -rf /Users/najlio/data/mariadb
	sudo rm -rf /Users/najlio/data/wordpress