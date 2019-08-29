---
title: "Seting up NGINX"
date: 2019-05-25T18:15:14+03:00
draft: false
---

This is a process that I find myself doing over and over again, and for the most part I keep skipping a couple of steps or repeating them.
Hopefully having it here will make my work easier the next time I need to set up NGINX.

##### Setup NGINX

Setup UFW (Uncomplicated Firewall) rules

```bash
sudo ufw allow out 22/tcp
sudo ufw allow out 80/tcp
sudo ufw allow out 443/tcp
```

Lets start by updating our software
```bash
sudo apt-get update && sudo apt-get dist-upgrade -y && sudo reboot
```

Then enable automatic security updates
```bash
sudo dpkg-reconfigure --priority=low unattended-upgrades
```

Securely installing NGINX
```bash
# check NGINX sha256 hash to ensure that it hasn't been somehow compromised
wget --quiet http://nginx.org/keys/nginx_signing.key -O nginx_signing.key && sha256sum nginx_signing.key
# At the time of writing the sha256sum is "dd4da5dc599ef9e7a7ac20a87275024b4923a917a306ab5d53fa77871220ecda"
# Please ensure that you get the same result before proceeding further
sudo apt-key add nginx_signing.key
echo "deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx" | sudo tee --append /etc/apt/sources.list.d/nginx_org_packages_mainline_ubuntu.list
sudo apt-get update && sudo apt-get install -y nginx
```

Install fail2ban to prevent brute force SSH attacks
```bash
sudo apt-get install -y fail2ban
```


#### Create the website root folder
```bash
sudo mkdir /var/www/website
```

Remove the default Nginx configuration and start with a fresh blank file

```bash
sudo mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.orig
sudo nano /etc/nginx/conf.d/default.conf
```

Copy and Paste this and ```cmd+o``` and enter to save then ```cmd+x``` to exit
```bash
server {
    listen 80;
    server_name default_server;
    root /var/www/website;
}
```

Reload Nginx to apply our configuration
```bash
sudo systemctl restart nginx
```



#### Setup Let’s Encrypt
```bash
sudo apt-get install -y git
sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
/opt/letsencrypt/letsencrypt-auto
```

SSL certificates
Replace ```mosesokemwa.com``` with your domain
```bash
export DOMAINS="mosesokemwa.com"
export DIR=/var/www/demo
/opt/letsencrypt/letsencrypt-auto certonly --server https://acme-v01.api.letsencrypt.org/directory -a webroot --webroot-path=$DIR -d $DOMAINS
```

Enter email and agree term then you should see

#### Nginx HTTPS config
Open default.conf for add our SSL Certificate.
```bash
sudo nano /etc/nginx/conf.d/default.conf
```
Modify

Replace ```mosesokemwa.com``` with your domain
```bash
server {
    listen 443 ssl;
    server_name mosesokemwa.com;
    root /var/www/demo;
    ssl_certificate /etc/letsencrypt/live/rabbot.io/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/rabbot.io/privkey.pem;
}
```
Save, Exit and then restart Nginx

```bash
sudo systemctl restart nginx
```

Now we got https://mosesokemwa.com/ up and running! But we not done yet!

#### Automatic Renew
sudo nano /home/recers.sh
Then add below content then Save, Exit.

```bash
#!/bin/sh
# This script renews all the Let's Encrypt certificates with a validity < 30 days
if ! /opt/letsencrypt/letsencrypt-auto renew > /var/log/letsencrypt/renew.log 2>&1 ; then
 echo Automated renewal failed:
 cat /var/log/letsencrypt/renew.log
 exit 1
fi

nginx -t && nginx -s reload
```
Add daily cron job.
```bash
sudo crontab -e
```
Then add below content then Save, Exit.
```bash
@daily /home/recers.sh
```
Make it executable.
```bash
chmod +x /home/recers.sh
```
Now it become zombies yeah! But if you test with SSL analyser, You’ll grade only B grade which is a bummer! Gimme A!