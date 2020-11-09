FROM k8sathome/ubuntu:focal-20201008

ARG VERSION

USER root

RUN \
  apt-get -qq update \
  && \
  apt-get -qq install -y --no-install-recommends --no-install-suggests \
    unzip \
    unrar \
    p7zip-full \
    python2 \
    wget \
  && apt-get autoremove -y \
  && apt-get clean \
  && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/ \
  && echo umask ${UMASK} >> /etc/bash.bashrc

USER kah

RUN \
  curl -fsSL -o /tmp/nzbget.run \
    "https://github.com/nzbget/nzbget/releases/download/v${VERSION}/nzbget-${VERSION}-bin-linux.run" \
  && sh /tmp/nzbget.run --destdir /app \
  && chmod +x /app/nzbget \
  && \
  rm -rf \
    /tmp/nzbget-${VERSION}-bin-linux.run \
  && echo "UpdateMethod=docker\nPackageVersion=${VERSION}\nPackageAuthor=[Team k8s-at-home](https://github.com/k8s-at-home)" > /app/package_info


EXPOSE 6789

CMD umask ${UMASK} && /app/nzbget -s -c /config/nzbget.conf -o OutputMode=log ${EXTRA_ARGS}
