---
title: Why does my web application lose all its cookies?
zendesk-id: 201084535
tags:
  - cookie
  - cache
---

# Why freistilbox drops (almost) all cookies

The enormous web application performance you get with freistilbox comes in part
from using a content cache built on [Varnish](http://www.varnish-cache.org) in
front of the application boxes. This cache acts as a proxy as it receives all
HTTP requests first. If it has the requested object already in memory, it will
immediately send it back to the visitor. If not, it forwards the request to an
application box and stores its response in memory. This way, the proxy cache can
deliver objects that get requested often much faster than the application box
could, especially if these content objects are generated dynamically.

There is one thing that effectively prevents the cache from storing objects, and
that is a cookie. A cookie makes all HTTP requests specific for the individual
visitor, and the cache will only store non-individual content. Otherwise, it
would risk delivering private content that was intended for a different visitor.

Since we need to prevent random cookies from destroying the performance
improvements we gain from the cache, **we remove all cookies from incoming HTTP
requests**. There is only one exception: The Drupal and WordPress session
cookies stay untouched because they're essential for website authentication.
(That's why the cache unfortunately can't speed up page delivery for Drupal 6:
This version always sends a session cookie. We suggest using Pressflow Drupal
instead.)

If you need to deal with visitor-specific data, please use the native session
handling of your CMS. It will not be affected by the cache; but be aware that
this also means losing its content delivery boost.
