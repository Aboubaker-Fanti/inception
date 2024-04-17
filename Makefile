all: up


up: build
	docker compose -f srcs/docker-compose.yaml up -d

build:
	docker compose -f srcs/docker-compose.yaml build

down:
	docker compose -f srcs/docker-compose.yaml down 
