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

hcomp-export:
	@-rm ./build/hl-amx-server-comp.tar

	# Remove existed container
	@-docker stop hl-amx-server-comp
	@-docker rm hl-amx-server-comp

	# Start new container
	docker run -d \
		--network host \
		--name hl-amx-server-comp \
		-e HL_SERVER_IP="127.0.0.1" \
		-e HL_SERVER_PORT="27015" \
		-it hl-amx-server:latest

	# Stop again
	docker stop hl-amx-server-comp

	# Export to file, without history
	docker export hl-amx-server-comp > ./build/hl-amx-server-comp.tar

	# Remove container
	docker rm hl-amx-server-comp

	# Remove original image
	docker rmi hl-amx-server:latest

	# Load without history
	cat ./build/hl-amx-server-comp.tar | docker import - hl-amx-server:latest

hcomp-import:
	@-docker rmi hl-amx-server:latest
	cat ./build/hl-amx-server-comp.tar | docker import - hl-amx-server:latest
