FROM debian:latest

RUN apt install -y python3 python3-venv python3-pip bluez libopenjp2-7 libtiff6 libturbojpeg0-dev tzdata ffmpeg liblapack3

RUN apt install -y python3-dev libffi-dev libssl-dev libjpeg-dev zlib1g-dev autoconf build-essential liblapack-dev libatlas-base-dev

WORKDIR /usr/local/lib/python_packages

RUN mkdir -p /usr/local/lib/home-assistant
RUN pip install wheel homeassistant 
RUN python -m compileall homeassistant

CMD hass