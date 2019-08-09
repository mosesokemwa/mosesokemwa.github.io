---
title: "Disabling Ubuntu MOTD Spam"
date: 2019-02-25T01:47:00+03:00
draft: false
---
When you log into an Ubuntu machine using SSH or a console, you’ll see a motd (“message of the day”) printed with some useful system information, as well as some useless marketing spam. The useless marketing spam is the same material you see when you visit [motd.ubuntu.com](motd.ubuntu.com). This is an affront to good taste, and should be disabled.

There are a few ways to disable the MOTD altogether. You can touch the file ``~/.hushlogin``. You can also edit ``/etc/pam.d/sshd`` and remove the lines referring to ``pam_motd.so``. But these measures are a bit extreme. The default Ubutu motd has some useful information in it like the system load, and you might want to keep that information.

If you want to keep the motd minus the marketing spam, edit /etc/default/motd-news and set ENABLED=0. Here’s a handy one-liner that does it using sed:
```bash
# Disable Ubuntu motd spam
$ sudo sed -i 's/^ENABLED=.*/ENABLED=0/' /etc/default/motd-news
```
If you configure your hosts using Ansible, you can use a task like this to achieve the same effect:


```bash
- name: disable ubuntu motd-news
  lineinfile:
    dest: /etc/default/motd-news
    state: present
    regexp: '^ENABLED='
    line: 'ENABLED=0'
```