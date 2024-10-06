# Load .env file and export variables
include .env
export $(shell sed 's/=.*//' .env)

# Variables
IMAGE_NAME := gorestfulapi
CONTAINER_NAME := gorestfulapi

docker-build:
	docker build -t $(IMAGE_NAME) .

docker-run:
	docker run -d --env-file .env --name $(CONTAINER_NAME) -p $(PORT):$(PORT) $(IMAGE_NAME)

docker-stop:
	docker stop $(CONTAINER_NAME)

docker-rm:
	docker rm $(CONTAINER_NAME)
