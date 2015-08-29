---
title: Why is allow_url_fopen() disabled?
zendesk-id: 201084565
tags:
  - security
---

With regards to security, we follow the "Shared Responsibility" principle: our operations team manages all parts of the hosting platform while our customers take care of their web applications. The downside of this approach is that since we don't control the application layer, we can't ensure that security on this level is as tight as it should be.

One particular security risk is including remote content by using the PHP function `fopen()` with an external URL. We decided to disable the use of this function by default.

If you find error messages like the ones below in your logs, then your application probably tries (unsuccessfully) to include remote content:

* `Warning: fopen() [function.fopen]: URL file-access is disabled in the server configuration in /.../ on line (...)`
* `Warning: file_get_contents() [function.file-get-contents]: URL file-access is disabled in the server configuration in /.../ on line (...)`
* `Warning: include() [function.include]: URL file-access is disabled in the server configuration in /.../ on line (...)`
* `Warning: getimagesize() [function.getimagesize]: URL file-access is disabled in the server configuration in /.../ on line (...)`
* `Warning: readfile() [function.readfile]: URL file-access is disabled in the server configuration in /.../ on line (...)`

In this case, please take a look at the following references. There are better -- i.e. more secure -- alternatives to using `fopen()` with an external URL:

* [Drupal 7 `drupal_http_request()`](http://api.drupal.org/api/drupal/includes--common.inc/function/drupal_http_request/7)
* [PHP Client URL Library](http://php.net/manual/en/book.curl.php)

In a detailed blog entry, Heather Goff lists [examples how to replace fopen()](http://goffgrafix.com/blog/index.php/2010/04/if-your-server-sets-the-allow_url_fopen-and-allow_url_include-php-directives-off/) when accessing third party resources.

If these alternatives don't work for you for some reason, please contact our [technical support](/important_details/support.html). We'll work out a suitable solution with you.

