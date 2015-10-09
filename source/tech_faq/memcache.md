---
title: How do I enable memcached?
tags:
  - memcache
  - configuration
---

# How to enable memcached in Drupal

freistilbox provides you with a ready-to-run configuration file containing all
necessary Memcache settings. Simply include the file in your
`settings.production.php` and set the right caching module for your Drupal
version.

<span class="label important">IMPORTANT</span> Make sure to set the
right path to the `memcache.inc` file in your application source tree.

## Drupal 8

At the time of writing, the Memcache module has critical issues that need
to be resolved before it can be used with Drupal 8.

## Drupal 7

Configuration example:

```php
<?php
...
require_once('../config/drupal/settings-d7-memcache.php');  
$conf['cache_backends'][] = 'sites/all/modules/contrib/memcache/memcache.inc';
```

## Drupal 6

Configuration example:

```php
<?php
...
require_once('../config/drupal/settings-d6-memcache.php');  
$conf['cache_inc'] = './sites/all/modules/contrib/memcache/memcache.inc';
```

