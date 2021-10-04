# hadolint ignore=DL3007
FROM ghcr.io/k8s-at-home/ubuntu:latest

# hadolint ignore=DL3002
USER root

# hadolint ignore=DL3008,DL3015,SC2086
RUN \
  apt-get -qq update \
  && apt-get -qq install -y --no-install-recommends \
    nut-server \
  && apt-get clean \
  && rm -rf \
    /tmp/* \
    /var/lib/apt/lists/ \
    /var/tmp/*

WORKDIR /config

COPY ./apps/network-ups-tools/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
