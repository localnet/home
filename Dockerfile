FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y bluez ffmpeg liblapack3 libopenjp2-7 libtiff6 python3

RUN apt install -y autoconf build-essential python3-dev python3-venv
RUN apt install -y libatlas-base-dev libffi-dev libjpeg-dev liblapack-dev libssl-dev zlib1g-dev libturbojpeg0-dev
RUN mkdir -p /usr/local/lib/home-assistant
RUN python3 -m venv --upgrade /usr/local/lib/home-assistant/.venv
RUN /usr/local/lib/home-assistant/.venv/bin/python3 -m pip install wheel
RUN /usr/local/lib/home-assistant/.venv/bin/python3 -m pip install homeassistant
RUN python3 -m compileall /usr/local/lib/home-assistant
RUN apt autoremove -y autoconf build-essential python3-dev python3-venv
RUN apt autoremove -y libatlas-base-dev libffi-dev libjpeg-dev liblapack-dev libssl-dev zlib1g-dev libturbojpeg0-dev

RUN /usr/local/lib/home-assistant/.venv/bin/hass