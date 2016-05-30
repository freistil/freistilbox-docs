---
title: How do the changes in Drupal 8 affect freistilbox?
---

# How to run Drupal 8 on freistilbox

Drupal 7 to Drupal 8 is a huge change and it'll be great to see what our
customers get to build on the long list of improvements that came with the new
release. Hosting Drupal 8 on freistilbox is straightforward. Only a few changes
in the new version affect the hosting layer and in this article, we cover all
you need to know.

## freistilbox configuration snippets

You can use the Drupal 8 versions of our ready-made
[configuration snippets](/important_details/includes.html) that make it easy for
you to set the right reverse proxy values and database credentials.

Please note that the admin interface of your web application will not reflect
the settings in these include files. If you need to see the actual configuration
values, take a look at the snippets themselves or use
[Drush](/advanced_usage/drush.html).

## Configuration management

Drupal 8 has the ability to export its settings from the application database to
a set of text files. And it can also update its active configuration from
changes made to the configuration file set on disk. Since your web application
creates these configuration files on-the-fly, you can not include them in the
Git repository along with your application code. The right location for these
files is the private section in the shared file storage where your boxes alone
can read and update them.

```php
$config_directories['active'] = '../private/config/active';
$config_directories['staging'] = '../private/config/staging';
```

