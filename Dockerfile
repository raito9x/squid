FROM raito9x/ubuntu:latest
RUN apt update && apt -y upgrade
RUN apt install -y vim iputils-ping telnet
WORKDIR /root
COPY squid-4.12 /root/squid
RUN cd squid && ./configure --enable-ssl-crtd --with-openssl --with-default-user=squid && make && make install
