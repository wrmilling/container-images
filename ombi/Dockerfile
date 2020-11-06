FROM k8sathome/ubuntu:focal-20201008

ARG TARGETPLATFORM
ARG VERSION

USER root

RUN \
  apt-get -qq update \
  &&\
  apt-get -qq install -y --no-install-recommends \
    libicu66 \
    jq \
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
  case "${TARGETPLATFORM}" in \
    'linux/amd64') export ARCH='linux-x64' ;; \
    'linux/arm64') export ARCH='linux-arm64' ;; \
    'linux/arm/v7') export ARCH='linux-arm.' ;; \
  esac \
  && \
  export URL=$(curl -s https://api.github.com/repos/tidusjar/Ombi.Releases/releases | \
    jq -r '.[] | select(.tag_name | contains(env.VERSION)) | .assets[] | select(.browser_download_url | contains(env.ARCH)) | .browser_download_url') \
  && curl -fsSL -o /tmp/ombi.tgz "${URL}" \
  && mkdir -p /app/ombi/bin \
  && tar xzf /tmp/ombi.tgz -C /app/ombi/bin \
  && chmod +x /app/ombi/bin/Ombi \
  && rm -rf /tmp/ombi.tgz

EXPOSE 5000

CMD umask ${UMASK} && /app/ombi/bin/Ombi --storage /config
