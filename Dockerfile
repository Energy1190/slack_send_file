FROM alpine:latest

RUN apk add --no-cache curl

ADD ./run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]