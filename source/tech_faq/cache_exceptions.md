---
title: How can I prevent caching for parts of my website?
zendesk-id: 201084525
tags:
  - cache
  - varnish
  - htaccess
---

Varnish manages all cache content following the rules it receives in HTTP headers from both the visitor and your application. Making modifications to the Varnish configuration in order to change its behaviour is really only necessary in rare edge cases. Instead, simply make sure your web application sends the appropriate HTTP headers.

For example, creating a file `/sites/default/files/nocache/.htaccess` with the following contents will disable caching for all content below the `nocache` path.

```
<IfModule mod_headers.c>
Header unset ETag
Header set Cache-Control "max-age=0, no-cache, no-store, must-revalidate"
Header set Pragma "no-cache"
Header set Expires "Wed, 18 Feb 1970 17:00:00 GMT"
</IfModule>
```

<span class="label warning">WARNING</span> Please be aware that disabling caching will increase the load on both your application boxes and the database, which will affect content delivery performance.

