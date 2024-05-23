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


./secrets:
total 8
drwxrwxr-x 2 joakoeni joakoeni 4096 May 22 16:01 .
drwxrwxr-x 5 joakoeni joakoeni 4096 May 23 16:23 ..
-rw-rw-r-- 1 joakoeni joakoeni    0 May 22 16:01 credentials.txt
-rw-rw-r-- 1 joakoeni joakoeni    0 May 22 16:01 db_password.txt
-rw-rw-r-- 1 joakoeni joakoeni    0 May 22 16:01 db_root_password.txt

./srcs:
total 20
drwxrwxr-x 3 joakoeni joakoeni 4096 May 23 16:20 .
drwxrwxr-x 5 joakoeni joakoeni 4096 May 23 16:23 ..
-rw-rw-r-- 1 joakoeni joakoeni 1116 May 23 16:20 docker-compose.yml
-rw-rw-r-- 1 joakoeni joakoeni  184 May 23 13:47 .env
drwxrwxr-x 7 joakoeni joakoeni 4096 May 22 16:00 requirements

./srcs/requirements:
total 28
drwxrwxr-x 7 joakoeni joakoeni 4096 May 22 16:00 .
drwxrwxr-x 3 joakoeni joakoeni 4096 May 23 16:20 ..
drwxrwxr-x 2 joakoeni joakoeni 4096 May 22 16:00 bonus
drwxrwxr-x 4 joakoeni joakoeni 4096 May 23 16:03 mariadb
drwxrwxr-x 4 joakoeni joakoeni 4096 May 23 15:27 nginx
drwxrwxr-x 2 joakoeni joakoeni 4096 May 22 15:59 tools
drwxrwxr-x 4 joakoeni joakoeni 4096 May 23 16:02 wordpress

./srcs/requirements/bonus:
total 8
drwxrwxr-x 2 joakoeni joakoeni 4096 May 22 16:00 .
drwxrwxr-x 7 joakoeni joakoeni 4096 May 22 16:00 ..

./srcs/requirements/mariadb:
total 20
drwxrwxr-x 4 joakoeni joakoeni 4096 May 23 16:03 .
drwxrwxr-x 7 joakoeni joakoeni 4096 May 22 16:00 ..
drwxrwxr-x 2 joakoeni joakoeni 4096 May 23 15:54 conf
-rw-rw-r-- 1 joakoeni joakoeni    0 May 22 16:06 .dockerignore
-rw-rw-r-- 1 joakoeni joakoeni  332 May 23 16:03 mariadb
drwxrwxr-x 2 joakoeni joakoeni 4096 May 22 16:06 tools

./srcs/requirements/mariadb/conf:
total 12
drwxrwxr-x 2 joakoeni joakoeni 4096 May 23 15:54 .
drwxrwxr-x 4 joakoeni joakoeni 4096 May 23 16:03 ..
-rw-rw-r-- 1 joakoeni joakoeni  179 May 23 15:54 my.cnf

./srcs/requirements/mariadb/tools:
total 8
drwxrwxr-x 2 joakoeni joakoeni 4096 May 22 16:06 .
drwxrwxr-x 4 joakoeni joakoeni 4096 May 23 16:03 ..

./srcs/requirements/nginx:
total 20
drwxrwxr-x 4 joakoeni joakoeni 4096 May 23 15:27 .
drwxrwxr-x 7 joakoeni joakoeni 4096 May 22 16:00 ..
drwxrwxr-x 2 joakoeni joakoeni 4096 May 23 15:43 conf
-rw-rw-r-- 1 joakoeni joakoeni  821 May 23 15:27 nginx
drwxrwxr-x 2 joakoeni joakoeni 4096 May 22 16:06 tools

./srcs/requirements/nginx/conf:
total 16
drwxrwxr-x 2 joakoeni joakoeni 4096 May 23 15:43 .
drwxrwxr-x 4 joakoeni joakoeni 4096 May 23 15:27 ..
-rw-rw-r-- 1 joakoeni joakoeni  104 May 23 15:43 default.conf
-rw-rw-r-- 1 joakoeni joakoeni  824 May 23 15:41 nginx.conf

./srcs/requirements/nginx/tools:
total 8
drwxrwxr-x 2 joakoeni joakoeni 4096 May 22 16:06 .
drwxrwxr-x 4 joakoeni joakoeni 4096 May 23 15:27 ..

./srcs/requirements/tools:
total 8
drwxrwxr-x 2 joakoeni joakoeni 4096 May 22 15:59 .
drwxrwxr-x 7 joakoeni joakoeni 4096 May 22 16:00 ..

./srcs/requirements/wordpress:
total 20
drwxrwxr-x 4 joakoeni joakoeni 4096 May 23 16:02 .
drwxrwxr-x 7 joakoeni joakoeni 4096 May 22 16:00 ..
drwxrwxr-x 2 joakoeni joakoeni 4096 May 23 16:01 conf
drwxrwxr-x 2 joakoeni joakoeni 4096 May 23 12:56 tools
-rw-rw-r-- 1 joakoeni joakoeni  721 May 23 16:02 wordpress

./srcs/requirements/wordpress/conf:
total 12
drwxrwxr-x 2 joakoeni joakoeni 4096 May 23 16:01 .
drwxrwxr-x 4 joakoeni joakoeni 4096 May 23 16:02 ..
-rw-rw-r-- 1 joakoeni joakoeni  300 May 23 16:01 www.conf

./srcs/requirements/wordpress/tools:
total 8
drwxrwxr-x 2 joakoeni joakoeni 4096 May 23 12:56 .
drwxrwxr-x 4 joakoeni joakoeni 4096 May 23 16:02 ..

