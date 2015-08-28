---
title: Deploying your web application
status: draft
---

To deploy your Drupal installation to our freistilbox hosting platform, you transfer all the changes you've made to the repository to the central repository. You do this by using a simple command:

    $ git push origin master

By doing a "push", you transfer all changes you've made since you've cloned or updated your local repository from the central repository back to it.

A sophisticated deployment mechanism now takes care that all Drupal frontend servers start to deliver this new version of your Drupal installation. It also chooses the correct configuration file which most of the times will be `settings.production.php`.

<span class="label warning">WARNING</span> Because Git is a distributed version control system, you can clone as many repositories from the central one as you like -- for example in a development team. You need to be careful, though, when you push changes from different repositories. Since these repositories tend to diverge in their commit history, pushing changes from different source repositories can lead to conflicts when those changes need to be merged together on the freistilbox infrastructure. Those conflicts then block all further updates and can only be resolved by our tech support. That's why we recommend using a _central repository_ to first integrate all changes from the different developer repositories and then push everything at once to the hosting platform.
