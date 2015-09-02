---
title: How can I disable PHP in subfolders?
zendesk-id: 201084575
tags:
  - security
---

# How to disable PHP execution in subfolders

If you want to disable code execution in subfolders of your web application, you
can add the following lines to your `.htaccess` file:

```apache
# Forbid access to PHP files in subfolders. 
RewriteCond %{REQUEST_URI} ^.+/.*\.php$ 
RewriteRule ^ index.php [F]
```

With this RewriteRule, requests for files with the ".php" extension outside the
root folder of your application will result in a "403 Forbidden" error. Files in
the top folder (`index.php`, `cron.php`, `update.php` etc.) will still work as
expected; the same applies to URL aliases with the ".php" extension defined
inside the application.

<span class="label warning">WARNING</span> Make sure to add those lines below
the standard rewrite rules for `index.php`, otherwise URL aliases ending in
".php" will not work.

Thanks to Klaus Purer from epiqo.com for this tip!

