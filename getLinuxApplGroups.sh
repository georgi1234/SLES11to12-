#!/bin/bash

GROUP11="/apps/sapinst/users/patrick/misc/SLES12/group_sles11.default"

while read line
do
    # $line contains one whole passwd line, but we just need the first field
    group="$(echo $line | cut -d ':' -f 1):"

    # Check if the user is defined in the default file, otherwise print the while passwd line
    if ! grep "$group" $GROUP11 &> /dev/null
    then
        echo $line
    fi
done < /etc/group
