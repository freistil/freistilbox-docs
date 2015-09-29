---
title: Domains and DNS
status: published
zendesk-id: 205414355
---

# Domains and DNS

## Domain types

Each of your websites can have as many domain names as necessary. You can choose
between several types of domains that behave differently:

* Main domain
* Alias domains
* Redirect domains

### Main domain

This is the canonical domain name under which you want your website to be known.

### Alias domains

These are alternative domain names under which your website can be reached
additionally to the main domain.

NOTE: In order to avoid a "duplicate content" penalty n search engines, you
should make sure that your website does not serve the same content under
different names. Using Redirect Domains instead may be the better alternative.

### Redirect domains

Visitors that use these domain names get automatically redirected to the site’s
main domain.

## DNS

When your website instance is created, it is assigned a public IP address. In
the Domain Name Service (DNS), this IP address needs to be assigned as an A
record to all domain names you intend to use for the website.

Our ops engineers will happily take care of registering and operating your DNS
for you. We recommend this approach because there are many aspects to running
DNS properly. For example, we’ll make sure that each domain has an SPF records
that authorises your freistilbox servers to use the domain when sending email.
If a domain is managed by us, we can also reduce TTL values temporarily in
advance of important DNS changes to speed up their propagation all over the
internet.
