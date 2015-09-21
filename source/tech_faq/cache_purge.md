---
title: How can I force an immediate cache refresh?
status: published
zendesk-id: 28632626
tags:
  - varnish
  - cache
  - drush
---

# How to force Varnish to update cache contents

The Varnish proxy cache stores data allowed for caching according to the HTTP
headers that your website delivers. After the cache lifetime of a specific
content object has expired, Varnish removes it from its cache and requests an
update from the backend web servers.

## Cache invalidation via Drupal module

If you'd like to delete stale cache content directly from Drupal, use the [Purge
module](http://drupal.org/project/purge). It works in conjunction with the Cache
Expiration module, can be triggered by Drush and can even be extendend by using
the Rules module.

Configuration is straightforward, just set "Proxy Url" on
`admin/config/development/performance/purge` to "http://cXXv.freistilbox.net:80"
(make sure to replace "cXXv" with the correct cluster number, e.g. "c42v").

## Manual cache invalidation

To manually remove a certain content object from the cache, you can send a
`PURGE` request from the command line:

    curl -X PURGE http://my.dom.ain/path/to/the/content

This command will remove the object referenced by the URL from the cache.
