---
title: "Can I send or receive email on freistilbox?"
---

# Can I send or receive email on freistilbox?

With freistilbox, we focus on delivering world-class web hosting. Operating an
email service is a completely different area of expertise. While we have
experience in the setup of email infrastructure, running an email service at the
same level of quality as our web hosting platform would require changes that
we're not going to make in the short term. That's why we recommend using
third-party services that made email the centre of their business.

## Sending email

All freistilbox application and shell login boxes are equipped with a Mail
Transfer Agent (MTA) that allows your web application to send email. This alone
doesn't make sure that your emails will be accepted by the recipient, though.
Without authorising our servers to deliver email for your business domain,
there's a high risk they'll quickly get blacklisted as potential spam sources.

Additional measures like including our servers in your domain's [SPF
record](https://en.wikipedia.org/wiki/Sender_Policy_Framework) can lower that
risk. But often even more effort is necessary to ensure your messages will reach
their recipients.

That's why we recommend using a specialised email delivery service in the first
place, especially if you're going to send more email than the occasional
registration notice. Here are a few well-known options for transactional email
delivery:

* [SendGrid](https://sendgrid.com)
* [Mandrill](https://mandrillapp.com)

There are Drupal modules and WordPress modules available that make the
integration of these services into your web application easy. If you need any
help in setting them up, just get in touch with our support team.

## Receiving email

Email is much too critical for business communication to just make it an add-on
service without giving it the focus it deserves. That's why we don't support
receiving email on freistilbox. Instead, we recommend you use a third-party email
provider such as the following:

* [Mailbox](https://mailbox.org/en/)
* [Google Apps for Work](https://apps.google.com)
* [FastMail](https://www.fastmail.com)
