---
title: "How do I set DNS for my website?"
tags: [ dns ]
---

# How do I set up DNS for my website?

For your website to respond to its official domain name, the domain's DNS
records have to point to freistilbox. If your domain is managed by us, you can
simply [contact our support team](/important_details/support.html) and ask them
to point your domain to freistilbox. We'll take care of everything.

Otherwise you'll have to handle this yourself and we've made the process as
simple as possible. All you have to do is to set up a CNAME ("canonical name")
record for your domain (let's assume "www.example.com") that refers to your
cluster's Edge Router address `«CLUSTER ID»-1.freistilbox.net`.  So, if your
cluster ID is "c42", you'll have to enter "c42-1.freistilbox.net" as the CNAME
for "www.example.com".

<span class="label notice">NOTICE</span> In case you have added extra IP
addresses to your setup, you may have to use a different CNAME. Just [contact our
support team](/important_details/support.html) if you're unsure which one to use.

If you'd rather have us manage all these technical aspects, you can transfer
your domain to freistilbox at any time and we'll take it from there.
