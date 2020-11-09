FROM k8sathome/ubuntu:latest

ARG TARGETPLATFORM
ARG VERSION

ENV TAUTULLI_DOCKER="True"

USER root

RUN \
  export EXTRA_INSTALL_ARG="build-essential libssl-dev libffi-dev python3-dev python3-pip"; \
  apt-get -qq update \
  && \
  apt-get -qq install -y --no-install-recommends --no-install-suggests \
    python3 \
    python3-distutils \
    ${EXTRA_INSTALL_ARG} \
  && \
  ln -s /usr/bin/python3 /usr/bin/python \
  && \
  curl -fsSL "https://github.com/Tautulli/Tautulli/archive/v${VERSION}.tar.gz" | tar xzf - -C /app --strip-components 1 \
  && \
  echo "${VERSION}" > /app/version.txt \
  && \
  echo "master" > /app/branch.txt \
  && \
  pip3 install --no-cache-dir -U \
	mock \
	plexapi \
    pycryptodomex \
    pyopenssl \
  && \
  echo "UpdateMethod=docker\nPackageVersion=${VERSION}\nPackageAuthor=[Team k8s-at-home](https://github.com/k8s-at-home)" > /app/package_info \
  && \ 
  apt-get remove -y ${EXTRA_INSTALL_ARG} \
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

EXPOSE 8181

COPY ./tautulli/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
