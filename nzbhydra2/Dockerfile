FROM k8sathome/ubuntu:focal-20201008

ARG TARGETPLATFORM
ARG VERSION

USER root

RUN \
  apt-get -qq update \
  &&\
  apt-get -qq install -y --no-install-recommends --no-install-suggests \
    openjdk-11-jre-headless \
    python3 \
    unzip \
  && ln -s /usr/bin/python3 /usr/bin/python \
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
  curl -fsSL -o /tmp/nzbhydra2.zip \
    "https://github.com/theotherp/nzbhydra2/releases/download/v${VERSION}/nzbhydra2-${VERSION}-linux.zip" \
  && unzip -q /tmp/nzbhydra2.zip -d /app \
  && curl -fsSL -o /app/nzbhydra2wrapperPy3.py \
    "https://raw.githubusercontent.com/theotherp/nzbhydra2/master/other/wrapper/nzbhydra2wrapperPy3.py" \
  && chmod +x /app/nzbhydra2wrapperPy3.py \
  && \
  rm -rf \
    /tmp/nzbhydra2.zip \
  && echo "UpdateMethod=docker\nPackageVersion=${VERSION}\nPackageAuthor=[Team k8s-at-home](https://github.com/k8s-at-home)" > /app/package_info

EXPOSE 5076

COPY ./nzbhydra2/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
