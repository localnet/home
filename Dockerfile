FROM alpine:latest

RUN apk add bluez ffmpeg gcc lapack libffi libjpeg-turbo tiff openjpeg openssl python3 py3-pip zlib

RUN apk add lapack-dev libffi-dev libjpeg-turbo-dev tiff-dev openjpeg-dev openssl-dev python3-dev zlib-dev
RUN pip install wheel
RUN pip install homeassistant==2024.7.3
RUN apk del lapack-dev libffi-dev libjpeg-turbo-dev tiff-dev openjpeg-dev openssl-dev python3-dev zlib-dev

CMD hass