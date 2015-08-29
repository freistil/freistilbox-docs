---
title: Where can my application put temporary files?
zendesk-id: 201084515
tags:
  - filesystem
---

For security reasons, different website instances on a freistilbox Cluster do not all use the directory `/tmp`; access to this directory might even be blocked. Every website instance gets its own directory for temporary files on the same hierarchical level as the application's `docroot`.

In Drupal, enter "`../tmp`" as the temporary storage directory in the filesystem configuration (_Administer > Configuration > Media: File system_).
