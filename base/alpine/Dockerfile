ARG VERSION

FROM alpine:${VERSION}

RUN \
    apk add --no-cache \
        tini \
        ca-certificates

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["echo", "This is base image is not supported yet. Check back later!", "exit", "1" ]
