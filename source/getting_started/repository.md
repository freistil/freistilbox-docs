---
title: "Getting started with freistilbox: Code repository"
weight: 2
tags: [ ]
---

# Managing your application code

We've already made a point of describing the differences between a simple
hosting server and the distributed freistilbox architecture. It's because of
these differences that uploading your web application code to freistilbox works
differently, too.

Uploading your Drupal or WordPress to a single server via FTP or SFTP, the
common approach in conventional hosting, wouldn't work well on freistilbox.
Since freistilbox applications can run on any number of boxes in parallel, we needed
to make sure that code updates can be applied to all of them at the same time.
And in order to apply them as fast as possible, we'd have to use a tool to track
the actual few changes coming with an update.

Instead of building this tool ourselves, we chose a robust one that already
existed: the software version control software Git. Git was made with the exact
purpose of tracking changes in a code base and distributing them quickly to
remote locations. Exactly what we need!

So, every freistilbox web application lives in a Git repository. That is the
application code, just to be completely clear. Asset files uploaded by website
users, automatically created database backups and other stuff on the other
hand, are stored separately; we'll cover that later.

If you're not already familiar with Git, we recommend you get acquainted by
reading the [Git Tutorial](http://git-scm.com/docs/gittutorial).

## Create the Git repository

<!-- TODO: Write section -->

## Add your application code

<!-- TODO: Write section -->

## The Boxfile

Whenever you synchronise the changes you made to your local repository with the
freistilbox Hosting Platform in a `git push`, you trigger the freistilbox
deployment process. This process updates the application code on each of your
boxes with your changes. It also does a number of additional touches that
integrate your application with the hosting infrastructure.

What exactly the deployment process does additionally is defined in central
configuration file named `Boxfile`. It has to be located in the root directory
of your website repository. The Boxfile tells freistilbox how to integrate your
application into the hosting environment so it has everything it needs to work.

## Application configuration

freistilbox supports developing and testing in multiple stages. You can read the
details of this feature later. For your first steps, we'll leave it at this: The
`Boxfile` allows you to define certain files in your application code as
environment-specific. At this time, we'll only use the "production" environment,
the website instance that's intended for the public.

### Drupal

Let's take a Drupal application. To keep things simple, we'll declare only one
file as environment-specific: the main configuration file
`sites/default/settings.php`. You'll remember that we've excluded this file from
the Git repository and put in the file `sites/default/setting.production.php`
instead. And this is how you tell freistilbox in the `Boxfile` to use the latter
as the former:

```yaml
env_specific_files:
  sites/default/settings.php:
    production: settings.production.php
```

After it's rolled out your current application code to the production website on
your boxes, the deployment process will automatically create the file
`settings.php` with the contents of the file `settings.production.php` from your
application repository.

### WordPress

<!-- TODO: Write section -->
