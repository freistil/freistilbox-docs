---
title: How can I configure a really long list of redirects?
tags:
- apache
- redirect
---

# Configuring mass redirects

There are two common solutions for configuring redirects:

* adding a number of RewriteRule entries to .htaccess, or
* redirecting on the application level, for example with Drupal's "Redirect"
  module

If your list of redirects is very long (for example after relaunching a website
with a different URL structure), both methods might become inefficient and
impact site performance negatively.

In this case, the RedirectMap feature of the Apache web server comes in handy.
To use this feature, you define the redirects in a separate text file using a
simple format:

```
/foo http://example.com/
/bar/baz/ http://anotherdomain.example.com/
```

While Apache could read this text file directly, this method, too, would get
inefficient with many hundred entries. (And we actually have customers who need
to define thousands of redirects for a single website.) That's why it's the best
approach to convert the text file to an optimised binary file using the
httxt2dbm command. This command comes with the Apache web server and is
installed on all freistilbox shell servers.

```shell
httxt2dbm -f db -i redirects.txt -o redirects.db
```

Put the resulting `redirects.db` file into your document root and add the following configuration to `.htaccess` (modify the file path according to your website instance):

```apache
RewriteEngine On
RewriteMap redirects dbm=db:/srv/www/freistilbox/clients/c007/s42/current/docroot/redirects.db
RewriteCond ${redirects:$1} !=""
RewriteRule ^(.*)$ ${redirects:$1} [redirect=permanent,last]
```

Even with a huge redirect map, this method will work without significant impact on site responsiveness.

