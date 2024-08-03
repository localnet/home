FROM alpine:latest

RUN apk add python3

RUN mkdir -p /usr/local/lib/python
RUN mkdir -p /var/local/home-assistant

RUN apk add g++ libffi-dev linux-headers python3-dev

RUN python -m venv /usr/local/lib/python/.venv
RUN /usr/local/lib/python/.venv/bin/python -m pip install wheel homeassistant
RUN /usr/local/lib/python/.venv/bin/hass --config /var/local/home-assistant

RUN apk del g++ libffi-dev linux-headers python3-dev
