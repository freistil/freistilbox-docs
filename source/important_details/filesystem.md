---
title: Filesystem structure
status: published
zendesk-id: 201084625
tags:
  - boxfile
  - filesystem
  - storage
---

# Filesystem structure

## Limited write permissions

Since all web application installations on our infrastructure are cloned from a
central Git repository, we have to prevent changes being made directly on the
server. There are multiple reasons for that.

Changing a file directly on the server would

1. cause a permanent conflict with the version in the Git repository. This would
   then cause any further deployment attempts to fail and make tech support
   necessary. (Some of our early customers know this problem from experience...)
1. destroy version consistency throughout the cluster, because the other cluster
   nodes would not reflect that local change.

There is no reliable way of feeding local changes back into the central
repository. That's why we don't allow web applications any write access to their
own distribution files. All changes to your application code need to come from
the central Git repository.

Of course, changes to asset files (by way of file uploads or by the ImageCache
module, for example) must be possible. On our freistilbox hosting platform,
write access is limited to its *public and private file system paths* and the
*temporary directory*.

## Shared storage

Because asset files saved by your application need to be available to all
freistilbox nodes, they are stored on a central storage cluster. Your
application, on the other hand, is stored locally on each freistilbox (for
performance reasons).

That's why you need to tell freistilbox which directories in your application
file tree should be shared between boxes. With Drupal as an example, you'd
declare `sites/default/files` as shared. You do this in your application's
[Boxfile](../boxfile/).

For storage of asset files that need to be protected from direct access by HTTP
clients, freistilbox provides the directory `../private`, relative to your
application's `docroot`. Like the public asset file folders you've defined by
your `Boxfile`, this directory is also stored on the central storage cluster.

## Temporary files

If your application creates temporary files (during uploads, for example),
please use the path `../tmp`, relative to your application's `docroot`. This
directory is created automatically.

