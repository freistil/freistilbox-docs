---
title: Using the login shell
status: published
zendesk-id: 201084695
tags:
  - shell
  - ssh
  - sftp
---

# Using the login shell

Most web applications need to run regular maintenance tasks. From time to time,
site administrators also need to execute ad-hoc commands. On freistilbox all
that is easy because the hosting platform provides you with a separate login
shell for each site instance. In order to run maintenance jobs independent of
the boxes that deliver your application's web content, your freistilbox cluster
comes with its own dedicated shell server.

This shell server's hostname is `cNNs.freistilbox.net` where "NN" is the numeric
ID of your freistilbox cluster, for example `c42s.freistilbox.net`.

Every site instance has its own user account named after its site ID, for
example `s123`.

## SSH

Using the site ID as user name, you can log in to the shell server like this:

    ssh s123@c42s.freistilbox.net

On the shell server, you'll find a complete web application environment with
your application's code and access to its asset files and configuration
snippets.

In the directory `current`, your web application is deployed in the same way as
on the application boxes that run your website.

<span class="label warning">WARNING</span> The target to which `current` points
will change during deployment. If you actually need to update your application
while you work in a shell session, please make sure to `cd ~/current` again
after pushing your changes.

## SFTP

Using the same user account, you can also access your website's asset files via
SFTP. This enables you to transfer files from and to your web application.

Your public shared files (directly available to external HTTP clients) can be
found under `current/docroot`, in the directories you defined as shared folders
in the [Boxfile][1].

Your private shared files (only available to your application) can be found in
`current/private`.

[1]: https://freistil.zendesk.com/hc/en-us/articles/201084675
