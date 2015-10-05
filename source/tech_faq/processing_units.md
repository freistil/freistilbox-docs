---
title: What are Processing Units?
---

# freistilbox Processing Units

Even a web application that's tuned for optimum delivery performance has a limit
for the number of concurrent requests it can handle running on freistilbox. This
limit is determined by the total number of Processing Units available on your
freistilbox plan. Since freistilbox is a distributed system with services
running on many separate servers fine-tuned for their purpose, listing raw
hardware specifications like conventional hosting providers doesn't make any
sense with freistilbox. Instead, we chose PU as the main performance metric
distinguishing our managed hosting plans.

## "We get errors because all PU are busy!"

When HTTP requests are coming in through the Content Cache faster than your
freistilbox setup can handle them, this will eventually result in all the
Processing Units of your freistilbox cluster being busy. Instead of responding
with the requested content, freistilbox will then deliver a "Request Delivery
Failed" error.

This happens when a) requests are coming in too fast, or b) your application
responds too slow, or c) both. Let's take a look at each of these scenarios.

### Too many concurrent requests

So what can you do if there are too many concurring requests to your application
server? Assuming a perfectly optimised web application, your only option is to
upgrade your freistilbox plan to one with more processing units. But since most
web applications are not yet perfectly optimised, there often are still ways to
reduce the number of requests your application needs to handle.

For example, you could stop promoting your website... Just kidding!

The best way to reduce the number of HTTP requests going through to your
application boxes is to optimise your content for caching. Every request that
can be answered with content from a cache before it reaches your boxes is
one request less that they'll have to handle.  There are several stages
at which cached content will enable a faster response and less load on your
freistilbox cluster:

1. Your website users' web browsers will cache static assets like images, CSS or
   JavaScript files so they don't have to fetch them again with each new page
   they visit. 
1. The freistilbox Content Cache can cache static assets as well as generated
   content such as the pages of your website. 

A well-behaving cache will only store and deliver content as your web
application allows it in its HTTP headers. So, in order to optimise the caching
efficiency of your website, you'll have to define appropriate caching rules for
each content object of your website. See
"[How to optimise your application's caching efficiency](/advanced_usage/caching_opt.html)"
for details.

### Slow request handling

A reason for all your Processing Units being busy could also be that it's taking
your application longer than necessary to respond to requests. Your application
might do something computational-heavy. Or it might actually wait for one of the
services it depends on to deliver a result. freistilbox already provides you
with a number of these services itself, for example MySQL, memcached, Redis or
Solr.

Long-running database queries, for example, are a common cause of busy PU. There
are many reasons queries might take many milliseconds or even several seconds:

* complex queries like multi-table `JOIN`'s that force the database to store
  intermediate results in disk-based temporary tables
* huge result sets that need to be transferred over the network
* missing indices, resulting in full table scans over the whole data set

In the worst of cases, it's actually a combination of all of the above!

Your application might also depend on a third-party service or an external
API. If that service is responding slowly or the connection between it and your
application is congested, this will also cause your Processing Units to stay
busy for far longer than you expected.

Tools like [New Relic](http://newrelic.com) or the
[Drupal devel module](https://www.drupal.org/project/devel) will help you
determine where your application spends its processing time. If you experience
unexpectedly high response times, use these tools to detect bottle necks and 
tuning opportunities.

## "Can you help me find performance bottlenecks?"

Yes, we'd be happy to! Simply send us a [support
request](http://docs.freistilbox.com/important_details/support.html) describing
in detail where you see poor performance with your web application. We'll
provide you with additional insight from our internal performance monitoring and
with helpful tips from years of experience in running high-performance websites.

Please note that in-depth application performance analysis and optimisation is
not covered by our free hosting support and will require an individual
consulting process.
