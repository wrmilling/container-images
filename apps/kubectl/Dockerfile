FROM ubuntu:focal-20210723

ARG VERSION

ARG TARGETARCH
ENV TARGETARCH=${TARGETARCH:-amd64}

# hadolint ignore=DL3008
RUN \
  apt-get -qq update \
  && apt-get -qq install -y --no-install-recommends \
    ca-certificates \
    curl \
    jq \
    tzdata \
  && curl -fsSL -o /usr/local/bin/kubectl "https://dl.k8s.io/release/v${VERSION}/bin/linux/${TARGETARCH}/kubectl" \
  && chmod +x /usr/local/bin/kubectl \
  && apt-get clean \
  && rm -rf \
    /tmp/* \
    /var/lib/apt/lists/ \
    /var/tmp/*

CMD [ "/usr/local/bin/kubectl" ]
