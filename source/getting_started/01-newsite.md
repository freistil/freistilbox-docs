---
title: Creating and using a new site instance
status: published
zendesk-id: 201184339
tags:
  - ssh
---

You can run as many web applications on your freistilbox cluster as you like. For each website, you get a separate site instance that has its own code, domain name(s), database(s), asset files and so on.

Separate site instances are also useful to run different stages of your web application. For example, you can use one site instance for testing a pre-launch version while another instance runs your current production version.

## New site instances

Your first site instance gets created when your freistilbox cluster is provisioned.

When you need additional site instances, please create a ticket with our engineering support. If you already know which domain names you're going to use with the web application, don't forget to mention them.

Our engineering support will create the new site instance(s) for you and tell you all the details you need to get started.


## SSH access

freistilbox uses the Secure Shell (SSH) protocol to give you access to

1. the [Git repository][1] of your site instance, and
2. the [login shell][2] for your site instance.

Please provide our engineering support with all _public SSH keys_ that need to have access to a site instance. Public key files usually have the suffix `.pub`, for example `id_rsa.pub`.

<span class="label warning">WARNING</span> Never hand over private SSH keys! Private SSH keys give the user access to all places where the corresponding public key is authorised.

For more details, see "[Getting started with SSH security and configuration][3]", especially the section "Private and public key pairs for SSH".

[1]: https://freistil.zendesk.com/hc/en-us/articles/201084725
[2]: https://freistil.zendesk.com/hc/en-us/articles/201084695
[3]: http://www.ibm.com/developerworks/aix/library/au-sshsecurity/
