SHA := $(shell git describe --match=NeVeRmAtCh --always --abbrev=40 --dirty=*)

build:
	docker build --build-arg CIRCLE_SHA1="$(SHA)" -t stackstorm/stackstorm:latest images/stackstorm

<<<<<<< 3d96396b9ba028546487f485cf6f85a03e9c2ef7
dev-build:
	docker build --build-arg ST2_REPO=unstable --build-arg CIRCLE_SHA1="$(SHA)" -t stackstorm/stackstorm:local-dev images/stackstorm

=======
>>>>>>> Adding in entrypoint for chatops and merging into one line.
env:
	bin/write-env.sh conf

up:
	docker-compose up -d

down:
	docker-compose down

rmi:
	docker rmi $$(docker images -f dangling=true -q)

exec:
	docker-compose exec stackstorm /bin/bash
