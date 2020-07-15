FROM ubuntu:18.04
RUN apt update && apt -y upgrade
WORKDIR /root

# Copy running file and config
COPY squid-4.12 /usr/local/squid
COPY blocked.domains.acl /usr/local/squid/etc/
COPY rootCA.crt /usr/local/squid/etc/
COPY squid.conf /usr/local/squid/etc/

# Create cache folder
RUN /usr/local/squid/sbin/squid -z
RUN /usr/local/squid/libexec/security_file_certgen -c -s /usr/local/squid/var/logs/ssl_db -M 16MB
RUN chown -R proxy.proxy /usr/local/squid

EXPOSE 3128
ENTRYPOINT [ "/usr/local/squid/sbin/squid -f /usr/local/squid/etc/squid.conf" ]
