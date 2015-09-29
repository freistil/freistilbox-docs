---
title: Does freistilbox make backups?
tags:
- backup
---

# Backups

Every 24h, freistilbox makes backups of your website data:

* Git repository
* Database
* Asset files

We hold on to backups for a minimum of 5 days.

## Git repository

The application repository can only be restored as a whole. Since you've
probably got a clone of the repository that's more recent than our backup, we
can alternatively wipe the freistilbox repository so you can simply push your
data again.

## Database

Databases are backed up as logical dumps. If you need to restore a database
backup, we can make the dump available to you in your website's file storage.

## Asset files

Asset files can be restored by our operations team directly to their original
location.
