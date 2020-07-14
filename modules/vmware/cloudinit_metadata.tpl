{
    "instance-id": "${instance_id}",
    "local-hostname": "${instance_id}",
    "network-interfaces": "auto eth0\niface eth0 inet static\ndns-nameservers ${dns_nameservers}\ndns-search ${dns_search}"
}
