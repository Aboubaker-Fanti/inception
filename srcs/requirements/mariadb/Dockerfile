FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y mariadb-server systemctl vim
COPY tools/configure.sh /tmp/configure.sh
CMD ["bash", "./tmp/configure.sh"]
