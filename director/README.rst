RED HAT OPENSTACK PLATFORM DIRECTOR
===================================

This automation PoC is to install Red Hat OpenStack Platform 11 via Director
toolset on top of virtual manchines provisioned with virtualBox and Vagrant.

Director toolset is based on TripleO_ (OpenStack On OpenStack) - uses two main
concepts: an undercloud and an overcloud. The undercloud is a full all-in-one
OpenStack environment which will discover the nodes of the overcloud, install,
and configure a brand new OpenStack environment on top of the discovered nodes.

.. _TripleO: https://docs.openstack.org/developer/tripleo-docs/

Architecture:
-------------
.. code-block:: bash

  ┌────────────────────────────────────────────────────────────────────────┐
  | OVERCLOUD (Production OpenStack Environment)                           |
  |                                                                        |
  |     ┌────────────┐       ┌────────────┐      ┌────────────┐            |
  |     | Controller |       |   Compute  |      |   Storage  |            |
  |     |   Nodes    |       |    Nodes   |      |   Nodes    |            |
  |     └────────────┘       └────────────┘      └────────────┘            |
  |                                                                        |
  |                                 ^                                      |
  └──────────────────────────────── | ─────────────────────────────────────┘
                                   |
  ┌──────────────────────────────── | ─────────────────────────────────────┐
  |             UNDERCLOUD (Director - AIO OpenStack)                      |
  |                                                                        |
  └────────────────────────────────────────────────────────────────────────┘

Deployment Flow:
----------------

.. code-block:: bash

  ┌───────────────┐     ┌───────────────────┐     ┌────────────┐
  │  Install the  |     | Config overcloud  |     | Create     |
  │  Undercloud   | --> |    requirements   | --> | overcloud  |  ───┐
  └───────────────┘     └───────────────────┘     └────────────┘     |
                                                                     |
                                       ┌─────────────────────┐       |
                                       | Run post-creatation | <─────┘
                                       | task on overcloud   |
                                       └─────────────────────┘
