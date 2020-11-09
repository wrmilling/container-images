FROM k8sathome/ubuntu:latest

ARG VERSION
ARG TARGETPLATFORM

USER root

RUN \
  case "${TARGETPLATFORM}" in \
    'linux/arm64') \
      export EXTRA_INSTALL_ARG="build-essential libffi-dev libssl-dev" ;; \
    'linux/arm/v7') \
      export EXTRA_INSTALL_ARG="build-essential libffi-dev libssl-dev" ;; \
  esac \
  && \
  apt-get -qq update \
  && \
  apt-get -qq install -y --no-install-recommends --no-install-suggests \
    p7zip-full \
    par2 \
    python3 \
    python3-dev \
    python3-distutils \
    python3-pip \
    unrar \
    unzip \ 
    ${EXTRA_INSTALL_ARG} \
  && \
  curl -fsSL "https://github.com/sabnzbd/sabnzbd/releases/download/${VERSION}/SABnzbd-${VERSION}-src.tar.gz" | tar xzf - -C /app --strip-components=1 \
  && pip3 install --no-cache-dir -U -r /app/requirements.txt \
  && echo "UpdateMethod=docker\nPackageVersion=${VERSION}\nPackageAuthor=[Team k8s-at-home](https://github.com/k8s-at-home)" > /app/package_info \
  && \
  pip3 install --no-cache-dir -U \
    apprise \
  && ln -s /usr/bin/python3 /usr/bin/python \
  && apt-get remove -y \
    python3-dev \
    python3-pip \
    ${EXTRA_INSTALL_ARG} \
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

EXPOSE 8080

COPY ./sabnzbd/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
