---
title: How is freistilbox monitored?
status: published
zendesk-id: 201489275
---

Since it’s important for us to know at any time how well our hosting platform is working, we run several kinds of monitoring systems:

* Health monitoring (“Is everything okay at the moment?”)
* Metrics monitoring (“How did RAM capacity change over the last 48 hours?”
* External website monitoring (“Does www.example.com deliver content to different global locations?”)

As soon as one of these monitoring systems detects behaviour outside of normal parameters an alert goes out to our on-call engineers.

Our monitoring systems are available exclusively to our operations team; we don't expose monitoring data to customers at the moment. We'll be happy to provide you with snapshots of current system metrics, though, if you need insight into the behaviour of your freistilbox cluster. Simply send us a support request.
