---
title: Configuration includes
status: published
zendesk-id: 201084595
---

# Hosting configuration includes

## Configuring the website

For each website instance, we provide a configuration file with basic settings,
for example the correct reverse proxy settings:

    ../config/drupal/settings-DRUPALVERSION-site.php

Replace `DRUPALVERSION` with "d6" or "d7".

Here's an example that includes the Drupal 6 site configuration for client
`client1`, website instance `site007`:

    require '../config/drupal/settings-d6-site.php';

## Configuring the database

For each database of your website instance, we provide a separate configuration
file that contains all necessary credentials to access the database from Drupal.
The directory path of these configuration files follows this schema:

    ../config/drupal/settings-DRUPALVERSION-DBID.php

Replace `DRUPALVERSION` with "d6" or "d7".

Here's an example that includes the Drupal 6 database configuration for the
database `db007`:

    require '../config/drupal/settings-d6-db007.php';

