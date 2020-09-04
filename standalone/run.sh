#!/bin/sh

if [ -z $1 ]; then
  echo 'Rsyslog client hostname is required.\n'
  echo 'Command usage:'
  echo './run.sh <client_hostname> <server_hostname>'
  exit 1;
fi

if [ -z $2 ]; then
  echo 'Rsyslog server hostname is required.\n'
  echo 'Command usage:'
  echo './run.sh <client_hostname> <server_hostname>'
  exit 1;
fi

echo "[all]\n$1 ansible_connection=ssh ansible_user=root" > standalone.inventory

ansible-playbook -v -i standalone.inventory -e rsyslog_client_hostname=$1 -e rsyslog_server_hostname=$2 run.playbook.yml
