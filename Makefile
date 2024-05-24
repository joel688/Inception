up:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

restart:
	@docker compose -f ./srcs/docker-compose.yml restart

clean:
	docker system prune -a;

.PHONY: all re down clean
