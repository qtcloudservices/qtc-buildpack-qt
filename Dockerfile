FROM qtcs/cedarish:cedar-14
MAINTAINER Jari Kolehmainen <jari.kolehmainen@digia.com>


ADD package_qt.sh /package_qt.sh
RUN chmod +x /*.sh

ENTRYPOINT ["/package_qt.sh"]
