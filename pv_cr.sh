for p in {0..10}; do echo "- - -" > /sys/class/scsi_host/host$p/scan;done 2>/dev/null


cat /proc/partitions

read

pvcreate $1
