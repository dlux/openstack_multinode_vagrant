OSA
====


.. code_block:: bash

  Deployment Flow:

  ┌────────────────────┐     ┌────────────────┐     ┌────────────┐
  │ Prepare deployment |     | Prepare target |     | Configure  |
  │      host          | --> |      hosts     | --> | Deployment |  ───┐
  └────────────────────┘     └────────────────┘     └────────────┘     |
                                                                       |
                          ┌────────────────┐     ┌───────────────┐     |
                          | Prepare target | <-- | Run playbooks | <───┘
                          |      hosts     |     |               |
                          └────────────────┘     └───────────────┘
