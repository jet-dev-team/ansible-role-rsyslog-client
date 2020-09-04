<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Ansible_logo.svg/1200px-Ansible_logo.svg.png" height="48" alt="Ansible logo">
<img src="https://www.rsyslog.com/files/2019/01/logo_neu_cropped.png" height="48" alt="Rsyslog logo">
<img src="https://jet.dev/img/jet_dev_logo_horizontal_optimized.svg" height="48" alt="Jet.Dev logo">

&nbsp;

# Ansible role: Rsyslog Client

An [Ansible](https://www.ansible.com/) role that installs [Rsyslog](https://www.rsyslog.com/) and configures a server as rsyslog client.

&nbsp;

## Requirements

1. ### SSL/TLS certificates

   The role assumes that you already copied certificates to a client server.

   Certificates must be placed under `/var/data/rsyslog_certs` directory on the client. The role automatically ckecks and fix files permissions.

&nbsp;

## Role variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

```
rsyslog_server_hostname: ''
```

**Required!** A hostname of rsyslog server (without protocol prefix). Example: logs-server.example.com

```
rsyslog_server_port: ''
```

**Required!** A Rsyslog service server port number.

```
syslog_client_hostname: ''
```

**Required!** A hostname of rsyslog client (without protocol prefix). Example: some-app.example.com

```
rsyslog_server_clients_update: True
```

Automaticaly updates clients list on the Rsyslog server.

&nbsp;

## Dependencies

None.

&nbsp;

## Example playbook

```yaml
- hosts: host
  roles:
    - { role: jet-dev.rsyslog-client }
```

&nbsp;

## Standalone run

The role can be run in a standalone mode.

**Important!** It requires Ansible to be [installed](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

### How to run

#### Quick path

1. Execute `standalone/run.sh` script with client's hostname as a first parameter and server's hostname as a second parameter.

```bash
./standalone/run.sh client.example.com log-server.example.com
```

#### Advanced

1. Create an [inventory](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html) file within `standalone` directory or use already created `standalone.inventory` file:

```bash
standalone/standalone.inventory
```

2. Populate the inventory file with required host(s) and (optional) [host / group variables](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html).
   Example:

```
[all]
client.example.com ansible_connection=ssh ansible_user=root
```

3. Run `standalone/run.playbook.yml` with `rsyslog_server_hostname` as extra variable (you can pass other variables in this way):

```bash
ansible-playbook -v -i standalone.inventory -e rsyslog_server_hostname=log-server.example.com run.playbook.yml
```

Note: `rsyslog_client_hostname` variable will be automatically populated from special Ansible variable `inventory_hostname`.

&nbsp;

## License

MIT / BSD

&nbsp;

## Authors information

Role was created in 2020 by [Jet.Dev](https://jet.dev).

Repository on [GitHub](https://github.com/jet-dev-team/ansible-role-rsyslog-client).
