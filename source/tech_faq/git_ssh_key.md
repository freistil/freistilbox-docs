title: How can I use a separate SSH key for Git?
status: published
zendesk-id: 204148435
tags: [ git ssh ]

If you have more than one SSH key in use, you can configure SSH to use the right private key by adding the following block to your SSH configuration in `~/.ssh/config`:

```bash
Host repo.freistilbox.net
     Hostname       repo.freistilbox.net
     IdentityFile   ~/.ssh/id_rsa.freistilbox
     IdentitiesOnly yes
```

Simply replace the entry after `IdentityFile` with the actual path to your private key file.
