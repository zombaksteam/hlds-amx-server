docker-build:
	@-docker rmi hl-amx-server:latest
	docker build -t hl-amx-server:latest ./

docker-export:
	@-rm ./build/hl-amx-server.tar
	docker save hl-amx-server:latest > ./build/hl-amx-server.tar

docker-import:
	@-docker rmi hl-amx-server:latest
	docker load < ./build/hl-amx-server.tar

docker-test:
	docker run --rm \
		--network host \
		--name hl-amx-server-test \
		-e HL_SERVER_IP="127.0.0.1" \
		-e HL_SERVER_PORT="27015" \
		-v /etc/timezone:/etc/timezone:ro \
		-it hl-amx-server:latest

docker-push:
	docker login
	docker tag hl-amx-server zombaksteam/hl-amx-server:latest
	docker push zombaksteam/hl-amx-server:latest
	docker rmi zombaksteam/hl-amx-server:latest
	docker rmi hl-amx-server:latest
