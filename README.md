# home-assistant-socat
Customized home-assistant Docker image that includes socat for remote serial connections.

# Using this image

This image has two required environment variables:

| Name| Description |
| --------------- | --------------- |
| `SOCAT_ZIGBEE_ADDRESS` | The IP address and port of the host to use for the Zigbee connection (e.g. a host running [ser2net][]). Must be formatted as `ip:port` |
| `SOCAT_ZWAVE_ADDRESS` | The IP address and port of the host to use for the Z-Wave connection (e.g. a host running [ser2net][]). Must be formatted as `ip:port` |

Additionally, you can optionally specify [`PROGRAM_ARGS`][] which will be passed to Home Assistant.

[ser2net]: https://linux.die.net/man/8/ser2net
[`PROGRAM_ARGS`]: https://github.com/home-assistant/core/blob/master/homeassistant/__main__.py