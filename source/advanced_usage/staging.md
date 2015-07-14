title: Doing multi-stage testing

Modern application development goes through different stages: First, changes to an application are tested during development, usually locally on the developer's work station. Before they are uploaded to the production website though, they often undergo User Acceptance Testing on a staging website. In order to be able to test with production conditions, the staging website usually also sits on the hosting platform.

In staging, your application's configuration will probably be different, though. Maybe you'd like to have the staging website password-protected, and you certainly don't want to use the production database in your tests!

So, how can you run your application with different configurations, depending on the stage in which it's being run? One thing is clear: It would be very inconvenient if you had to maintain a separate application repository for your staging website. The only difference between these repositories would be a few configuration files like `.htaccess` or `wp-config.php`, and you'd have to make every other change to your application code twice. For example, you'd have to add a new module or plugin first in the staging repository and then in the production repository. More sooner than later, this would introduce mistakes that you wanted to avoid by staging in the first place.

freistilbox takes a different approach: You simply use the same repository both for the staging 