---
title: Pre-configured settings snippets
status: published
zendesk-id: 201084635
tags:
  - configuration
---

# Pre-configured settings snippets

In the `current` directory, you'll find a subdirectory named `config` with
CMS-specific configuration snippets. You can include these snippets into your
web application settings to have important services configured automatically.

In PHP, you can include such a snippet simply with the statement
`require_once('../config/$CMS/$CONF');` (this path is relative to your
`docroot`).

Example: `settings.php` for a Drupal 7 site

    <?php
    require_once('../config/drupal/settings-d7-db123.php');
    require_once('../config/drupal/settings-d7-site.php');
    ?>

<span class="label warning">WARNING</span> If you insert these include
statements at the beginning of your configuration file, their settings can be
overridden by configuration changes in the file further below. This can be a
useful or a confusing feature, depending on your approach.

## Drupal configuration snippets

Drupal-specific configuration snippets are stored in `../config/drupal`. At the
moment, the following configuration files are available to you:

* **Miscellaneous settings:** `settings-d7-site.php` (this file configures
  things like `reverse_proxy`)
* **Database configuration:** `settings-d7-dbXXX.php` (replace "dbXXX" with the
  database name mentioned in the installation details of your site instance)

For Drupal 6 sites, simply replace "d7" with "d6".
