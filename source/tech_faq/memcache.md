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

Configuration example for Drupal 7:

```php
<?php
...
require_once('../config/drupal/settings-d7-memcache.php');  
$conf['cache_backends'][] = 'sites/all/modules/contrib/memcache/memcache.inc';
```

Configuration example for Drupal 6:

```php
<?php
...
require_once('../config/drupal/settings-d6-memcache.php');  
$conf['cache_inc'] = './sites/all/modules/contrib/memcache/memcache.inc';
```

<span class="label important">IMPORTANT</span> Please make sure to set the
correct path to the `memcache.inc` file.
