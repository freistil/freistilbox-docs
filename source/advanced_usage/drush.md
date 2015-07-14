status: published
zendesk-article-id: 201088195

# Using Drush

## Creating a site alias for drush

Since you have access to a dedicated shell login host, using Drush for Drupal maintenance is easy.

Here is a minimal `aliases.drushrc.php`:

    <?php
    $aliases['s123'] = array(
      'uri' => 's123.cXX.freistilbox.net',
      'root' => '/srv/www/freistilbox/home/s123/current/docroot',
      'remote-host' => 'cXXs.freistilbox.net',
      'remote-user' => 's123',
    );

As always, replace the parts for site ID ("s123") and shell login host ("cXXs") with the actual values corresponding with your website instance.
