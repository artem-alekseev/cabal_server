FROM centos:7

ARG CONNECT_IP
ARG DB_PASSWORD
ARG EXP_RATE
ARG SEXP_RATE
ARG CEXP_RATE
ARG DROP_RATE
ARG ALZ_RATE
ARG BALZ_RATE
ARG PEXP_RATE
ARG WEXP_RATE
ARG ITEMS_PER_DROP

ENV ACCEPT_EULA=Y
ENV DB_PASSWORD=$DB_PASSWORD
ENV CONNECT_IP=$CONNECT_IP
ENV EXP_RATE=$EXP_RATE
ENV SEXP_RATE=$SEXP_RATE
ENV CEXP_RATE=$CEXP_RATE
ENV DROP_RATE=$DROP_RATE
ENV ALZ_RATE=$ALZ_RATE
ENV BALZ_RATE=$BALZ_RATE
ENV PEXP_RATE=$PEXP_RATE
ENV WEXP_RATE=$WEXP_RATE
ENV ITEMS_PER_DROP=$ITEMS_PER_DROP

RUN curl -o /etc/yum.repos.d/msprod.repo https://packages.microsoft.com/config/rhel/7/prod.repo
RUN yum update; yum -y install glibc.i686 libgcc.i686 libstdc++.i686 openssl-devel.i686 msodbcsql17.10 mssql-tools nano bind-utils dos2unix

RUN ln -s /usr/lib/libcrypto.so /usr/lib/libcrypto.so.4 && ln -s /usr/lib/libcrypto.so /usr/lib/libcrypto.so.6

COPY etc /etc
COPY usr /usr

RUN ln -s /etc/cabal/Template/sh/cabal_create_server.sh /usr/bin/cabal_create_server \
 && ln -s /etc/cabal/Template/sh/cabal_create_chanel.sh /usr/bin/cabal_create_chanel \
 && ln -s /etc/cabal/Template/sh/global_mgr_svr.sh /usr/bin/global_mgr_svr \
 && ln -s /etc/cabal/Template/sh/config_db_passwd.sh /usr/bin/config_db_passwd \
 && ln -s /etc/cabal/Template/sh/world_svr_start.sh /usr/bin/world_svr_start \
 && chmod +x /etc/cabal/Template/sh/cabal_create_server.sh \
 && chmod +x /etc/cabal/Template/sh/cabal_create_chanel.sh \
 && chmod +x /etc/cabal/Template/sh/global_mgr_svr.sh \
 && chmod +x /etc/cabal/Template/sh/config_db_passwd.sh \
 && chmod +x /etc/cabal/Template/sh/world_svr_start.sh \
 && mkdir -p /var/log/cabal \
 && chmod -R 777 /etc/cabal

RUN dos2unix /etc/cabal/Template/sh/*.sh
RUN dos2unix /etc/cabal/Template/conf/*.ini

RUN cabal_create_server 1
RUN cabal_create_chanel 1 1
RUN cabal_create_chanel 1 2
RUN cabal_create_chanel 1 3
RUN cabal_create_chanel 1 4
RUN cabal_create_chanel 1 5
RUN cabal_create_chanel 1 6
RUN cabal_create_chanel 1 7

RUN config_db_passwd