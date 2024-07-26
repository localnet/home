FROM alpine:3.18

RUN apk add nodejs npm
RUN npm install -g --verbose zwave-js-ui

RUN apk add build-base jq linux-headers python3-dev
RUN npm_config_build_from_source=true npm rebuild -g @serialport/bindings-cpp
RUN apk del build-base jq linux-headers python3-dev

RUN mkdir -p /usr/local/var/zwave-js
RUN mkdir -p /usr/local/share/zwave-js
RUN mkdir -p /run/lock/zwave-js

ENV STORE_DIR=/usr/local/var/zwave-js
ENV ZWAVEJS_EXTERNAL_CONFIG=/usr/local/share/zwave-js
ENV ZWAVEJS_LOCK_DIRECTORY=/run/lock/zwave-js

EXPOSE 8091

CMD /usr/local/bin/zwave-js-ui