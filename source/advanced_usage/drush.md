---
title: Using Drush
status: published
zendesk-id: 201088195
---

# Using Drush

## How to create a site alias

Since you have access to a dedicated shell login host, using Drush for Drupal
maintenance is easy.

Here is a minimal `aliases.drushrc.php`:

    <?php
    $aliases['s123'] = array(
      'uri' => 's123.cXX.freistilbox.net',
      'root' => '/srv/www/freistilbox/home/s123/current/docroot',
      'remote-host' => 'cXXs.freistilbox.net',
      'remote-user' => 's123',
    );

As always, replace the parts for site ID ("s123") and shell login host ("cXXs")
with the actual values corresponding with your website instance.


## How to query the actual settings in Drupal 8

Neither the Drupal 8 admin interface nor the Drush `cget` command will by
default reflect configuration settings made in include files such as our
[configuration snippets](/important_details/includes.html):

```
$ drush cget syslog.settings
identity: drupal
facility: '128'
...
```

To get the actual value of a configuration setting, use the
`--include-overridden` switch:

```
$ drush cget syslog.settings --include-overridden
identity: s1503
facility: '128'
...
```

