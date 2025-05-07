FROM alpine:3.21

RUN apk add --no-cache curl

COPY src/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
