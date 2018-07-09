IMAGES = dynomite-redis:
TAG = 0710
HOSTNAME = dynomite
CONTAINER = dynomite-redis
.PHONY:all
all:
	@echo $$ make build
	@echo $$ make run
	@echo $$ make clean
	@echo $$ make logs
	@echo $$ make imgs
	@echo $$ make container
build:
	@sudo docker build -t $(IMAGES)$(TAG) .
run:
	@sudo docker run -d --hostname $(HOSTNAME) --name $(CONTAINER) $(IMAGES)$(TAG)
clean:
	@sudo docker rm -f $(CONTAINER)
logs:
	@sudo docker logs $(CONTAINER)
container:
	@sudo docker exec -it $(CONTAINER) bash
imgs:
	@sudo docker images
