---
title: How can I restrict IP addresses in .htaccess with the load balancer in front?
zendesk-id: 201084505
tags:
  - security
---

Your application boxes don't get their requests directly from your visitors but via our Edge Routers and the Content Cache/Load Balancer. Using the sender IP in `.htaccess` to block certain addresses like in the following snippet can not work because the sender will always be one of the Load Balancer nodes.

```
Deny from All
Allow from 1.2.3.4
Allow from 2.3.4.5
```

But there is a way of checking the real sender address because our Edge Routers provide additional information in the HTTP header `X-Forwarded-For`.

A few additional lines make Apache check this HTTP header, too:

```
Deny from All
SetEnvIF X-Forwarded-For "1.2.3.4" AllowIP
SetEnvIF X-Forwarded-For "2.3.4.5" AllowIP
Allow from env=AllowIP
Allow from 1.2.3.4
Allow from 2.3.4.5
```

