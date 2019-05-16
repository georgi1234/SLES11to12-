#!/bin/bash
###$1-old root VG name


CONF=etc
OLDSLES=mnt
LOG=set_configuration.log
COMMAND=systemctl
OPSPACKAGE=./opsware-agent-60.0.71639.1-linux-SLES-12-X86_64

##set mountpoint from old sles11 server
mount /dev/$1/root /$OLDSLES/
mount /dev/$1/opt /$OLDSLES/opt/
mount /dev/$1/tmp /$OLDSLES/tmp/
mount /dev/$1/home /$OLDSLES/usr2/local/

######apx agent install task######

cd  /opt/apxpccp/
tar -xvf  /opt/apxpccp/apxpccp_lin64_create_pks_after_move.tar 
/opt/apxpccc/./recreate_pccp_pks_after_move.sh
/opt/apxpccp/apxcntl restart

####post checkes######

/root/scripts/migration/./post_migration_checks
