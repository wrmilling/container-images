# hadolint ignore=DL3007
FROM ghcr.io/k8s-at-home/ubuntu:latest

ARG VERSION

USER root

RUN apt update \
    && apt-get install -y apache2 libapache2-mod-musicindex \
    && apt-get -y clean all \
    && mkdir -p /music /cache \
    && chown -R kah:kah /music /cache \
    && a2enmod musicindex \
    && echo "Listen 8080">>/etc/apache2/ports.conf \
    && rm -rf /var/www/html \
    && ln -s /music /var/www/html

COPY config/musicindex.conf /etc/apache2/conf-enabled/
COPY config/site.conf /etc/apache2/sites-enabled/000-default.conf

WORKDIR /music

USER kah

EXPOSE 8080

COPY entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
