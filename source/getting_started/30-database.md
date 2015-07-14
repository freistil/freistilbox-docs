status: published
zendesk-article-id: 201084715
zendesk-article-tags:
  - database
  - mysql
  - configuration

# Accessing the database

Each freistilbox site instance has its own database(s). In order to make configuring database access as easy as possible, freistilbox provides you with pre-populated [configuration snippets][2] that you can simply include in your application configuration. That way, you don't need to configure the database credentials manually and changes are applied automatically.

You'll get the name of the configuration snippet with the details of each new site instance.


## Drupal

In order to include the database configuration snippet, you just need to add a single line to your `settings.php`:

    require_once('../config/drupal/settings-d7-dbXXX.php');

Obviously, you need to replace "dbXXX" with the database ID of the site instance. If your application uses Drupal 6, replace "d7" with "d6".

<span class="label warning">WARNING</span> Make sure to add this line at the end of your `settings.php` so the snippet settings override conflicting settings that may be defined elsewhere.

If you'd like to view the contents of the configuration snippet, you can access the [login shell][1] of your site instance; you'll find the file in `current/config/drupal/`.

[1]: https://freistil.zendesk.com/hc/en-us/articles/201084695
[2]: https://freistil.zendesk.com/hc/en-us/articles/201084635
