#!/bin/bash
echo $HOSTNAME
if [[ $HOSTNAME == p* ]] || [[ $HOSTNAME == pdc* ]] || [[ $HOSTNAME == rancher-template-rhel* ]]; then
        echo "This is Phoenix"
else
        echo "This is not Phoenix"
fi