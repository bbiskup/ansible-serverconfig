Ansible Server Configuration
============================


Usage
-----

- Add ssh key to ``~/.ssh/authorized_keys`` on target machines
- Supply an ``inventory/hosts`` file (supply appropriate values):

::

  myhost1 < ansible_ssh_host=<host1> 
  myhost2 ansible_ssh_host=<host2>
  myhost3 ansible_ssh_host=<host3> ansible_ssh_port=22

  [servers:vars]
  ansible_ssh_port=<port>
  ansible_ssh_user=<user>

  [servers]
  myhost1
  myhost2
  myhost3

  [sentry_servers]
  myhost1

  [godev_machines]
  myhost2

  - Supply an ``inventory/group_vars/servers`` file with appropriate settings:

::

  timezone: <your timezone>
  trusted_hosts:
    - <host4>
    - <host5>
    - <host6>

- Supply an Ansible vault password file.

- Run ``make provision_full``

Testing
-------

`Vagrant <http://www.vagrantup.com>`_ may be used to test provisioning.
The hosts configured in ``Vagrantfile`` must match the inventory.