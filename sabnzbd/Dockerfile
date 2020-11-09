FROM k8sathome/ubuntu:focal-20201008

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
  && chown -R kah:kah /app \
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
  && echo umask ${UMASK} >> /etc/bash.bashrc

USER kah

EXPOSE 8080

CMD umask ${UMASK} && python3 /app/SABnzbd.py --browser 0 --server 0.0.0.0:8080 --config-file /config/sabnzbd.ini ${EXTRA_ARGS}

