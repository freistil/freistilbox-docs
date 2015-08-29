---
title: The Boxfile
status: published
zendesk-id: 201084675
tags:
  - boxfile
  - deployment
---

The Boxfile is a file of the same name that is stored in the root directory of a single web application's repository. It defines attributes that control the deployment process.

<span class="label warning">WARNING</span> The Boxfile is in YAML format. Please note that YAML does not support tabs for indenting; you need to use one or more spaces.

Your website repository doesn't necessarily contain a Boxfile from the start. So, if you need one or more of the features described below, simply create one.

<span class="label warning">WARNING</span> The file name is case-sensitive. Please make sure that it starts with a capital "B".

Here is some example content for a Boxfile. It first defines a shared folder whose contents need to be available on all web boxes. Then, it lists a set of configuration files that are stored in the repository and need to be activated depending on the staging environment that is assigned to the website.

```yaml
version: 2.0
shared_folders:
  - docroot/sites/default/files
env_specific_files:
  .htaccess:
    production: .htaccess.production
    test: .htaccess.test
  .htpasswd:
    production: .htpasswd.production
    test: .htpasswd.test
  sites/default/settings.php:
    production: settings.production.php
    test: settings.test.php
```


## Shared folders

Shared folders are part of the application code space but need to be shared between all application servers of a cluster since they are writable by the web application.

Public shared folders are defined in a collection named `shared_folders` as a list of paths relative to the Git repository root:

    shared_folders:
      - docroot/sites/default/files
      - docroot/sites/www.example.com/files


## Environment-specific files

Environment-specific files are configuration files contained in the repository that are used only in a specific staging environment. This enables you to use a common code base both for a testing website instance and for production. You put the configuration files for both environments, for example the application's database credentials, into the repository and define them as environment-specific. Our deployment process then chooses the right configuration file for the right environment.

In the following example, our deployment will create a symbolic link named `.htaccess` and has it point either to `.htaccess.production` or `.htaccess.test`, depending on which website instance the repository is deployed. The same happens for `.htpasswd` and `sites/default/settings.php`.

    env_specific_files:
      docroot/.htaccess:
        production: .htaccess.production
        test: .htaccess.test
      docroot/.htpasswd:
        production: .htpasswd.production
        test: .htpasswd.test
      docroot/sites/default/settings.php:
        production: settings.production.php
        test: settings.test.php

## Upgrading from older Boxfile versions

### From version 1.0 to 2.0

* Prefix public shared folder definitions with `docroot/`.
* Move existing shared folders into the new `docroot` folder on the shared storage.

In version 1.0 of the Boxfile format, path entries were relative to the `docroot` directory. In version 2.0, we changed this in order to enable users to also define private files and directories outside of the application's `docroot`. In 2.0, paths are relative to the Git repository root. Publicly available shared folders need to be modified so they start with `docroot/`.

After changing the Boxfile version of an existing website from 1.0 to 2.0, you'll have to move the permanent storage directories that have already been created under `public` down one level into the newly created `public/docroot` directory.

For example, with version 1.0, a shared folder `wp-content/uploads` was created as `public/wp-content`. After upgrading your Boxfile to version 2.0, the folder needs to be declared as `docroot/wp-content/uploads` and will result in a storage directory `public/docroot/wp-content`. You'll have to manually move the contents of the old directory there.
