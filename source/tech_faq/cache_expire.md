---
title: Why does the cache not update when assets are changed?
zendesk-id: 201084485
tags:
  - varnish
  - cache
  - htaccess
---

# Possible causes of looong caching times

You have updated some of your website's image or CSS files but even after hours or days, the Varnish cache still delivers outdated content.

A common cause for this behaviour is a setting in Drupal's default `.htaccess` file:

```apache
# Cache all files for 2 weeks after access (A).
ExpiresDefault A1209600
```

You should probably lower this TTL ("Time To Live") setting to a more reasonable value, for example 4 hours (= 14,400 seconds):

```apache
# Cache all files for 4 hours after access A).
ExpiresDefault A14400
```

See also: "[How can I force immediate cache refresh?](cache_purge.html)"
