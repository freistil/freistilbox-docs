---
title: Why can't my application make changes to its installation files?
zendesk-id: 201084495
tags:
  - deployment
  - filesystem
---

If your web application tries to modify its own files, for example in order to install an update, it will fail. The reason is that freistilbox needs to maintain consistency of your application code across all the boxes of your freistilbox cluster. This consistency would be compromised if an application process running on one of these boxes would be able to make local changes.

For this reason, application updates can only be deployed via the website's Git repository. 

