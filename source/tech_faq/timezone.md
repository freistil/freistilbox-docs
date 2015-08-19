---
title: Why is the server time running ahead/behind of my own?
status: published
zendesk-id: 201084445
tags: [ time log ]
---

There might be a difference between your local time and the clock on our servers. This is not a problem.

Not only are our customers distributed over different timezones, so is our team, too. So, regardless of which timezone we choose for running our server clocks, it'll always be "wrong" for a number of people. 

Running servers on different timezones would not only make things more confusing, it would even make it impossible for us to easily correlate log entries when we have to diagnose errors or other events between servers in our distributed IT architecture.

That's why we run the clocks of all of our servers in the neutral timezone UTC ([Coordinated Universal Time](http://en.wikipedia.org/wiki/Coordinated_Universal_Time)). Since UTC is the primary standard by which the world regulates clocks and time, it's the most simple way of dealing with timezone differences. Everyone only needs to know their local offset to UTC.

Furthermore, the fact that UTC doesn't have the incontinuities caused by daylight saving time (where in spring, one hour is lost, and in fall, one hour even gets repeated), makes UTC the ideal choice for running server clocks.
