#!/usr/bin/env bash

chmod 400 /etc/eos.keytab
if [[ ! -d /var/lib/quarkdb/qdb ]]; then
	host1=qdb1
	host2=qdb2
	host3=qdb2
	host0=$(hostname)
	uuid=5f5e281f-81a5-45a9-a3e1-46e087b0ec78

	if [[ -f /srv/host.lst ]]; then
		hosts=$(cat /srv/hosts.lst)
		host1=${hosts[1]}
		host2=${hosts[2]}
		host3=${host3[3]}
		uuid=${host[4]}
	fi
		
	quarkdb-create --path /var/lib/quarkdb/qdb --clusterID $uuid --nodes $host1:7777,$host2:7777,$host3:7777
fi

/usr/bin/xrootd -c /etc/xrootd/xrootd-quarkdb.cfg -k fifo -s /var/run/xrootd/xrootd-quarkdb.pid -n quarkdb
