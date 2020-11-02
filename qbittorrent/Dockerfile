#
# NOTE: qbittorrent >= 4.3.0 requires libtorrent-rasterbar >= 1.2
# hence all the scattered logic written below
#

FROM k8sathome/ubuntu:focal-20200925 as builder

ARG TARGETPLATFORM
ARG VERSION

USER root

WORKDIR /tmp

RUN \
  apt-get -qq update \
  && apt-get -qq install -y --no-install-recommends \
    build-essential cmake ninja-build pkg-config git zlib1g-dev libssl-dev libgeoip-dev \
    libboost-dev libboost-system-dev libboost-chrono-dev libboost-random-dev \
    qtbase5-dev qttools5-dev libqt5svg5-dev

# Install lintorrent-rasterbar dependencies
RUN \
  case "${TARGETPLATFORM}" in \
    'linux/amd64') export ARCH='amd64' ;; \
    'linux/arm64') export ARCH='arm64' ;; \
    'linux/arm/v7') export ARCH='armhf' ;; \
  esac \
  && echo "arch: ${ARCH}" \
  && \
  case "${VERSION}" in \
    (4\.2.*) \
      export LIBTORRENT_DEB="libtorrent-rasterbar9_1.1.13-1.1build2_${ARCH}.deb" \
      export LIBTORRENT_DEV_DEB="libtorrent-rasterbar-dev_1.1.13-1.1build2_${ARCH}.deb" ;; \
    (4\.3.*) \
      export LIBTORRENT_DEB="libtorrent-rasterbar10_1.2.5-1.2_${ARCH}.deb" \
      export LIBTORRENT_DEV_DEB="libtorrent-rasterbar-dev_1.2.5-1.2_${ARCH}.deb" ;; \
  esac \
  && echo "libtorrent deb: ${LIBTORRENT_DEB}" \
  && echo "libtorrent-dev deb: ${LIBTORRENT_DEB}" \
  && \
  curl -sL -o libtorrent-rasterbar.deb \
    "https://launchpad.net/ubuntu/+archive/primary/+files/${LIBTORRENT_DEB}" \
  && dpkg -i libtorrent-rasterbar.deb \
  && rm -rf libtorrent-rasterbar.deb \
  && \
  curl -sL -o libtorrent-rasterbar-dev.deb \
    "https://launchpad.net/ubuntu/+archive/primary/+files/${LIBTORRENT_DEV_DEB}" \
  && dpkg -i libtorrent-rasterbar-dev.deb \
  && rm -rf libtorrent-rasterbar-dev.deb

# Compile qbitorrent
RUN \
  git clone --depth 1 -b release-${VERSION} https://github.com/qbittorrent/qBittorrent.git . \
  && \
  case "${TARGETPLATFORM}" in \
    'linux/arm/v7') export EXTRA_CFG_ARG="--with-boost-libdir=/usr/lib/arm-linux-gnueabihf" ;; \
  esac \
  && ./configure ${EXTRA_CFG_ARG} --disable-gui --disable-stacktrace \
  && make \
  && make install

FROM k8sathome/ubuntu:focal-20200925

# Proper way to set config directory
ENV HOME=/config \
    XDG_CONFIG_HOME=/config \
    XDG_DATA_HOME=/config \
    WEBUI_PORT=8080

USER root

RUN \
  apt-get -qq update \
  && \
  case "${TARGETPLATFORM}" in \
    'linux/amd64') export ARCH='amd64' ;; \
    'linux/arm64') export ARCH='arm64' ;; \
    'linux/arm/v7') \
      export ARCH='armhf' \
      export EXTRA_INSTALL_ARG="build-essential" ;; \
  esac \
  && \
  case "${VERSION}" in \
    (4\.2.*) \
      export LIBTORRENT_DEB="libtorrent-rasterbar9_1.1.13-1.1build2_${ARCH}.deb" ;; \
    (4\.3.*) \
      export LIBTORRENT_DEB="libtorrent-rasterbar10_1.2.5-1.2_${ARCH}.deb" ;; \
  esac \
  && \
  curl -sL -o libtorrent-rasterbar.deb \
    "https://launchpad.net/ubuntu/+archive/primary/+files/${LIBTORRENT_DEB}" \
  && dpkg -i libtorrent-rasterbar.deb \
  && rm -rf libtorrent-rasterbar.deb \
  && \
  apt-get install -y --no-install-recommends \
    python3 \
    libqt5network5 \
    libqt5xml5 \
    p7zip-full \
    unrar \
    geoip-bin \
    unzip \
    ${EXTRA_INSTALL_ARG} \
  && apt-get autoremove -y \
  && apt-get clean \
  && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/ \
  && echo umask ${UMASK} >> /etc/bash.bashrc

USER kah

RUN mkdir -p /app/qbittorrent/bin /config/qBittorrent /tmp/incomplete

COPY --from=builder /usr/local/bin/qbittorrent-nox /app/qbittorrent/bin/qbittorrent-nox
COPY /qbittorrent/qBittorrent.conf /config/qBittorrent/qBittorrent.conf

EXPOSE 6881 6881/udp ${WEBUI_PORT}

CMD umask ${UMASK} && /app/qbittorrent/bin/qbittorrent-nox --webui-port="${WEBUI_PORT}"
