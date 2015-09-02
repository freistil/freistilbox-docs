---
title: How do I configure cron jobs?
tags:
- cron
---

# How to define regular cron jobs

You can run regular cron jobs on your freistilbox cluster's shell host. Log in via SSH and and create the crontab as explained below.

Log in to a site's SSH account:

```shell
ssh s123@c23s.freistilbox.net
```

Run the `crontab` command to edit this user's crontab:

```
crontab -e
```

For example, to invoke `drush cron` every 10 minutes, add a line like this:

```
*/10 * * * * /usr/local/bin/drush -r ~/current/docroot cron > /dev/null 2>&1
```

(The part starting with `>` makes cron discard any output of the `drush`
command.)

See the Ubuntu [Cron Howto](https://help.ubuntu.com/community/CronHowto#Using_Cron) for more details.
