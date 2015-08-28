---
title: How can I force a cache refresh?
status: published
zendesk-id: 28632626
---

The Varnish proxy cache stores data allowed for caching according to the HTTP headers that your website delivers. After the cache lifetime of a specific content object has expired, Varnish removes it from its cache and requests an update from the backend web servers.

## Via a Drupal module

If you'd like to influence the cache update more directly, use the [Purge module](http://drupal.org/project/purge). It works together with the Cache Expiration module, can be triggered by drush and can even be extendend by using the Rules module.

Configuration is straight forward, just set "Proxy Url" on `admin/config/development/performance/purge` to "http://cXXv.freistilbox.net:80" (make sure to replace "cXXv" with the correct cluster number, e.g. "c42v").


## Manually

To manually remove a certain content object from the cache, you can send a PURGE request from the command line:

    curl -X PURGE http://my.dom.ain/path/to/the/content

This removes the object referenced by the URL from the cache.
