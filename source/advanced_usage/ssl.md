---
title: SSL encryption
status: published
zendesk-id: 201084605
tags:
  - ssl
  - htaccess
---

# SSL encryption

We decrypt incoming SSL requests at the edge of our hosting infrastructure. From
there on, we only need to process plain HTTP requests. This practice is called
"SSL offloading" and has several advantages:

* freistilbox instances do not need to spend computing capacity on SSL, so more
  resources are available to your web application.
* Content caching works for all requests. This saves even more capacity on the
  freistilbox instances and avoids that you need to use "mixed mode" for fast
  delivery.

## Recognizing secure requests

Because SSL requests are decrypted before they reach a freistilbox instance,
your web application will only receive plain HTTP requests. In order to be able
to tell which requests originally came in encrypted, the SSL offloader marks
those with the HTTP header `X-Forwarded-Proto`, setting its value to "https".
Our web servers then parse this HTTP header and set an environment variable
named `HTTPS` to the value `on`.

In your application, you can simply test this variable to see if a request had
been encrypted by its sender.

In PHP:

    if ($_SERVER['HTTPS'] == "on")

This variable is set by PHP for received SSL requests, too, so existing
applications, plugins and modules should work out of the box with our
configuration.

There is a catch with testing for SSL in an `.htaccess` file: While Apache's
`mod_rewrite` has a condition named `HTTPS` built in, its result is true only if
the request actually reached the box in encrypted form -- which will never be
the case with our architecture. Therefore, you need to check the environment
variable of the same name instead:

This will _not_ work:

    RewriteCond %{HTTPS} on

This will work:

    RewriteCond %{ENV:HTTPS} on

We recommend you cover all bases by checking both condititions:

    RewriteCond %{HTTPS} on [OR]
    RewriteCond %{ENV:HTTPS} on

## Redirecting all unsecure requests to https

To enforce https for all requests you can use the following snippet in
.htaccess:

    RewriteCond %{HTTPS} !on
    RewriteCond %{ENV:HTTPS} !on
    RewriteRule ^(.*)$ https://%{HTTP_HOST}/$1 [R=301,L]
