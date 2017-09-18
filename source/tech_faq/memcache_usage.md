---
title: Memcached usage
tags:
  - memcache
  - usage
  - troubleshooting
---

# How to interact with memcached on freistilbox

On freistilbox, memcached is by default installed on the first of the two Varnish
boxes that are part of your cluster. We set a DNS alias for that machine,
following the form:

cXXXv.freistilbox.net

where XXX is your cluster's ID. If e. g. you cluster ID is 120, your memcached
runs on c120v.freistilbox.net.

Please note that we firewall our memcached installations so that they're not
reachable through the internet. You can interact with it from the shellhost,
using a combination of `echo` and `netcat` commands.

## Get memcached statistics

Issue the following on your shellhost. Do not forget to replace XXX with your
actual cluster ID:

```
echo stats | nc cXXXv.freistilbox.net 11211
```

## Flush memcached objects

```
echo flush_all | nc cXXXv.freistilbox.net 11211
```

## More memcached commands

Find here a complete list of commands you can send to memcached:

https://github.com/memcached/memcached/wiki/Commands

