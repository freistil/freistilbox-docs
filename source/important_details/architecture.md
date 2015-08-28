---
title: Distributed Architecture
status: published
zendesk-id: 201084655
---

freistilbox is much more than a single hosted server. It consists ofa multitude of services running on different servers but integrated into a complete hosting platform. Built-in redundancy on many levels allows you to scale the performance and optimize the availability of your web application as you need. The complexity that comes with such a powerful infrastructure is hidden as we take care of everything.

These are the main components of the freistilbox managed hosting platform:

**Edge Router:** The Edge Router accepts incoming requests and decides which freistilbox cluster is responsible for handling it. SSL requests are decrypted immediately so that later stages need to deal with plain HTTP requests only.

**Application Servers:** On the freistilbox hosting platform, your web application is installed on one or more application servers or "boxes" for short. This set of boxes is called your "freistilbox cluster". 

**Load balancer:** In front of each freistilbox cluster, there is a redundant pair of load balancers that distribute incoming requests between all available application boxes. If possible, the content responses are cached on the load balancer so that subsequent requests for the same content can be answered immediately without involving an application box.

**Shell box:** To give you manual access to your website's asset files and the opportunity to do a remote login and execute commands directly in the freistilbox environment, a dedicated box is added to your freistilbox cluster especially for these purposes.

**Backend services:** Your web application will depend on several backend services, for example a MySQL database, a shared storage or an Apache Solr search engine. These services run on dedicated clusters that are usually shared by a limited number of customers.
