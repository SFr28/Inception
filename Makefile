NAME = inception

COMPOSE = srcs/docker-compose.yml

all: build up

build: 
	mkdir -p /home/sfraslin/data/mariadb 
	mkdir -p /home/sfraslin/data/wordpress 
	docker compose -p $(NAME) -f $(COMPOSE) build

up: 
	docker compose -p $(NAME) -f $(COMPOSE) up -d --remove-orphans

down: 
	docker compose -p $(NAME) -f $(COMPOSE) down

logs: 
	docker compose -p $(NAME) -f $(COMPOSE) logs

clean: down

fclean: clean
	docker system prune -a -f --volumes
	sudo rm -rf /home/sfraslin/data

re: fclean all

.PHONY: all build up down logs clean fclean re
