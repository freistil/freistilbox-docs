---
title: How can I limit website access to a number of IP addresses?
zendesk-id: 201084505
tags:
  - security
---

# How to limit website access to a number of IP addresses

If you want to limit access to your website instance to a small number of IP
addresses, for example before the official launch, you'd usually use the
following lines in your `.htaccess` file (with Apache 2.2):

```
Order allow,deny
Deny from All
Allow from 1.2.3.4
Allow from 2.3.4.5
```

Here's the equivalent configuration for Apache 2.4:

```
<RequireAny>
  Require ip 1.2.3.4 2.3.4.5
</RequireAny>
```

But because your application boxes don't get their requests directly from your
visitors but via our Edge Routers and the Content Cache/Load Balancer, this will
not work. The sender will always appear to be one of the Load Balancer nodes.

You can get the actual visitor IP address from the HTTP header `X-Forwarded-For`
which is set by our Edge Routers. By evaluating this header, Apache can take
this information into account. Here's a complete configuration snippet that
works with both Apache 2.4 and Apache 2.2:

```
SetEnvIf X-Forwarded-For "1.2.3.4" AllowIP
SetEnvIf X-Forwarded-For "2.3.4.5" AllowIP
<IfModule mod_authz_core.c>
  <RequireAny>
    Require env AllowIP
    Require ip 1.2.3.4 2.3.4.5
  </RequireAny>
</IfModule>
<IfModule !mod_authz_core.c>
  Order allow,deny
  Deny from All
  Allow from env=AllowIP
  Allow from 1.2.3.4
  Allow from 2.3.4.5
</IfModule>
```
