---
title: "Getting started with freistilbox: Platform services"
weight: 3
tags: [ service database ]
---

# Platform services

## Databases

Each freistilbox application can use one or more databases. In order to make
configuring database access as easy as possible, freistilbox provides you with
pre-populated configuration snippets that you can simply include in your
application configuration. That way, you don't need to configure the database
credentials manually and changes are applied automatically.

### Drupal

In order to include the database configuration snippet, you just need to append
a single line to your `settings.production.php`:

```php
require_once('../config/drupal/settings-d7-dbXXX.php');
```

Obviously, you need to replace "dbXXX" with the actual database ID you'll find
in your website details. If your application uses a different Drupal version,
replace "d7" with the appropriate alternative (e.g. "d8" for Drupal 8).

<span class="label warning">WARNING</span> Make sure to add this line at the end
of your `settings.php` so the include file can override conflicting settings
that may be defined elsewhere.

If you'd like to view the contents of the configuration snippet, you can access
the [login shell][1] of your site instance; you'll find the file in
`~/current/config/drupal/`.

### WordPress

We don't provide configuration snippets for WordPress yet. Please [contact our
support team](/important_details/support.html) for help configuring your
WordPress application.

## Shared storage

In order to achieve perfect application performance, your application code is
deployed to each box locally. We can't do the same with the asset files that
your website manages, for example user uploads or log files. The reason for this
is the horizontal scalability of freistilbox. Perhaps your freistilbox Cluster
already consists of multiple boxes. At least, it might some day. And each of
these boxes needs to be able to create, see and use the same asset files. That's
why we can't store them locally on the application boxes. Instead, they need to
sit on a shared file storage where each of your cluster's boxes can access them. 

As a consequence, we need to somehow merge your application code with the
asset files stored on the shared file storage. The deployment process does this
according to what you define as "shared folders" in the `Boxfile`. Here's an
example section:

```yaml
shared_folders:
  - docroot/sites/default/files
```

As you can tell from the path `sites/default/files`, this is the `Boxfile` of a
Drupal installation. With this configuration, the deployment process will set up
your application's file system in such a way that everything under
`sites/default/files` will reside on the shared file storage.

Armed with this knowledge, you should be able to guess how the `shared_folders`
section for a WordPress application should look like:

```yaml
shared_folders:
  - docroot/wp-content/uploads
```

The shared folders you declare in the `Boxfile` are created automatically by our
deployment process.

<span class="label important">IMPORTANT</span> In order for the merging of local
application code with shared file storage to work, it's important that your
application repository __does not contain__ the shared folders themselves. You
can prevent them from being added by accident by adding them to your
repository's `.gitignore` file.

<!-- TODO: Elaborate on .gitignore -->

---

_Next:_ We've already mentioned our [deployment process](deployment.html). Let's
take a closer look how it works!
