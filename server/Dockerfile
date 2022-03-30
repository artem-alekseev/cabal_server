FROM centos:7

ARG CONNECT_IP
ARG DB_PASSWORD

RUN yum update; yum -y install glibc.i686 libgcc.i686 libstdc++.i686 openssl-devel.i686 nano;

RUN ln -s /usr/lib/libcrypto.so /usr/lib/libcrypto.so.4
RUN ln -s /usr/lib/libcrypto.so /usr/lib/libcrypto.so.6

COPY etc /etc
COPY usr /usr

RUN ln -s /etc/cabal/Template/sh/cabal_config.sh /usr/bin/cabal_config
RUN ln -s /etc/cabal/Template/sh/cabal_create_server.sh /usr/bin/cabal_create_server
RUN ln -s /etc/cabal/Template/sh/cabal_create_chanel.sh /usr/bin/cabal_create_chanel
RUN ln -s /etc/cabal/Template/sh/cabal_start.sh /usr/bin/cabal_start

RUN chmod +x /etc/cabal/Template/sh/cabal_config.sh
RUN chmod +x /etc/cabal/Template/sh/cabal_create_server.sh
RUN chmod +x /etc/cabal/Template/sh/cabal_create_chanel.sh
RUN chmod +x /etc/cabal/Template/sh/cabal_start.sh

RUN mkdir -p /var/log/cabal

RUN chmod -R 777 /etc/cabal

RUN cabal_create_server 1
RUN cabal_create_chanel 1 1
RUN cabal_create_chanel 1 2
RUN cabal_create_chanel 1 3
RUN cabal_create_chanel 1 4
RUN cabal_create_chanel 1 5
RUN cabal_create_chanel 1 6
RUN cabal_create_chanel 1 7

RUN cabal_config $CONNECT_IP $DB_PASSWORD

CMD ["cabal_start"]