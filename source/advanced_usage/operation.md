---
title: Requirements for optimal website operation
status: draft
---

## Application optimization

Optimum performance requires the usage of all available caching mechanisms, for example:

* Varnish to reduce application server load
* APC to reduce the PHP interpreter's load
* Memcached to reduce database load
* Application-internal caching to minimize compute load


## De-coupling external dependencies

For optimum availability, external services used by the application need to meet the same availability requirements as the hosting platform.


## Process optimization

Quality Assurance: For optimum availability, proper application function needs to be secured by a thorough testing process.

Technical support: To minimize the time necessary to resolve outages, our technical staff needs to be able to reach a technical contact on the customer’s side during the required on-call time.


## Database optimization

Optimum database performance requires that queries are optimized for the DBMS (indexes, storage engine, query caching etc.)


## Storage optimization

Optimum storage performance requires that the filing structure adheres to requirements of the underlying file system (e.g. by limiting the number of inodes per directory).
