---
title: "Getting started with freistilbox: Your first freistilbox application"
weight: 2
tags: [ dashboard ]
---

# Your first freistilbox application

## How to add a website to your freistilbox cluster

In the [freistilbox Dashboard](/dashboard/), go to the cluster on which you'd
like to add your website and click "Create new website".

![](/images/dashboard_create_website.png)

<!-- TODO: Complete section -->

## How to authorize your SSH keys

For accessing freistilbox, you'll need an SSH key. SSH, "Secure Shell", is a
suite of tools that use an encrypted network protocol for transferring data. 

There are SSH applications for every operating system:

* OpenSSH for Linux (use the distribution's package manager to install)
* OpenSSH for Mac OS X (pre-installed)
* [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/) for Windows

If you haven't used SSH before, you'll need to create your personal SSH key
first. This key will consist of two parts:

1. the public SSH key which you'll have to provide to freistilbox and
1. the private SSH key which you'll have to keep for yourself

You could view the public SSH key as an individual lock which we'll install for
you on your freistilbox website instance. Your private SSH key then is the key
to this lock, so you must keep that one stored securely on your work station
only. Accounts with your public key can only be accessed from computers where
your private key is installed.

As an additional security measure, you should strengthen your private key with a
passphrase that only you can guess. So even if someone got hold of your private
key, they'd have to know your passphrase as well to be able to use it.

Creating your SSH key is simple. You use the `ssh-keygen` command and provide it
with your email address. It'll ask you for the file in which to save your
private key; simply press "Enter" to accept the suggested location in your home
directory. Then enter your passphrase twice and you're done!

```text
$ ssh-keygen -C email@example.com
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/foo/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /Users/foo/.ssh/id_rsa.
Your public key has been saved in id_rsa.pub.
The key fingerprint is:
41:e2:07:cb:21:8d:3d:83:a0:87:f2:fb:6a:a8:45:a1 email@example.com
The key's randomart image is:
+--[ RSA 2048]----+
|  ...=+ .        |
| o  o+=*         |
|+ o   +oo        |
|.+ .   . .       |
|E o     S        |
| . .             |
| .o              |
|....             |
|o....            |
+-----------------+
```

(For creating an SSH key pair in Windows applications like PuTTY, please refer
to the application manual.)

This procedure will create two files, your private key named `id\_rsa` and your
public key named `id\_rsa.pub`. On Linux and Mac OS, you will find them in the
hidden subdirectory `.ssh` under your home directory.

To gain access to freistilbox, you only need to provide us with your _public_
key. Its contents should look like this:

```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQk1gnrZLCoJzU9OYLRl4pbwR1GNkZ3B9O5SkFphyuu3m04O2vRawjr6GLdMwzQd5NPLaIHP9+yHJdGxtHNGEGoocnw3dA2y3C0n0F/yU8ckUueKoZyxFrdEqXDT8w/ndJNGmoa0ST9rdYBMVY6EeCJPVj+xt4s7SwaxdpPybEEmJ2QTzqNKISXi3YJDa6np6i5uIl+CcpwwFLzQXzpAwuGe1xzbIbInrHgK9pWLL1lpX3fbApqRucwIhXT2LsCNZLovGSDd/fIF/pvaowqWBsyZgWN/bOtLbnqKWA9ur2JF8PUlqFWFB/YbbWJ6c5YF/QvL4OMp3AT4ZZwfhoKwZr email@example.com
```

<span class="label important">IMPORTANT</span> Never share your _private_ SSH key
with anyone!

Add your public key to your website by clicking "Add key" in the "SSH keys"
section:

![](/images/dashboard_add_ssh_key.png)

Then copy the contents of the public key file into the text field and submit the
form. You can even paste multiple keys into the text field (one key per row) to
add several keys in one action.

## How to add a database

In order to add a database to your web application, simply click "Add database"
in the "Databases" section.

![](/images/dashboard_add_database.png)

<!-- TODO -->

---

_Next:_ Let's set up the [services](services.html) your web application is
going to need!
