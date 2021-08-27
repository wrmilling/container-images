# hadolint ignore=DL3007
FROM ghcr.io/k8s-at-home/ubuntu:latest
ARG VERSION

USER root

# hadolint ignore=DL3008
RUN \
  apt-get -qq update \
  && apt-get -qq install -y --no-install-recommends \
    python3-pip \
  && pip3 install getmail6=="${VERSION}" \
  && apt-get clean \
  && rm -rf \
    /tmp/* \
    /var/lib/apt/lists/ \
    /var/tmp/*

USER kah

CMD [ "/usr/local/bin/getmail" ]
