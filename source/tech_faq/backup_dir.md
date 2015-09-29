---
title: Where can my application put backup files?
zendesk-id: 201084585
tags:
  - backup
  - storage
  - filesystem
---

# Where to store backup files

Anonymous site visitors must not be able to download backups of your website
database. That's why you should use a `private` directory next to (and thus
outside of) your application's `docroot` as a protected assets path. 

In your `Boxfile`, declare the "private" directory as permanent storage (see the
[Boxfile](/important_details/boxfile.html) documentation for details):

```yaml
version: 2.0
shared_folders:
  - private
```

## Drupal

Configure the protected asset path on the File System page (_Administer >
Configuration > Media: File system_) as "`../private`". Here, the "Backup &
Migrate" module will automatically create a subdirectory named `backup_migrate`
for its backups.

## Access via SSH/SFTP

When you view your assets directory via SSH/SFTP, you'll find your backups below
`current/private`.
