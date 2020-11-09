FROM ubuntu:focal-20201008
LABEL maintainer="k8s-at-home"

ARG TARGETPLATFORM

ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    UMASK=0002 \
    TINI_VERSION=0.19.0

RUN \
  adduser kah \
  --uid 568 \
  --group \
  --system \
  --disabled-password \
  --no-create-home

RUN \
  mkdir -p /app /config \
  && chown -R kah:kah /app /config

WORKDIR /config

RUN set -eux \
  && \
  case "${TARGETPLATFORM}" in \
    'linux/amd64') export ARCH='amd64' ;; \
    'linux/arm64') export ARCH='arm64' ;; \
    'linux/arm/v7') export ARCH='armhf' ;; \
  esac \
  && apt-get -qq update \
  && apt-get -qq install -y --no-install-recommends --no-install-suggests \
       curl \
       ca-certificates \
       gnupg2 \
       locales \
       tzdata \
       vim-tiny \
  && locale-gen en_US.UTF-8 \
  && curl -fsSL -o /sbin/tini https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-${ARCH} \
  && curl -fsSL -o /tini.asc https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-${ARCH}.asc \
  && gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 \
  && gpg --batch --verify /tini.asc /sbin/tini \
  && chmod +x /sbin/tini \
  && gpgconf --kill all \
  && apt-get remove -y gnupg2 \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf \
       /tini.asc \
       /tmp/* \
       /var/lib/apt/lists/* \
       /var/cache/apt/* \
       /var/tmp/*

USER kah:kah

ENTRYPOINT [ "/sbin/tini", "--" ]
