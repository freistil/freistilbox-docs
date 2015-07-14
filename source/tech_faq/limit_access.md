title: How can I limit access to the website to authorized users?
status: published
zendesk-article-id: 201084425
tags: [ htaccess htpasswd security ]


There are times like, for example, a pre-launch phase, during which you want to limit access to your website; unauthorized visitors shouldn&rsquo;t even get presented with a login page. In this article, you&rsquo;ll find a tutorial how to achieve this. We used the following example data:

*   Website ID: s42

## Enable basic HTTP authentication

As a first step, you activate HTTP authentication so a visitor first has to enter login credentials to gain access to the website. To this purpose, append the following lines to the file `.htaccess` which should be placed in the docroot directory of your repository:

    AuthType Basic  
    AuthName "Website Login"  
    AuthUserFile /srv/www/freistilbox/clients/c11000/s42/current/docroot/.htpasswd
    Require valid-user

On the line starting with `AuthUserFile`, use your own website&rsquo;s ID instead of &ldquo;s42&rdquo;.

## Generate an encrypted password

Then, you&rsquo;ll have to create a text file named `.htpasswd`, also in the `docroot` directory. This file contains all users allowed to access the website, together with their encrypted passwords.

If you have access to an Apache server installation, you can use its `htpasswd` command to create the file `.htpasswd`:

    $ htpasswd -c .htpasswd admin

#### Info

If you want to add other users, leave off the option -c because it would create a new, empty file.

Alternatively, the website [AskApache](http://www.askapache.com/online-tools/htpasswd-generator/) will help you. Just enter a user name and password into the form and choose &ldquo;Generate .htpasswd&rdquo;. You&rsquo;ll find the necessary information in the rectangle titled &ldquo;.htpasswd using all 4 algorithms&rdquo;:

    admin:Protected By AskApache:5b8e5bc85154313d6400921a8161c5a4  
    admin:$apr1$lHVjK05m$IfGnV3hA.uPAldtg2PLNk1  
    admin:{SHA}0DPiKuNIrrVmD8IUCuw1hQxNqZc=  
    admin:TYLxBt/ftyi3w

All lines contain the user name and the password, each encrypted with a different technique. We suggest using the line where the encrypted password after the colon starts with `$apr1$` (which signifies MD5 encryption). Copy this line into your `.htpasswd` file.

## Deploy your changes

Commit both files, `.htaccess` and `.htpasswd`, to your repository and push it to the freistilbox platform. Your website is now protected from unauthorized looks.
