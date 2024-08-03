FROM alpine:latest

RUN apk add python3

RUN mkdir -p /usr/local/lib/python

RUN apk add gcc linux-headers musl-dev python3-dev
RUN python -m venv /usr/local/lib/python/.venv
RUN /usr/local/lib/python/.venv/bin/python -m pip install wheel
RUN /usr/local/lib/python/.venv/bin/python -m pip install homeassistant

CMD hass --config /var/local/home-assistant
