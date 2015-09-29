---
title: Why do database records have only odd (or only even) key values?
zendesk-id: 201084545
tags:
  - database
  - mysql
---

# Why database records have only odd (or only even) key values

You'll notice that on our freistilbox clusters, generic primary keys, e.g. node
IDs, always grow by an increment of 2.

The reason is that we use a dual-primary replication scheme and in order to
prevent any kind of key collision between both nodes, one database node only
assigns odd `auto_increment` numbers, the other one only even ones.

