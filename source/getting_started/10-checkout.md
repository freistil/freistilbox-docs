---
title: Checking out the site repository
status: published
zendesk-id: 201084725
tags:
  - git
---

Since most freistilbox clusters consist of several application boxes, we have to make sure that each update to your web application will be deployed reliably to all of these boxes. That's why we chose a central Git repository as the source for application deployment.

You develop and test your application in a local Git repository (development teams might also use a central site such as Github). If you want a new version deployed on freistilbox, you push your updates to the freistilbox repository. This will automatically trigger the deployment process that installs your new application version on all the boxes of your freistilbox cluster at the same time.


## Getting SSH access

The freistilbox Git repository uses the SSH protocol for authentication and data transfer. Access to your website's Git repository will only work if you have provided us with your public SSH key during creation of your website instance. 

If you'd like to add a key to the access list, simply send it to our engineering support with the site ID of your website instance.


### Using a certain SSH key for Git

If you have more than one SSH key in use, you can configure SSH to use the right private key by adding the following block to your SSH configuration in `~/.ssh/config`:

```bash
Host repo.freistilbox.net
     Hostname       repo.freistilbox.net
     IdentityFile   ~/.ssh/id_rsa.freistilbox
     IdentitiesOnly yes
```

Simply replace the entry after `IdentityFile` with the actual path to your private key file.


## Cloning the freistilbox site repository

Let's first create your local website repository as a copy of the freistilbox repository. Each website has its own Git repository URL as follows:

	SITEID@repo.freistilbox.net:SITEID

For example:

	s123@repo.freistilbox.net:s123

With the following command, you create a working copy of the application repository on your workstation (of course, you'll have to replace the instance details):

	$ git clone s123@repo.freistilbox.net:s123 site123
  
This command will create a directory `site123` containing a copy of the central repository. This local clone will have a connection to its original so you can easily update your local copy from the central repository and transfer your local changes back to the freistilbox platform.


## Excluding files from the repository

From the file `.gitignore`, a hidden file in the root directory of the repository, Git reads a list of names and patterns for files that you don't want to have added to the repository. For example, since you don't want put backup files under version control, you can add the pattern `*.bak` in a separate line to `.gitignore`. 

Another important exception are the asset directories like `sites/default/files`. You have to make Git ignore all possible multisite directory names by using a pattern as described below.

We recommend you also exclude `settings.php`, especially if you want to do a staging workflow with separate website instances. On the freistilbox hosting platform, you can use a different configuration file for each staging instance, for example `settings.production.php` and `settings.staging.php`. Even if you don't intend to do staging, simply use `settings.production.php`.

So, make sure that `.gitignore` contains at least these lines:

	sites/*/files
	settings.php
