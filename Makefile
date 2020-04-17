dirs:
	@-mkdir build

build: dirs
	@-docker rmi hl-amx-server:latest
	docker build -t hl-amx-server:latest ./docker

export:
	@-rm ./build/*
	docker save hl-amx-server:latest > ./build/hl-amx-server.tar

import:
	@-docker rmi hl-amx-server:latest
	docker load < ./build/hl-amx-server.tar
