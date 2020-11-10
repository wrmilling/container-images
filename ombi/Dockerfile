FROM k8sathome/ubuntu:latest

ARG TARGETPLATFORM
ARG VERSION

USER root

RUN \
  apt-get -qq update \
  &&\
  apt-get -qq install -y --no-install-recommends --no-install-suggests \
    libicu66 \
    jq \
  && \
  case "${TARGETPLATFORM}" in \
    'linux/amd64') export ARCH='linux-x64' ;; \
    'linux/arm64') export ARCH='linux-arm64' ;; \
    'linux/arm/v7') export ARCH='linux-arm.' ;; \
  esac \
  && \
  export URL=$(curl -sX GET https://api.github.com/repos/tidusjar/Ombi.Releases/releases | \
    jq -r '.[] | select(.tag_name | contains(env.VERSION)) | .assets[] | select(.browser_download_url | contains(env.ARCH)) | .browser_download_url') \
  && curl -fsSL -o /tmp/ombi.tgz "${URL}" \
  && tar ixzf /tmp/ombi.tgz -C /app \
  && \
  rm -rf \
    /tmp/ombi.tgz \
  && echo "UpdateMethod=docker\nPackageVersion=${VERSION}\nPackageAuthor=[Team k8s-at-home](https://github.com/k8s-at-home)" > /app/package_info \
  && apt-get remove -y \
    jq \
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

EXPOSE 3579

COPY ./ombi/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
