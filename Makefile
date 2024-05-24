up:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

restart:
	@docker compose -f ./srcs/docker-compose.yml restart

clean:
	@docker stop $$(docker ps -qa);
	docker rm $$(docker ps -qa);
	docker rmi -f $$(docker images -qa);
	docker volume rm $$(docker volume ls -q);
	docker network rm $$(docker network ls -q);

.PHONY: all re down clean
2024/05/24 09:09:33 [error] 7#7: *2 open() "/usr/share/nginx/html/wp-admin" failed (2: No such file or directory), client: 172.20.0.1, server: $domain_name, request: "GET /wp-admin HTTP/1.1", host: "localhost"
2024/05/24 09:09:33 [error] 7#7: *2 open() "/usr/share/nginx/html/favicon.ico" failed (2: No such file or directory), client: 172.20.0.1, server: $domain_name, request: "GET /favicon.ico HTTP/1.1", host: "localhost", referrer: "https://localhost/wp-admin"

