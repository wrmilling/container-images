FROM k8sathome/ubuntu:latest

ARG VERSION

USER root

RUN \
  apt-get -qq update \
  && \
  apt-get -qq install -y --no-install-recommends --no-install-suggests \
    build-essential \
    libxml2-dev \
    libxslt1-dev \
    python3-pip \
    unzip \
    unrar \
    p7zip-full \
    python3 \
    wget \
  && \
  pip3 install --no-cache-dir -U \
    apprise \
    chardet \
    pynzbget \
    rarfile \
  && ln -s /usr/bin/python3 /usr/bin/python \
  && \
  curl -fsSL -o /tmp/nzbget.run \
    "https://github.com/nzbget/nzbget/releases/download/v${VERSION}/nzbget-${VERSION}-bin-linux.run" \
  && sh /tmp/nzbget.run --destdir /app \
  && \
  cp /app/nzbget.conf /config/nzbget.conf \
  && ls -la /app && ls -la /config \
  && \
  rm -rf \
    /tmp/nzbget.run \
  && echo "UpdateMethod=docker\nPackageVersion=${VERSION}\nPackageAuthor=[Team k8s-at-home](https://github.com/k8s-at-home)" > /app/package_info \
  && \
  apt-get remove -y \
    build-essential \
    libxml2-dev \
    libxslt1-dev \
    python3-pip \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get autoremove -y \
  && apt-get clean \
  && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/ \
  && chmod -R u=rwX,go=rX /app \
  && echo umask ${UMASK} >> /etc/bash.bashrc

USER kah

EXPOSE 6789

COPY ./nzbget/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
