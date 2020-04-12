##########################
FROM centos:7

RUN yum clean all
ADD quarkdb.repo /etc/yum.repos.d/

WORKDIR /srv
ADD run.sh /srv

RUN yum install epel-release -y && yum makecache && yum install -y xrootd-server redis quarkdb && yum clean all

RUN mkdir -p /var/lib/quarkdb /var/log/xrootd/quarkdb && chown -R daemon:daemon /var/lib/quarkdb /var/log/xrootd /var/log/xrootd/quarkdb
USER daemon

#CMD /usr/bin/xrootd -l /var/log/xrootd/xrootd.log -c /etc/xrootd/xrootd-quarkdb.cfg -k fifo -s /var/run/xrootd/xrootd-quarkdb.pid -n quarkdb
ENTRYPOINT ["/srv/run.sh"]
