---
title: "Getting started with freistilbox: Website instance"
weight: 2
tags: [ dashboard ]
---

# Your first freistilbox application

## Add a website to your freistilbox cluster

<!-- TODO: Write section -->

## SSH access

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

<span class="label important">IMPORTANT</span> Never share your private SSH key
with anyone!

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

For creating an SSH key pair in PuTTY, please refer to the application
manual.

Now you can send us your public SSH key (the one named `id_rsa.pub`) in a
[support request](/important_details/support.html). You can either attach the
file to your message or, and that's the preferred way, simply copy its content
right into your message. It'll look like this:

```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQk1gnrZLCoJzU9OYLRl4pbwR1GNkZ3B9O5SkFphyuu3m04O2vRawjr6GLdMwzQd5NPLaIHP9+yHJdGxtHNGEGoocnw3dA2y3C0n0F/yU8ckUueKoZyxFrdEqXDT8w/ndJNGmoa0ST9rdYBMVY6EeCJPVj+xt4s7SwaxdpPybEEmJ2QTzqNKISXi3YJDa6np6i5uIl+CcpwwFLzQXzpAwuGe1xzbIbInrHgK9pWLL1lpX3fbApqRucwIhXT2LsCNZLovGSDd/fIF/pvaowqWBsyZgWN/bOtLbnqKWA9ur2JF8PUlqFWFB/YbbWJ6c5YF/QvL4OMp3AT4ZZwfhoKwZr email@example.com
```

---

_Next:_ [services](services.html)
