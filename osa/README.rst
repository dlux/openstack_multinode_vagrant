OSA
====

Flow:

..code_block::

  ┌────────────────────┐     ┌────────────────┐     ┌────────────┐
  │ Prepare deployment |     | Prepare target |     | Configure  |
  │      host          | --> |      hosts     | --> | Deployment |  ───┐
  └────────────────────┘     └────────────────┘     └────────────┘     |
                                                                       |
                          ┌────────────────┐     ┌───────────────┐     |
                          | Prepare target | <-- | Run playbooks | <───┘
                          |      hosts     |     |               |
                          └────────────────┘     └───────────────┘
