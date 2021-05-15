# hadolint ignore=DL3007
FROM ghcr.io/k8s-at-home/alpine:latest
USER root
ARG TARGETARCH
ARG VERSION
ADD https://github.com/containernetworking/plugins/releases/download/v${VERSION}/cni-plugins-linux-${TARGETARCH}-v${VERSION}.tgz /
RUN mkdir /plugins && \
      tar -zxvf /*.tgz -C /plugins && \
      rm /*.tgz
CMD cp /plugins/* /host/opt/cni/bin