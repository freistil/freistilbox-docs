---
title: "Getting started with freistilbox: Deploying your application"
weight: 4
tags: [ ]
---

# Deploying your application

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

<span class="label notice">NOTICE</span> This tutorial assumes you have a basic familiarity
with working in a terminal; all examples here will be for a command-line shell.
You can use other tools with a GUI, of course. Since we can't cover all possible
alternatives, you'll have to adapt the process described here to your tools of
choice.

## Create the Git repository

Clone your website's repository to your machine:

```shell
git clone s007@repo.freistilbox.net:s007 mywebsite
```

In this command, "s007" is the site ID of your website instance. It is used in
two places: first, as the user name (in front of the "at" sign) and second, as
the repository name (after the colon).

<span class="label important">IMPORTANT</span> Git uses SSH to access the
freistilbox repository, so this command will only work after you've added your
SSH public key to your website configuration. If you want to use a special SSH
key that's separate from your usual key, please see the FAQ
"[How can I use a separate SSH key for Git?](/tech_faq/git_ssh_key.html)".

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
