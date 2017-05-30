# openstack_multinode_vagrant

Idea is to setup an OpenStack deployment multinode with Vagrant VMs - Enabling
3 to 5 nodes. Supported deployers and operating systems:

### RDO

Redhat Director OpenStack

- Redhat
- CentOS

### OSA

OpenStack-Ansible

- Ubuntu

### TripleO

- Suse

Deployment health will be validated by testing it via Tempest smoke test suite.

Some objectives:

Id differences in configurations, underlying network topology, different tools,

Does tempest configuration discovery needed? Is it enought with minimal values
from interop guidelines?
