FROM centos:7

LABEL maintainer="martin.weindel@gmail.com"

ARG KUDU_RPM=https://github.com/MartinWeindel/kudu-rpm/releases/download/v1.7.0-1/kudu-1.7.0-1.x86_64.rpm

RUN yum install -y ${KUDU_RPM}

ENV KUDU_HOME=/usr/lib/kudu
ENV KUDU_MASTER=localhost
ENV KUDU_MASTER_OPTS="--log_dir=/var/log/kudu \
         --fs_wal_dir=/var/lib/kudu/master \
         --fs_data_dirs=/var/lib/kudu/master \
         --use_hybrid_clock=false"
ENV KUDU_TSERVER_OPTS="--log_dir=/var/log/kudu \
         --fs_wal_dir=/var/lib/kudu/tserver \
         --fs_data_dirs=/var/lib/kudu/tserver \
         --use_hybrid_clock=false"

VOLUME /var/lib/kudu

COPY ./entrypoint /

WORKDIR /app

USER kudu

ENTRYPOINT ["/entrypoint"]
