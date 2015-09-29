---
title: Multi-stage testing
tags:
- git
- staging
- configuration
---

# Multi-stage testing on freistilbox

A modern application development workflow consists of multiple stages: When new
changes are made, they're first tested on the developer's work station. If
everything looks okay, the changes can move on. Before they are uploaded to the
production website though, they commonly undergo User Acceptance Testing on a
staging website instance. In order to be able to test with production
conditions, the staging website usually runs on the same hosting platform as the
production website.

Practicing this staging workflow on freistilbox is easy because you can spin up
as many new website instances on your cluster as you need at no additional cost.

## Application configuration

There's one aspect that complicates things (but, as you'll see, only a bit).
Since the different staging instances use separate resources, they'll require
different configuration settings. For example, each instance will use its own
database, and maybe you'd like to have the staging website password-protected
from prying eyes.

A simple but impractical approach would be to maintain a separate application
repository for each staging instance. For example, you'd have a "testing"
repository that you'd push to the testing instance and a "production" repository
that would be deployed to the production instance. The only difference between
these repositories would be a few configuration files like `.htaccess` or
`wp-config.php`, and you'd have to find a way to synchronise every application
change across your stages. More soon than later, this fragile process would
introduce exactly the mistakes that you wanted to avoid by using a staging
workflow in the first place.

Instead, you'll want to work in a single repository. While you're developing a
new release, you'll push changes to the testing instance and as soon as you're
finished, you'll do a final push to the production instance. And of course,
freistilbox supports you in doing that.

But how can your application use different settings depending on
the stage in which it's being run? The answer is "environment-specific files".
In your [Boxfile](/important_details/boxfile.html), you can declare files that
exist in a different version for each staging instance. That way, you can have a
`settings.production.php` and a `settings.testing.php` and freistilbox will
automatically use the first one in the "production" instance and the second one
in the "testing" instance.

Please see the [Boxfile documentation]((/important_details/boxfile.html)) for
details.

All you need to do in advance is assign the right label to each of your staging
instances. By default, all the website instances on your freistilbox cluster
will be labeled "production". If you'd like us to assign another label to a
specific instance, simply send us a
[support request](/important_details/support.html).

## Working with branches

You can always work out of the initial application code set that you initially
created for your web application. While you're working on something new, you'll
push changes to the testing instance on freistilbox, and when you're finished,
you'll push everything at once to the production instance.

Especially in teams working on different parts of the application at the same
time, it has become a common approach to diverge from the main line of
development for new work. This is called "branching". The master branch (also
called "trunk") usually holds the stable production releases, and ongoing
development work, regardless if it's for a hot fix or a new feature, is done in
separate branches. Every once in a while, you'll push this development branch to
a staging website instance to see if everything is okay.  And when you've finally
reached your development goal, you can merge all the changes done in your branch
back into the master branch and push the new state to production.

freistilbox supports this development workflow and allows you to use different
branches for different staging instances. If you'd like the deployment
process to pull changes for a website instance from another branch than the
default of "master", simply send us a [support request](/important_details/support.html)
telling us the website ID and the branch you'd like us to activate.

