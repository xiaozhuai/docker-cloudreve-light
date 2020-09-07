FROM alpine:latest

ENV TZ="Asia/Shanghai"

RUN apk --no-cache add tzdata aria2 \
    && cp /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone


COPY --from=xavierniu/cloudreve:latest /cloudreve/cloudreve-main /usr/bin/cloudreve
COPY cloudreve.ini /etc/cloudreve.ini.tpl
COPY cloudreve-ssl.ini /etc/cloudreve-ssl.ini.tpl
COPY --from=ochinchina/supervisord:latest /usr/local/bin/supervisord /usr/bin/supervisord
COPY supervisor.conf /etc/supervisor.conf
COPY entrypoint.sh /entrypoint.sh

EXPOSE 80
EXPOSE 443
VOLUME /cloudreve

ENTRYPOINT /entrypoint.sh
