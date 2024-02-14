
up : check_file_is_exist
	 @cd srcs &&  sudo docker compose -f docker-compose.yml up 
stop :
	@cd srcs &&  sudo docker compose -f docker-compose.yml stop
build : check_file_is_exist
	@cd srcs &&  sudo docker compose -f docker-compose.yml build

start :
	@cd srcs &&  sudo docker compose -f docker-compose.yml start

down :
	@cd srcs &&  sudo docker compose -f docker-compose.yml down
check_file_is_exist:
	@if [ ! -d "/home/hyounsi/data/mariadb" ]; then \
		mkdir -p /home/hyounsi/data/mariadb; \
	fi
	@if [ ! -d "/home/hyounsi/data/wordpress" ]; then \
		mkdir -p /home/hyounsi/data/wordpress; \
	fi

clean:
	@if [ -n "$(shell sudo docker ps -aq)" ]; then \
		sudo docker stop $(shell sudo docker ps -aq); \
		sudo docker rm -f $(shell sudo docker ps -aq); \
	fi
	@sudo rm -fr /home/hyounsi/data/wordpress
	@sudo rm -fr /home/hyounsi/data/mariadb 
	@if [ -n "$(shell sudo docker images -q)" ]; then \
		sudo docker rmi -f $(shell sudo docker images -aq); \
	fi
	@if [ -n "$(shell sudo docker volume ls -q)" ]; then \
		sudo docker volume rm $(shell sudo docker volume ls -q); \
	fi
	@if [ $(shell sudo docker network ls -f name=inception | wc -l) -eq 2 ]; then \
		sudo docker network rm inception; \
	fi
	sudo docker system prune -a -f