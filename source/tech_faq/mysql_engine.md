---
title: Which MySQL storage engine should I use?
tags:
- mysql
- database
---

# Creating tables with the InnoDB storage engine

When you create new tables for your application database, you should
definitively use InnoDB as the storage engine. InnoDB is in many aspects
superior to MyISAM and offers a multitude of tuning possibilities. InnoDB also
allows for consistent online backups without locking database access. Drupal 7
and up already uses InnoDB by default.

For these reasons, our hosting environment is optimized for InnoDB and we
support only the InnoDB storage engine. If your database schema still uses
MyISAM tables, you should convert them to InnoDB. We've explained below how to
do that.

## Converting a database from MyISAM to InnoDB

### Using SQL

On your local MySQL server, you can convert the database tables easily with the
ALTER TABLE command:

```sql
ALTER TABLE tablename ENGINE=INNODB;
```

Then you can do a database dump and transfer that onto our hosting platform.

### Using the DB Tuner module

With DB Tuner, there's a Drupal module that allows you (among other things) to convert MySQL tables to InnoDB.

### Let our engineers do the conversion

Alternatively, we can convert your tables directly on the hosting platform; simply send us a [support request](/important_details/support.html).

