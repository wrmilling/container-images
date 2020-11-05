FROM golang:1.14 as builder

ARG VERSION
ARG TARGETPLATFORM

ENV CGO_ENABLED=0 \
  GOPATH=/go \
  GOBIN=/go/bin

RUN \
  apt-get -qq update \
  && apt-get -qq install -y --no-install-recommends git

WORKDIR /tmp

RUN \
  export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) \
  && export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) \
  && export GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3 | cut -c2-) \
  && git clone --depth 1 -b ${VERSION} https://github.com/xteve-project/xTeVe.git . \
  && go get ./... \
  && go build -o /go/bin/xteve xteve.go

FROM k8sathome/ubuntu:focal-20201008

ARG VERSION
ARG TARGETPLATFORM

USER root

RUN \
  apt-get -qq update \
  && apt-get -qq install -y --no-install-recommends \
    ca-certificates \
    tzdata \
    ffmpeg \
    curl \
    vlc \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get autoremove -y \
  && apt-get clean \
  && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/cache/apt/* \
    /var/tmp/ \
  && echo umask ${UMASK} >> /etc/bash.bashrc

USER kah

COPY --from=builder /go/bin/xteve /app/xteve/bin/xteve

EXPOSE 34400

CMD umask ${UMASK} && /app/xteve/bin/xteve -config /config
