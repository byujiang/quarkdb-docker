#!/usr/bin/env bash

chmod 400 /etc/eos.keytab
if [[ ! -d /var/lib/quarkdb/qdb ]]; then
	quarkdb-create --path /var/lib/quarkdb/qdb --clusterID 5f5e281f-81a5-45a9-a3e1-46e087b0ec78 --nodes qdb1:6666,qdb2:7777,qdb3:8888
fi
/usr/bin/xrootd -l /var/log/xrootd/xrootd.log -c /etc/xrootd/xrootd-quarkdb.cfg -k fifo -s /var/run/xrootd/xrootd-quarkdb.pid -n quarkdb
