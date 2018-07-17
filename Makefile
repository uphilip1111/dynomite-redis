.PHONY: all
all:
	@echo $$ make build
	@echo $$ make up
	@echo $$ make down
	@echo $$ make r1
	@echo $$ make r2
	@echo $$ make r3
	@echo $$ make r4
build:
	@docker-compose build
up:
	@docker-compose up -d
down:
	@docker-compose down
r1:
	@docker exec -it r1 bash
r2:
	@docker exec -it r2 bash
r3:
	@docker exec -it r3 bash
r4:
	@docker exec -it r4 bash
