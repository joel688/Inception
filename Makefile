start:
	@mkdir -p /home/joakoeni/test/data/mariadb
	@mkdir -p /home/joakoeni/test/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up --build

stop:
	@docker compose -f ./srcs/docker-compose.yml down

clean: stop
	@sudo rm -rf /home/joakoeni/test/data/mariadb
	@sudo rm -rf /home/joakoeni/test/data/wordpress
	@docker system prune -f
	@docker image prune -af
	@docker volume rm srcs_wordpress
	@docker volume rm srcs_mariadb
