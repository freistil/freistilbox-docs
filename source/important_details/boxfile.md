status: published
zendesk-article-id: 201084675
zendesk-article-tags:
  - boxfile
  - deployment

# The Boxfile

The Boxfile is a file of the same name that is stored in the root directory of a single web application's repository. It defines attributes that control the deployment process.

<span class="label warning">WARNING</span> The Boxfile is in YAML format. Please note that YAML does not support tabs for indenting; you need to use one or more spaces.

Your website repository doesn't necessarily contain a Boxfile from the start. So, if you need one or more of the features described below, simply create one.

<span class="label warning">WARNING</span> The file name is case-sensitive. Please make sure that it starts with a capital "B".

Here is some example content for a Boxfile. It first defines a shared folder whose contents need to be available on all web boxes. Then, it lists a set of configuration files that are stored in the repository and need to be activated depending on the staging environment that is assigned to the website.

    version: 1.0
    shared_folders:
      - sites/default/files
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


## Shared folders

Shared folders are part of the application code space but need to be shared between all application servers of a cluster since they are writable by the web application.

Public shared folders are defined in a collection named `shared_folders` as a list of paths relative to the application's document root:

    shared_folders:
      - sites/default/files
      - sites/www.example.com/files

Private shared folders can be created manually via SFTP/SSH in `current/private` and are available to the web application below the path `../private` relative to the application's document root.


## Environment-specific files

Environment-specific files are configuration files contained in the repository that are used only in a specific staging environment. This enables you to use a common code base both for a testing website instance and for production. You put the configuration files for both environments, for example the application's database credentials, into the repository and define them as environment-specific. Our deployment process then chooses the right configuration file for the right environment.

In the following example, our deployment will create a symbolic link named `.htaccess` and has it point either to `.htaccess.production` or `.htaccess.test`, depending on which website instance the repository is deployed. The same happens for `.htpasswd` and `sites/default/settings.php`.

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
