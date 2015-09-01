---
title: How can I limit website access to a number of IP addresses?
zendesk-id: 201084505
tags:
  - security
---

# How to limit website access to a number of IP addresses

If you want to limit access to your website instance to a small number of IP
addresses, for example before the official launch, you'd usually use the
following lines in your `.htaccess` file:

```
Deny from All
Allow from 1.2.3.4
Allow from 2.3.4.5
```

But because your application boxes don't get their requests directly from your
visitors but via our Edge Routers and the Content Cache/Load Balancer, this will
not work. The sender will always appear to be one of the Load Balancer nodes.

You can get the actual visitor IP address from the HTTP header `X-Forwarded-For`
which is provided by our Edge Routers. With a few additional lines, Apache will
take this information into account:

```
Deny from All
SetEnvIF X-Forwarded-For "1.2.3.4" AllowIP
SetEnvIF X-Forwarded-For "2.3.4.5" AllowIP
Allow from env=AllowIP
Allow from 1.2.3.4
Allow from 2.3.4.5
```

