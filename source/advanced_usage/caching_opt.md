---
title: How to optimise caching efficiency
status: published
zendesk-id: 37747137
tags:
  - cache
  - varnish
---

**Caching is the key to optimum website performance. This article describes how you can make sure that your website uses the freistilbox cache servers as efficient as possible.**

## Content caching

Website content can only be cached if its HTTP headers allow that.

In the following cases content **can not be cached**:

* Your website sends HTTP headers that actively prohibit caching (for example, "Cache-control: no-cache")
* Your website sends HTTP headers that make the content individual in any way (for example, cookies)

If your website allows the content for a certain request to be cached, the caching server will deliver this content until it expires. The duration for which cached content gets stored and delivered depends again on certain HTTP headers.

The most important header is "Cache-control". It can contain the value "max-age" which defines how many seconds certain content may be stored in the cache. For example, a value of "max-age=300" means that the cache content will expire after 5 minutes (300s).

You'll find detailed explanations of this and all other HTTP headers that are important for caching in Mobify's "[A Beginner's Guide to HTTP Cache Headers](http://www.mobify.com/blog/beginners-guide-to-http-cache-headers/ "A Beginner's Guide to HTTP Cache Headers")".

So. to see how efficiently certain content of your website can be cached, you need to check its HTTP headers.


### How to check HTTP headers

There are many tools that help you check the HTTP headers of your content. Most current web browsers offer "developer tools" that will display the header information.

Alternatively, you can use the command line shell:

     curl -I http://www.example.com/


### How to avoid unnecessary individual content

This is the most important aspect in terms of caching because as soon as content looks "individual" to the caching server, it will not be cached.

The most common cause of "individualisation" is cookies. If content comes with a cookie, it's obviously meant for this single visitor, so caching it for later requests makes almost no sense. 

To prevent cookies from inadvertently killing your website's cache efficiency, our cache servers will remove every cookie that is not a Drupal or WordPress session cookie. In consequence, plugins, modules or JavaScript add-ons that use cookies **will not work** on freistilbox. If you need to store visitor-specific data, please use the session data functions of your CMS.

Drupal 6 has the unfortunate behaviour that it sends a session cookie for every HTTP request — even if the visitor has not logged in. While an upgrade to Drupal 7 would solve this problem, there is an alternative that requires far less effort: "[Pressflow Drupal](http://pressflow.org/ "Pressflow | Enhanced performance and scalability for Drupal")" is a Drupal distribution that has all the necessary modifications to allow for efficient content caching. In most cases, the switch from "vanilla" Drupal 6 only requires copying the Pressflow Drupal 6 files over the existing distribution. An alternative to installing Pressflow Drupal could be the "[No Anonymous Sessions](https://drupal.org/project/no_anon)" module. It has a few caveats, so check its documentation first.
