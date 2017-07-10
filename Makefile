# If changing service name, find all in project; name used outside of this file
SERVICE_NAME=python-container-demo
VERSION="0.0.1"

all: clean build export

clean:
	rm -rf ./data/write
	rm -rf ./export

build:
	docker build -t $(SERVICE_NAME):latest .
	docker tag $(SERVICE_NAME):latest $(SERVICE_NAME):$(VERSION)
	-docker ps -qaf status=exited | xargs docker rm
	-docker images -qaf dangling=true | xargs docker rmi
	docker images | grep $(SERVICE_NAME)

export:
	mkdir -p ./export
	docker save $(SERVICE_NAME):$(VERSION) > ./export/$(SERVICE_NAME)-$(VERSION).tar
	echo "export VERSION=$(VERSION)" > ./export/version
	-cp Makefile.deploy ./export/Makefile
	zip -r "./export/$$(date +%Y%m%d)-$(SERVICE_NAME).zip" ./export -x env
	open ./export

up: build
	docker-compose up --build -d

run:
	docker-compose exec -T instance python /app/src/index.py

down:
	docker-compose stop
	docker-compose down
