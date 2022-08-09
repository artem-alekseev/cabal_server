FROM centos:7

ENV ACCEPT_EULA=Y

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

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/bin/echo", "Define a custom command on docker-compose.yml file"]