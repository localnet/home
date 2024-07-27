FROM alpine:latest

RUN apk add bluez ffmpeg gcc lapack libffi libjpeg-turbo tiff openjpeg openssl python3 py3-pip zlib

RUN mkdir -p /usr/local/var/home-assistant

RUN apk add lapack-dev libffi-dev libjpeg-turbo-dev tiff-dev openjpeg-dev openssl-dev python3-dev zlib-dev
RUN apk add py3-build py3-setuptools py3-wheel
RUN pip install homeassistant==2024.7.3
#RUN python3 -m venv /usr/local/var/home-assistant && source bin/activate
#RUN python3 -m pip install wheel && pip install homeassistant==2024.7.3
RUN apk del py3-build py3-setuptools py3-wheel
RUN apk del lapack-dev libffi-dev libjpeg-turbo-dev tiff-dev openjpeg-dev openssl-dev python3-dev zlib-dev

CMD hass