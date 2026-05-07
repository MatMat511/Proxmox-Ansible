#!/bin/bash
BAUX="/var/lib/misc/dnsmasq.leases"
OUT="./inventaire.ini"
{
echo "[nodes]"
awk '{ if ($4 != "*") print $4 " ansible_host=" $3 }' "$BAUX"
echo ""
echo "[all:vars]"
echo "ansible_user=user"
echo "ansible_ssh_pass=poseidon"
echo "ansible_become=true"
echo "ansible_become_method=sudo"
echo "ansible_ssh_common_args='-o StrictHostKeyChecking=no'"
} > "$OUT"
