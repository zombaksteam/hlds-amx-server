FROM hl-base-server:latest

ENV HL_SERVER_IP=127.0.0.1 \
	HL_SERVER_PORT=27015 \
	HL_SERVER_MAP=crossfire \
	SYS_TICRATE=500 \
	NUM_EDICTS=2047 \
	MAXPLAYERS=32

ARG DEBIAN_FRONTEND=noninteractive

USER root
COPY ./server/valve /home/steam/server/valve
COPY ./run.sh /home/steam/server/run.sh

RUN chown -R steam:steam /home/steam/server/ && \
	chown steam:steam /home/steam/server/run.sh

USER steam
CMD /home/steam/server/run.sh
