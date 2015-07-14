status: published
zendesk-article-id: 201084665
zendesk-article-tags:
  - deployment

# Central deployment

Distributing your web application code on the multiple nodes of a freistilbox cluster will work only if it is installed completely identical on all cluster nodes at all times. Inconsistencies, for example in the form of different code revisions, will result in website behaviour that would at least confuse your visitors or, in the worst case, break your website. 

To avoid these problems, we provide a centralized deployment process. You need to upload your changes only once; our infrastructure then takes care of distributing them to all affected boxes within seconds.


## Version control with Git

Updating distributed services from a central code base is the ideal task for modern version control systems. We chose Git for that purpose.

Every freistilbox website instance has its own central Git repository that stores its Drupal installation. From this central repository, all the webservers responsible for delivering your site update their local Drupal environment after every change you upload. Technically speaking, they clone the central repository.


## Git repository structure

The Git repository should contain the following items in its root directory:

* the subdirectory `docroot` with your web application code,
* a file named `Boxfile` which controls deployment behaviour,
* and a hidden file named `.gitignore`.

We're going to explain these files and directories in detail below.


### docroot

The `docroot` directory contains the code base of your web application, for example a Drupal distribution. It will be used as document root by our webservers.

<span class="label warning">WARNING</span> `docroot` should only contain application code! Make sure not to put files in there that need to be updated by your application, for example Drupal's `sites/default/files` directory. These should be in a shared folder, as defined in the Boxfile.


### Boxfile

Because the Boxfile documentation needs a bit more space, we've put it on a separate page: [Boxfile][1]


### .gitignore

Your `.gitignore` file should at least contain the following entries:

    /config
    /private
    /tmp

You should also exclude directories that need to be shared between boxes, for example:

    /docroot/sites/*/files

To avoid accidental checkins, we recommend you also exclude environment-specific files like

    /docroot/.htaccess
    /docroot/.htpasswd

[1]: https://freistil.zendesk.com/hc/en-us/articles/201084675
