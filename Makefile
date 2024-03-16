
up : check_file_is_exist
	@docker compose -f srcs/docker-compose.yml up
stop :
	@docker compose -f srcs/docker-compose.yml stop
build : check_file_is_exist
	@docker compose -f srcs/docker-compose.yml build

start :
	@docker compose -f srcs/docker-compose.yml start
down :
	@docker compose -f srcs/docker-compose.yml down
check_file_is_exist:
	@if [ ! -d "$(HOME)/data/mariadb" ]; then \
		mkdir -p $(HOME)/data/mariadb && chmod 777  $(HOME)/data/mariadb;\
	fi
	@if [ ! -d "$(HOME)/data/wordpress" ]; then \
		mkdir -p $(HOME)/data/wordpress && chmod 777  $(HOME)/data/wordpress; \
	fi
fclean:
	@if [ -n "$(shell docker ps -aq)" ]; then \
		docker stop $(shell docker ps -aq); \
		docker rm -f $(shell docker ps -aq); \
	fi
	@rm -fr $(HOME)/data/wordpress
	@rm -fr $(HOME)/data/mariadb 
	@if [ -n "$(shell docker images -q)" ]; then \
		docker rmi -f $(shell docker images -aq); \
	fi
	@if [ -n "$(shell docker volume ls -q)" ]; then \
		docker volume rm $(shell docker volume ls -q); \
	fi
	@if [ $(shell docker network ls -f name=inception | wc -l) -eq 2 ]; then \
		docker network rm inception; \
	fi
	docker system prune -a -f