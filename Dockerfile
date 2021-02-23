FROM homeassistant/home-assistant:2021.2.3

RUN apk add --no-cache socat

ENV PROGRAM_ARGS=
ENV SOCAT_ZIGBEE_ADDRESS=
ENV SOCAT_ZWAVE_ADDRESS=

COPY start.sh /

HEALTHCHECK --start-period=15s CMD stat /dev/ttyUSB0
ENTRYPOINT [ "/start.sh" ]