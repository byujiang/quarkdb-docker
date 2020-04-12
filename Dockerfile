##########################
FROM centos:7

RUN yum clean all

WORKDIR /srv
ADD src/run.sh /srv
ADD src/quarkdb.repo /etc/yum.repos.d/

RUN yum install epel-release -y && yum makecache && yum install -y xrootd-server redis quarkdb && yum clean all

RUN mkdir -p /var/lib/quarkdb /var/log/xrootd/quarkdb && chown -R daemon:daemon /var/lib/quarkdb /var/log/xrootd /var/log/xrootd/quarkdb

USER daemon
ENTRYPOINT ["/srv/run.sh"]
