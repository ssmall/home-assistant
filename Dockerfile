FROM --platform=${BUILDPLATFORM:-linux/amd64} homeassistant/home-assistant:stable

RUN apk add --no-cache socat

ENV SOCAT_ZIGBEE_ADDRESS=
ENV SOCAT_ZWAVE_ADDRESS=
ENV PROGRAM_ARGS=

COPY start.sh /

HEALTHCHECK --start-period=15s CMD stat /dev/ttyUSB0
ENTRYPOINT [ "/start.sh" ]