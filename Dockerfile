FROM alpine:latest

RUN apk add bluez ffmpeg gcc lapack libffi libjpeg-turbo tiff openjpeg openssl python3 py3-pip py3- zlib

RUN mkdir -p /usr/local/var/home-assistant

RUN apk add lapack-dev libffi-dev libjpeg-turbo-dev tiff-dev openjpeg-dev openssl-dev python3-dev zlib-dev
RUN python3 -m venv /usr/local/var/home-assistant && source bin/activate
RUN python3 -m pip install wheel && pip install homeassistant==2024.7.3
RUN apk del lapack-dev libffi-dev libjpeg-turbo-dev tiff-dev openjpeg-dev openssl-dev python3-dev zlib-dev

CMD hass