NAME = Inception

all : $(NAME)

$(NAME) :
	sudo mkdir -p "/Users/najlio/data/mariadb"
	sudo mkdir -p "/Users/najlio/data/wordpress"
	sudo docker compose -f ./srcs/docker-compose.yaml up --build -d

down :
	sudo docker compose -f ./srcs/docker-compose.yaml down
	
restart :
	sudo docker compose -f ./srcs/docker-compose.yaml restart


prune :
	sudo docker compose -f ./srcs/docker-compose.yaml down --rmi all --volumes

re : fclean all
	

clean : down prune


fclean : clean
	sudo rm -rf /Users/najlio/data/mariadb
	sudo rm -rf /Users/najlio/data/wordpress