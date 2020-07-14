#!/bin/bash

export GOVC_URL=""
export GOVC_INSECURE=true
export GOVC_USERNAME=administrator@vsphere.local
export GOVC_PASSWORD="NEED TO ADD"

for VM in `cat hostnames.txt `;
do
   echo "###########################################################"
   echo "Connecting vmnic on $VM"
   govc device.connect -vm $VM ethernet-0

   HOST=`echo $VM|cut -f 1 -d '.'`
   TYPE=`echo $HOST|cut -f 1 -d '0'`

   echo "untainting resource $HOST"
   terraform untaint module.$TYPE.vsphere_virtual_machine.vm[\"$HOST\"];
   echo ""
done
