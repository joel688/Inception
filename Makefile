start:
	@mkdir -p /home/joakoeni/data/mariadb
	@mkdir -p /home/joakoeni/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up --build

stop:
	@docker compose -f ./srcs/docker-compose.yml down

clean: stop
	@sudo rm -rf /home/joakoeni/data/mariadb
	@sudo rm -rf /home/joakoeni/data/wordpress
	@docker system prune -f
	@docker image prune -af
	@docker volume rm srcs_wordpress
	@docker volume rm srcs_mariadb

network:
	sudo echo "127.0.0.1 joakoeni.42.fr" >> /etc/hosts
	sudo systemctl restart NetworkManager
