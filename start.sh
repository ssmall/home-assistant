#!/bin/ash

set -o errexit

check_variable () {
    if [ -z "$2" ]
    then
        echo "$1 is not set!"
        exit 1
    fi
}

check_variable SOCAT_ZIGBEE_ADDRESS ${SOCAT_ZIGBEE_ADDRESS}
check_variable SOCAT_ZWAVE_ADDRESS ${SOCAT_ZWAVE_ADDRESS}

socat -d -d -d -lf /var/log/ttyUSB0.log pty,link=/dev/ttyUSB0,raw,user=0,group=0,mode=777 tcp:${SOCAT_ZWAVE_ADDRESS} &
socat -d -d -d -lf /var/log/ttyUSB1.log pty,link=/dev/ttyUSB1,raw,user=0,group=0,mode=777 tcp:${SOCAT_ZIGBEE_ADDRESS} &

python -m homeassistant ${PROGRAM_ARGS}