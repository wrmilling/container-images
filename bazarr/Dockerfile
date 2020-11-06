FROM k8sathome/ubuntu:focal-20201008

ARG VERSION
ARG TARGETPLATFORM

USER root

RUN \
  case "${TARGETPLATFORM}" in \
    'linux/arm64') \
      export EXTRA_INSTALL_ARG="build-essential libxml2-dev libxslt1-dev" ;; \
    'linux/arm/v7') \
      export EXTRA_INSTALL_ARG="build-essential libxml2-dev libxslt1-dev" ;; \
  esac \
  && \
  apt-get -qq update \
  && \
  apt-get -qq install -y --no-install-recommends --no-install-suggests \
    python3 \
    python3-dev \
    python3-pip \
    python3-distutils \
    ffmpeg \
    unrar-free \
    unzip \ 
    ${EXTRA_INSTALL_ARG} \
  && \
  curl -fsSL "https://github.com/morpheus65535/bazarr/archive/v${VERSION}.tar.gz" | tar xzf - -C /app --strip-components=1 \
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
    /app/bin \
    /app/tests \
    /app/screenshots \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/ \
  && echo umask ${UMASK} >> /etc/bash.bashrc

USER kah

EXPOSE 6767

CMD umask ${UMASK} && python3 /app/bazarr.py --no-update --config /config ${ARGS}
