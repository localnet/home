FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update

RUN apt install -y python3 python3-venv python3-pip bluez libopenjp2-7 libtiff6 libturbojpeg0-dev tzdata ffmpeg liblapack3

RUN apt install -y python3-dev libffi-dev libssl-dev libjpeg-dev zlib1g-dev autoconf build-essential liblapack-dev libatlas-base-dev

RUN mkdir -p /usr/local/lib/home-assistant
RUN python -m venv --upgrade /usr/local/lib/home-assistant/.venv
RUN /usr/local/lib/home-assistant/.venv/bin/python -m pip install wheel homeassistant
RUN /usr/local/lib/home-assistant/.venv/bin/python -m compileall

CMD hass